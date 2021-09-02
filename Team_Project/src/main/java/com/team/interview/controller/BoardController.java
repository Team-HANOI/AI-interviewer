package com.team.interview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller()
@RequestMapping(value="/board")
public class BoardController {

	@RequestMapping(value="/")
	public ModelAndView boardTotal() {
		ModelAndView mav = new ModelAndView("board/total");
		mav.addObject("board-total", "board/total");
		return mav;
	}
	
	@RequestMapping(value="/total_detail")
	public ModelAndView boardTotalDetail() {
		ModelAndView mav = new ModelAndView("board/total_detail");
		mav.addObject("board-total", "");
		return mav;
	}
	
	@RequestMapping(value="/best_answers")
	public ModelAndView boardBestAnswers() {
		ModelAndView mav = new ModelAndView("board/best_answers");
		mav.addObject("best_answers", "board/best_answers");
		return mav;
	}
	
	@RequestMapping(value="/best_answers/detail")
	public ModelAndView boardBestAnwersDetail() {
		ModelAndView mav = new ModelAndView("board/best_answers_detail");
		mav.addObject("best_answers_detail", "");
		return mav;
	}
	
	@RequestMapping(value="/free")
	public ModelAndView boardFree() {
		ModelAndView mav = new ModelAndView("board/free");
		mav.addObject("best_answers", "");
		return mav;
	}
	
	@RequestMapping(value="/free/detail")
	public ModelAndView boardFreeDetail() {
		ModelAndView mav = new ModelAndView("board/free_detail");
		mav.addObject("best_answers_detail", "");
		return mav;
	}
	
	@RequestMapping(value="/recommend")
	public ModelAndView boardRecommend() {
		ModelAndView mav = new ModelAndView("board/recommend");
		mav.addObject("best_answers_detail", "");
		return mav;
	}
	
	@RequestMapping(value="/review")
	public ModelAndView boardReview() {
		ModelAndView mav = new ModelAndView("board/review");
		mav.addObject("best_answers_detail", "");
		return mav;
	}
	
	@RequestMapping(value="/review/detail")
	public ModelAndView boardReviewDetail() {
		ModelAndView mav = new ModelAndView("board/review_detail");
		mav.addObject("best_answers_detail", "");
		return mav;
	}
	
	@RequestMapping(value="/temporary")
	public ModelAndView boardTemporary() {
		ModelAndView mav = new ModelAndView("board/temporary");
		mav.addObject("best_answers_detail", "");
		return mav;
	}
	
	@RequestMapping(value="/write")
	public ModelAndView boardWrite() {
		ModelAndView mav = new ModelAndView("board/write");
		mav.addObject("best_answers_detail", "");
		return mav;
	}
}
