package com.team.interview.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import com.team.interview.security.handler.CustomLoginSuccessHandler;
import com.team.interview.security.service.CommonOAuth2UserDetailsService;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

  @Autowired
  public AuthenticationFailureHandler authenticationFailureHandler;

  @Autowired
  public CommonOAuth2UserDetailsService commonOAuth2UserDetailsService;

  @Bean
  PasswordEncoder passwordEncoder(){
    return new BCryptPasswordEncoder();
  }

  @Override
  protected void configure(HttpSecurity http) throws Exception {

    http
    .csrf().disable()
    .authorizeRequests()
    .antMatchers("/sample/all").permitAll()
    .antMatchers("/sample/member").hasAnyRole("USER","COMPANY", "ADMIN")
    .antMatchers("/sample/company").hasAnyRole("COMPANY","ADMIN")
    .antMatchers("/sample/admin").hasRole("ADMIN")
    .antMatchers("/mypage/*").hasAnyRole("USER","COMPANY", "ADMIN")
    .antMatchers("/review/board_review_detail*").hasAnyRole("USER","COMPANY", "ADMIN")

    .and()
    .formLogin()
    .loginPage("/userLogin")                    // controller mapping
    .loginProcessingUrl("/login_proc")     
    .defaultSuccessUrl("/")
    .failureHandler(authenticationFailureHandler)
    .permitAll()

    .and()
    .logout()
    .logoutUrl("/logout")   // 기본 로그아웃 경로는 /logout 이고 로그아웃 된 후에 디폴트 이동경로는 /customLogin?logout이다.
    .logoutSuccessUrl("/")
    //    .logoutSuccessHandler(null)
    .deleteCookies("JSESSIONID")
    .clearAuthentication(true)
    .invalidateHttpSession(true)

    .permitAll()

    .and()
    .exceptionHandling()
    .accessDeniedPage("/403")

    .and()
    .oauth2Login()
    .userInfoEndpoint()
    .userService(commonOAuth2UserDetailsService);

    //    http.oauth2Login().successHandler(successHandler());

    http.sessionManagement()
    .maximumSessions(1)  // 같은 아이디로 1명만 로그인 할 수 있음 한 사용자가 몇 개의 세션까지 사용가능할지 여부로, 1로 하면 동시 접속 불가 설정을 할 수 있다.
    .expiredUrl("/userLogin") /* session 만료시 이동 페이지*/
    .maxSessionsPreventsLogin(false); // 신규 로그인 사용자의 로그인이 허용되고, 기존 사용자는 세션아웃 됨
    /*
     * - true일 경우 : 나중에 접속한 사용자 로그인 방지
     * 
     * - false일 경우 : 먼저 접속한 사용자 logout 처리
     */
  }

  @Bean
  public AuthenticationSuccessHandler successHandler() {
    return new CustomLoginSuccessHandler(passwordEncoder());
  }

  //logout 후 login할 때 정상동작을 위함
  /*
   * sessionRegistry(sessionRegistry()); 를 추가하지 않으면 사용자가 Logout 후 다시 Login 할 때
   * "Maximum sessions of 1 for this principal exceeded" 에러를 발생시키며 로그인 되지 않는다
   */
  @Bean
  public SessionRegistry sessionRegistry() {
    return new SessionRegistryImpl();
  }

  @Bean public ServletListenerRegistrationBean<HttpSessionEventPublisher> httpSessionEventPublisher() { 
    return new ServletListenerRegistrationBean<HttpSessionEventPublisher>(new HttpSessionEventPublisher()); 
  }


  @Override
  // js, css, image 설정은 보안 설정의 영향 밖에 있도록 만들어주는 설정.
  public void configure(WebSecurity web) throws Exception {
    web.ignoring().requestMatchers(PathRequest.toStaticResources().atCommonLocations());
  }
}