package com.team.interview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/interview")
public class InterviewStepsController {
	
	@GetMapping("/steps_n")
	public String interviewStpes_n() {
		return "html/steps/s_normal";
	}
	
	@GetMapping("/steps_k")
	public String interviewStpes_k() {
		return "html/steps/s_keyword";
	}
	
	@GetMapping("/steps_m")
	public String interviewStpes_m() {
		return "html/steps/s_mentor";
	}
	
	@GetMapping("/steps_r")
	public String interviewStpes_r() {
		return "html/steps/s_recruit";
	}
}
