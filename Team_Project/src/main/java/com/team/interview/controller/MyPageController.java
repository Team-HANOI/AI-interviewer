package com.team.interview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="mypage")
public class MyPageController {

  @RequestMapping(value="/")
  public ModelAndView mypageProfile() {
    ModelAndView mav = new ModelAndView("mypage/profile");
    mav.addObject("", "");
    return mav;
  }
  @RequestMapping(value="/profile_edit")
  public ModelAndView mypageProfileEdit() {
    ModelAndView mav = new ModelAndView("mypage/profile_edit");
    mav.addObject("", "");
    return mav;
  }

  @RequestMapping(value="/mentoring")
  public ModelAndView mypageMentoring() {
    ModelAndView mav = new ModelAndView("mypage/mentoring");
    mav.addObject("", "");
    return mav;
  }

  @RequestMapping(value="/mentoring/com")
  public ModelAndView mypageMentoringCom() {
    ModelAndView mav = new ModelAndView("mypage/mentoring_com");
    mav.addObject("", "");
    return mav;
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
