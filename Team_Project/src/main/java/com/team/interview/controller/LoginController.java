package com.team.interview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
  @RequestMapping("/customLogin")
  public String login(){
    return "/security/customLogin";
  }
}
