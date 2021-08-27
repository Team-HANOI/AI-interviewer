package com.alpaca.app.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.alpaca.app.board.service.AllService;
import com.alpaca.app.board.vo.PgInfo;
import com.alpaca.app.board.vo.Quest;


@Controller
public class AllQControllerImpl implements AllQController {
	@Autowired
	private AllService allService;
	
	@Override
	@RequestMapping(value="/allqlist", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView AllQList(@RequestParam(value="pg", required=false, defaultValue="1") int pg) {
		PgInfo pgInfo = new PgInfo();
		ModelAndView mv = new ModelAndView();
		System.out.println("aa");
		try {
			List<Quest> articleList = allService.getAllQList(pg,pgInfo);
			mv.addObject("pgInfo",pgInfo);
			mv.addObject("articleList",articleList);
			//mv.addObject("page","Qlistform");
			mv.setViewName("board_total");
		}catch(Exception e) {
			e.printStackTrace();
			mv.addObject("err",e.getMessage());
			mv.addObject("page","/err");
			mv.setViewName("main");
		}
		return mv;
	}

	@Override
	@RequestMapping(value="/allkwqlist", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView AllkwQList(@RequestParam(value="keyword") String keyword,@RequestParam(value="pg", required=false, defaultValue="1") int pg) {
		PgInfo pgInfo = new PgInfo();
		ModelAndView mv = new ModelAndView();
		System.out.println("aa");
		try {
			List<Quest> articleList = allService.getkwQList(keyword,pg,pgInfo);
			mv.addObject("pgInfo",pgInfo);
			mv.addObject("articleList",articleList);
			//mv.addObject("page","Qlistform");
			mv.setViewName("board_total");
		}catch(Exception e) {
			e.printStackTrace();
			mv.addObject("err",e.getMessage());
			mv.addObject("page","/err");
			mv.setViewName("main");
		}
		return mv;		
	}

	

	}


