package com.team.interview.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import com.team.interview.security.service.CustomOAuth2UserDetailsService;

@Configuration
@Order(1)
public class UserConfigurationAdapter extends WebSecurityConfigurerAdapter {

  @Autowired
  public CustomAuthenticationFailureHandler authenticationFailureHandler;

  @Autowired
  public CustomOAuth2UserDetailsService CustomOAuth2UserDetailsService;

  @Autowired
  public AuthenticationSuccessHandler authenticationSuccessHandler;

  @Autowired
  public BCryptPasswordEncoder bCryptPasswordEncoder;

  public UserConfigurationAdapter() {
    super();
  }

  @Override
  protected void configure(HttpSecurity http) throws Exception {

    http
    .authorizeRequests()
    //    .antMatchers("/sample/all").permitAll()
    .antMatchers("/sample/member").hasAnyRole("USER","COMPANY" ,"ADMIN")
    //    .antMatchers("/sample/company").hasAnyRole("COMPANY", "ADMIN")
    //    .antMatchers("/sample/admin").hasRole("ADMIN")
    //    .antMatchers("/all/**").permitAll()
    //    .antMatchers("/member/**").hasAnyRole("USER","ADMIN","COMPANY")
    //    .antMatchers("/admin/**").hasRole("ADMIN")

    .and()
    .formLogin()
    .loginPage("/userLogin")                    // controller mapping
    .loginProcessingUrl("/user_login")     
    .defaultSuccessUrl("/")
    .failureHandler(authenticationFailureHandler)
    .permitAll()

    .and()
    .logout()
    .logoutUrl("/logout")   // 기본 로그아웃 경로는 /logout 이고 로그아웃 된 후에 디폴트 이동경로는 /customLogin?logout이다.
    .logoutSuccessUrl("/")
    //    .logoutSuccessHandler(null)
    .deleteCookies("JSESSIONID")
    .permitAll()

    .and()
    .exceptionHandling()
    .accessDeniedPage("/403")

    .and()
    .oauth2Login()
    .userInfoEndpoint()
    .userService(CustomOAuth2UserDetailsService);

    http.csrf().disable();

    http.oauth2Login().successHandler(authenticationSuccessHandler);


  }

  @Override
  // js, css, image 설정은 보안 설정의 영향 밖에 있도록 만들어주는 설정.
  public void configure(WebSecurity web) throws Exception {
    web.ignoring().requestMatchers(PathRequest.toStaticResources().atCommonLocations());
  }



  //
  //  }
}