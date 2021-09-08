package com.team.interview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
  @RequestMapping(value="/")
  public ModelAndView main() {
    ModelAndView mav = new ModelAndView("main");
    mav.addObject("main", "main");
    return mav;
  }

  @GetMapping("/zandiTest")
  public String zandi(){
    return "zandi";
  }
}
