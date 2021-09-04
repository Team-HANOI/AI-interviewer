package com.team.interview.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.team.interview.security.dto.AuthMemberDTO;

@Controller
public class LoginController {

  @RequestMapping("/userLogin")
  public String userLogin(){
    return "/security/userLogin";
  }

  @RequestMapping("/403")
  public String accessDenied(){
    return "/403";
  }
}
