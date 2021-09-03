package com.team.interview.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@Order(2)
public class CompanyConfigurationAdapter extends WebSecurityConfigurerAdapter {

  public CompanyConfigurationAdapter() {
    super();
  }

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http.antMatcher("/user*")
    .authorizeRequests()
    .anyRequest()
    .hasRole("USER")

    .and()
    .formLogin()
    .loginPage("/loginUser")
    .loginProcessingUrl("/user_login")
    .failureUrl("/loginUser?error=loginError")
    .defaultSuccessUrl("/userPage")

    .and()
    .logout()
    .logoutUrl("/user_logout")
    .logoutSuccessUrl("/protectedLinks")
    .deleteCookies("JSESSIONID")

    .and()
    .exceptionHandling()
    .accessDeniedPage("/403")

    .and()
    .csrf().disable();
  }
}