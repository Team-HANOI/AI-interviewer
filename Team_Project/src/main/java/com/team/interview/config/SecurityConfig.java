//package com.team.interview.config;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.builders.WebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.web.authentication.AuthenticationFailureHandler;
//import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
//import com.team.interview.security.service.CustomOAuth2UserDetailsService;
//
//@Configuration
//public class SecurityConfig extends WebSecurityConfigurerAdapter {
//
//  @Autowired
//  public CustomAuthenticationFailureHandler authenticationFailureHandler;
//
//  @Autowired
//  public CustomOAuth2UserDetailsService CustomOAuth2UserDetailsService;
//
//  @Autowired
//  public AuthenticationSuccessHandler authenticationSuccessHandler;
//
//  @Autowired
//  public BCryptPasswordEncoder bCryptPasswordEncoder;
//
//  public SecurityConfig() {
//    super();
//  }
//
//  @Override
//  protected void configure(HttpSecurity http) throws Exception {
//
//    http
//    .authorizeRequests()
//    .antMatchers("/sample/all").permitAll()
//    .antMatchers("/sample/member").hasAnyRole("USER","COMPANY" ,"ADMIN")
//    .antMatchers("/sample/company").hasAnyRole("COMPANY", "ADMIN")
//    .antMatchers("/sample/admin").hasRole("ADMIN")
//    //    .antMatchers("/all/**").permitAll()
//    //    .antMatchers("/member/**").hasAnyRole("USER","ADMIN","COMPANY")
//    //    .antMatchers("/admin/**").hasRole("ADMIN")
//
//    .and()
//    .formLogin()
//    .loginPage("/userLogin")                    // controller mapping
//    .loginProcessingUrl("/user_login")     
//    .defaultSuccessUrl("/")
//    .failureHandler(authenticationFailureHandler)
//    .permitAll()
//
//    .and()
//    .logout()
//    .logoutUrl("/logout")   // 기본 로그아웃 경로는 /logout 이고 로그아웃 된 후에 디폴트 이동경로는 /login?logout이다.
//    .logoutSuccessUrl("/")
//    //    .logoutSuccessHandler(null)
//    .permitAll()
//
//    .and()
//    .oauth2Login()
//    .userInfoEndpoint()
//    .userService(CustomOAuth2UserDetailsService);
//
//    http.csrf().disable();
//
//    http.oauth2Login().successHandler(authenticationSuccessHandler);
//  }
//
//  @Override
//  // js, css, image 설정은 보안 설정의 영향 밖에 있도록 만들어주는 설정.
//  public void configure(WebSecurity web) throws Exception {
//    web.ignoring().requestMatchers(PathRequest.toStaticResources().atCommonLocations());
//  }
//
//
//  //  @Override
//  //  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//  //
//  //    auth.inMemoryAuthentication().withUser("user1") //사용자 계정은 user1
//  //    .password("$2a$10$qbTVRGiC8RePIsMz4z/QP.LjBmLOMGXBCkmW2comzfNaoeidd5/aa") //1111 패스워드 인코딩
//  //    .roles("USER");
//  //
//  //  }
//
//  //  @Autowired
//  //  private DataSource dataSource;
//
//  //  @Override
//  //  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//  //    //    System.out.println(passwordEncoder().encode("123"));
//  //
//  //    auth.jdbcAuthentication()
//  //    .dataSource(dataSource)
//  //    .usersByUsernameQuery("select email as username, password, enabled" // 스프링 시큐리티가 사용자 인증에 사용하는 컬럼 이름은 username과 password이다.
//  //        + " from tbl_member where email = ?") // 해당 사용자가 있는지 먼저 조회
//  //    .authoritiesByUsernameQuery("select email as username, auth as authority " // 사용자가 있다면 사용자의 역할을 구해온다
//  //        + " from tbl_member_auth where email = ?")
//  //    .passwordEncoder(new BCryptPasswordEncoder()); // 입력한 비밀번호를 암호화해서 데이터베이스의 암호와 비교를 해서 올바른 값인지를 검증한다
//  //  }
//
//
//}
//
