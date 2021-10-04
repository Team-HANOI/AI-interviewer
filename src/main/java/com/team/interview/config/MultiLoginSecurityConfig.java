package com.team.interview.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import com.team.interview.dao.CompanyDAO;
import com.team.interview.dao.MemberDAO;
import com.team.interview.security.service.CompanyUserDetailsServiceImpl;
import com.team.interview.security.service.CommonOAuth2UserDetailsService;
import com.team.interview.security.service.CommonUserDetailsService;

//@EnableWebSecurity
public class MultiLoginSecurityConfig {

  //  @Configuration
  //  @Order(-1)                                                        
  public static class CompanySecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    public CompanyAuthenticationFailureHandler companyAuthenticationFailureHandler;

    @Autowired
    public AuthenticationSuccessHandler authenticationSuccessHandler;

    @Autowired
    public BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private  CompanyDAO companyDAO;
    @Autowired
    private  MemberDAO memberDAO;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
      http.csrf().disable();
      http
      .requestMatchers().antMatchers("/sample/company")
      .and()
      .authorizeRequests().anyRequest().hasAnyRole("COMPANY", "ADMIN");
      http
      .formLogin()
      .loginPage("/companyLogin")                    // controller mapping
      .loginProcessingUrl("/do")     
      .defaultSuccessUrl("/")
      .failureHandler(companyAuthenticationFailureHandler)
      .permitAll();

      http
      .logout()
      .logoutUrl("/logout")   // 기본 로그아웃 경로는 /logout 이고 로그아웃 된 후에 디폴트 이동경로는 /customLogin?logout이다.
      .logoutSuccessUrl("/")
      //    .logoutSuccessHandler(null)
      .deleteCookies("JSESSIONID")
      .invalidateHttpSession(false)
      .permitAll()

      .and()
      .exceptionHandling()
      .accessDeniedPage("/403");

    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
      auth.userDetailsService(new CompanyUserDetailsServiceImpl(memberDAO, companyDAO)).passwordEncoder(bCryptPasswordEncoder);
    }
  }

  //  @Configuration
  //  @Order(1)
  public static class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    public CommonAuthenticationFailureHandler commonAuthenticationFailureHandler;

    @Autowired
    public CommonOAuth2UserDetailsService CustomOAuth2UserDetailsService;

    @Autowired
    public AuthenticationSuccessHandler authenticationSuccessHandler;

    @Autowired
    public BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    private  CompanyDAO companyDAO;
    @Autowired
    private  MemberDAO memberDAO;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
      http
      .authorizeRequests()
      .antMatchers("/sample/member").hasAnyRole("USER","COMPANY" ,"ADMIN")
      .antMatchers("/sample/admin").hasRole("ADMIN")
      .and()
      .formLogin()
      .loginPage("/userLogin")                    // controller mapping
      .loginProcessingUrl("/doUserLogin")     
      .defaultSuccessUrl("/")
      .failureHandler(commonAuthenticationFailureHandler)
      .permitAll()

      .and()
      .logout()
      .logoutUrl("/logout")   // 기본 로그아웃 경로는 /logout 이고 로그아웃 된 후에 디폴트 이동경로는 /customLogin?logout이다.
      .logoutSuccessUrl("/")
      //      .logoutSuccessHandler(null)
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


    // 멤버 인증
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
      auth.userDetailsService(new CommonUserDetailsService(memberDAO, companyDAO)).passwordEncoder(bCryptPasswordEncoder);
    }
  }

}