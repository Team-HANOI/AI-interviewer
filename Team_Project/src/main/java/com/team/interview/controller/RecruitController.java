package com.team.interview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="recruit")
public class RecruitController {

	@RequestMapping(value="/")
	public ModelAndView recruitList() {
		ModelAndView mav = new ModelAndView("recruit/list");
		mav.addObject("","");
		return mav;
	}
	
	@RequestMapping(value="/form")
	public ModelAndView recruitForm() {
		ModelAndView mav = new ModelAndView("recruit/form");
		mav.addObject("","");
		return mav;
	}
}
