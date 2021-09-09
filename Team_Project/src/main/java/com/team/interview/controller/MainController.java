package com.team.interview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	@RequestMapping(value="/")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("main");
		return mav;
	}
	
	@RequestMapping(value="/about")
	public ModelAndView about() {
		ModelAndView mav = new ModelAndView("about");
		return mav;
	}
	
	@RequestMapping(value="/contact")
	public ModelAndView contact() {
		ModelAndView mav = new ModelAndView("contact");
		return mav;
	}
}
