package com.team.interview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/interview")
public class InterviewController {
	
	@RequestMapping(value="/")
	public ModelAndView interviewMain() {
		ModelAndView mav = new ModelAndView("interview/main");
		mav.addObject("board-total", "board/total");
		return mav;
	}
	
	@RequestMapping(value="/mentor")
	public ModelAndView interviewMentor() {
		ModelAndView mav = new ModelAndView("interview/mentor");
		mav.addObject("board-total", "board/total");
		return mav;
	}
	
	@RequestMapping(value="/mentor/register")
	public ModelAndView interviewMentorRegister() {
		ModelAndView mav = new ModelAndView("interview/mentor_form");
		mav.addObject("board-total", "board/total");
		return mav;
	}
	
	@RequestMapping(value="/run")
	public ModelAndView interviewRun() {
		ModelAndView mav = new ModelAndView("interview/run");
		mav.addObject("board-total", "");
		return mav;
	}
	
	@RequestMapping(value="/recruit")
	public ModelAndView interviewRecruit() {
		ModelAndView mav = new ModelAndView("interview/recruit");
		mav.addObject("board-total", "");
		return mav;
	}
	
	@RequestMapping(value="/result")
	public ModelAndView interviewResult() {
		ModelAndView mav = new ModelAndView("interview/result");
		mav.addObject("board-total", "");
		return mav;
	}
}
