package com.team.interview.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import com.team.interview.security.handler.CustomLoginSuccessHandler;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

  @Bean
  PasswordEncoder passwordEncoder(){
    return new BCryptPasswordEncoder();
  }

  @Override
  protected void configure(HttpSecurity http) throws Exception {

    http.authorizeRequests()
    .antMatchers("/sample/all").permitAll()
    .antMatchers("/sample/member").hasRole("USER");

    http.formLogin(); //인가/인증에 문제시 로그인 화면
    http.csrf().disable();

    http.oauth2Login().successHandler(successHandler());
  }

  @Bean
  public AuthenticationSuccessHandler successHandler() {
    return new CustomLoginSuccessHandler(passwordEncoder());
  }


  //  @Override
  //  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
  //
  //    auth.inMemoryAuthentication().withUser("user1") //사용자 계정은 user1
  //    .password("$2a$10$qbTVRGiC8RePIsMz4z/QP.LjBmLOMGXBCkmW2comzfNaoeidd5/aa") //1111 패스워드 인코딩
  //    .roles("USER");
  //
  //  }

  //  @Autowired
  //  private DataSource dataSource;

  //  @Override
  //  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
  //    //    System.out.println(passwordEncoder().encode("123"));
  //
  //    auth.jdbcAuthentication()
  //    .dataSource(dataSource)
  //    .usersByUsernameQuery("select email as username, password, enabled" // 스프링 시큐리티가 사용자 인증에 사용하는 컬럼 이름은 username과 password이다.
  //        + " from tbl_member where email = ?") // 해당 사용자가 있는지 먼저 조회
  //    .authoritiesByUsernameQuery("select email as username, auth as authority " // 사용자가 있다면 사용자의 역할을 구해온다
  //        + " from tbl_member_auth where email = ?")
  //    .passwordEncoder(new BCryptPasswordEncoder()); // 입력한 비밀번호를 암호화해서 데이터베이스의 암호와 비교를 해서 올바른 값인지를 검증한다
  //  }


}