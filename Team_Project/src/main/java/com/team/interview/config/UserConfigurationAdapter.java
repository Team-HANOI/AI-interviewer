//package com.team.interview.config;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.core.annotation.Order;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.web.authentication.AuthenticationFailureHandler;
//import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
//import com.team.interview.security.handler.CustomLoginSuccessHandler;
//import com.team.interview.security.service.CustomOAuth2UserDetailsService;
//
//@Configuration
//@Order(1)
//public class UserConfigurationAdapter extends WebSecurityConfigurerAdapter {
//
//  @Autowired
//  public AuthenticationFailureHandler authenticationFailureHandler;
//
//  @Autowired
//  public CustomOAuth2UserDetailsService CustomOAuth2UserDetailsService;
//
//  public UserConfigurationAdapter() {
//    super();
//  }
//
//  @Override
//  protected void configure(HttpSecurity http) throws Exception {
//    http
//    //    .antMatcher("/admin*")
//    .antMatcher("/sample/member")
//    .authorizeRequests()
//    .anyRequest()
//    .hasAnyRole("USER","COMPANY" ,"ADMIN")
//
//    .and()
//    .formLogin()
//    .loginPage("/userLogin")
//    .loginProcessingUrl("/user_login")
//    //    .failureUrl("/loginAdmin?error=loginError")
//    .failureHandler(authenticationFailureHandler)
//    .defaultSuccessUrl("/")
//    .permitAll()
//
//    .and()
//    .logout()
//    .logoutUrl("/user_logout")
//    .logoutSuccessUrl("/protectedLinks")
//    .deleteCookies("JSESSIONID")
//    .permitAll()
//
//
//    .and()
//    .exceptionHandling()
//    .accessDeniedPage("/403")
//
//    .and()
//    .csrf().disable();
//
//    http.oauth2Login()
//    .userInfoEndpoint()
//    .userService(CustomOAuth2UserDetailsService);
//
//    http.oauth2Login().successHandler(successHandler());
//
//  }
//}