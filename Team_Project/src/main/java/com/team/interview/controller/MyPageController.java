package com.team.interview.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.interview.security.dto.AuthMemberDTO;
import com.team.interview.service.InterviewService;
import com.team.interview.vo.MentormodeVO;
import com.team.interview.vo.PageInfo;

@Controller
@RequestMapping(value="mypage")
public class MyPageController {

	@Autowired
	InterviewService iservice;
	
  @RequestMapping(value="/")
  public ModelAndView mypageProfile() {
    ModelAndView mav = new ModelAndView("mypage/profile");
    mav.addObject("", "");
    return mav;
  }
  @GetMapping(value="/profile_edit")
  public ModelAndView mypageProfileEdit() {
    ModelAndView mav = new ModelAndView("mypage/profile_edit");
    mav.addObject("", "");
    return mav;
  }
  //  @PostMapping(value="/profile_edit")
  //  public ModelAndView mypageProfileEdit() {
  //    ModelAndView mav = new ModelAndView("mypage/profile_edit");
  //    mav.addObject("", "");
  //    return mav;
  //  }

  @RequestMapping(value="/mentoring")
  public ModelAndView mypageMentoring() {
    ModelAndView mav = new ModelAndView("mypage/mentoring");
    mav.addObject("", "");
    return mav;
  }

  @RequestMapping(value="/mentoring/com")
  public ModelAndView mypageMentoringCom(@AuthenticationPrincipal AuthMemberDTO authMemberDTO,@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
			PageInfo pageInfo = new PageInfo();
			ModelAndView mv = new ModelAndView();
			try {
				String mentorEmail=authMemberDTO.getcEmail();
				System.out.println(mentorEmail);
				List<MentormodeVO> articleList = iservice.getMyMentorList(mentorEmail,page, pageInfo);
				mv.addObject("pageInfo", pageInfo);
				mv.addObject("articleList", articleList);
				mv.setViewName("/mypage/mentoring_com");
			}catch (Exception e) {
				e.printStackTrace();
				mv.addObject("err", e.getMessage());
				mv.addObject("page", "/err");
				mv.setViewName("main");
			}
			return mv;
		}
  
  @RequestMapping(value="/myarticle")
  public ModelAndView mypageMyArticle() {
    ModelAndView mav = new ModelAndView("mypage/myarticle");
    mav.addObject("", "");
    return mav;
  }

  @RequestMapping(value="/myinterview")
  public ModelAndView mypageMyInterview() {
    ModelAndView mav = new ModelAndView("mypage/myinterview");
    mav.addObject("", "");
    return mav;
  }

  @RequestMapping(value="/myinterview/detail")
  public ModelAndView mypageMyInterviewDetail() {
    ModelAndView mav = new ModelAndView("mypage/myinterview_detail");
    mav.addObject("", "");
    return mav;
  }

  @RequestMapping(value="/pwchange")
  public ModelAndView mypagePasswordChange() {
    ModelAndView mav = new ModelAndView("mypage/pwchange");
    mav.addObject("", "");
    return mav;
  }

  @RequestMapping(value="/delete")
  public ModelAndView mypageSession() {
    ModelAndView mav = new ModelAndView("mypage/delete");
    mav.addObject("", "");
    return mav;
  }
}
