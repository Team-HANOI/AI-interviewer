package com.team.interview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
  @RequestMapping("/userLogin")
  public String login(){
    return "/security/userLogin";
  }
}
