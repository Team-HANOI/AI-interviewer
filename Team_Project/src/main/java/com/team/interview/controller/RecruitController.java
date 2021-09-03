package com.team.interview.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.interview.service.RecruitService;
import com.team.interview.vo.Recruit;

@Controller
@RequestMapping(value="recruit")
public class RecruitController {
	@Autowired
	RecruitService recruitService;
	
//	@RequestMapping(value="/")
//	public ModelAndView recruitList() {
//		ModelAndView mav = new ModelAndView("recruit/list");
//		mav.addObject("","");
//		return mav;
//	}
	
	// shows recruit list
	@RequestMapping(value="/")
	public ModelAndView serachAll() {
		ModelAndView mav = new ModelAndView("recruit/list");
		try {
			List<Recruit> recruits = recruitService.searchAll();
			mav.addObject("recruits",recruits);
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("error", e.getMessage());
		}
		return mav;
	}
	
	@RequestMapping(value="/form")
	public ModelAndView recruitForm() {
		ModelAndView mav = new ModelAndView("recruit/form");
		mav.addObject("page","recruit/list");
		return mav;
	}
	
	@RequestMapping(value="/form", method=RequestMethod.POST)
	public ModelAndView addRecruit(@ModelAttribute("recruit")
	Recruit recruit) {
		ModelAndView mav = new ModelAndView("recruit/list");
		try {
			recruit.setId(10);
			recruit.setEmail("gogo2@com.com");
			recruitService.addRecruit(recruit);
			List<Recruit> recruits = recruitService.searchAll();
			mav.addObject("recruits",recruits);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
}
