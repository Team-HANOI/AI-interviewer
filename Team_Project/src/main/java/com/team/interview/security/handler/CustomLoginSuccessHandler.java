package com.team.interview.security.handler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import com.team.interview.security.dto.AuthMemberDTO;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

  private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
  private PasswordEncoder passwordEncoder;

  public CustomLoginSuccessHandler(PasswordEncoder passwordEncoder) {
    this.passwordEncoder = passwordEncoder;
  }

  @Override
  public void onAuthenticationSuccess(
      HttpServletRequest request
      , HttpServletResponse response
      , Authentication authentication) throws IOException, ServletException {
    System.out.println("-----------------------");
    System.out.println("onAuthenticationSuccess");

    AuthMemberDTO authMember = (AuthMemberDTO) authentication.getPrincipal();
    boolean fromSocial = authMember.isFromSocial();
    System.out.println("Need Modify Member?" + fromSocial);
    boolean passwordResult = passwordEncoder.matches("1111", authMember.getPw());
    if(fromSocial && passwordResult) {
      redirectStrategy.sendRedirect(request, response, "/member/modify?from=social");
    }
  }
}