package com.team.interview.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.team.interview.security.dto.AuthMemberDTO;
import com.team.interview.service.MemberService;
import com.team.interview.vo.MemberVO;
import com.team.interview.vo.ReviewVO;

@Controller
public class MemberController {

  @Autowired
  private MemberService memberService;

  @RequestMapping("/userLogin")
  public String userLogin(){
    return "/security/userLogin";
  }
  @GetMapping("/join_indv_tech")
  public String profile2(){
    return "/member/join_indv_tech";
  }
  @GetMapping("/join_indv_extra")
  public String profile(){
    return "/member/join_indv_extra";
  }
  @GetMapping("/join_indv")
  public String joinIndv(){
    return "/member/join_indv";
  }
  @PostMapping("/join_indv")
  public ModelAndView joinIndv(
      @ModelAttribute MemberVO memberVO
      , @RequestParam MultipartFile pfImg
      , RedirectAttributes redirectAttrs,
      @AuthenticationPrincipal AuthMemberDTO authMemberDTO){

    ModelAndView mv = new ModelAndView();
    try {
      memberService.joinIndv(memberVO, pfImg);
      redirectAttrs.addFlashAttribute("joined_email", memberVO.getEmail());
      if(authMemberDTO == null) {// 비로그인 상태
        mv.setViewName("redirect:/userLogin");
      } else { // 로그인 상태
        mv.setViewName("redirect:/");
      }


    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", "오류 발생");
      mv.setViewName("/member/err"); // 안만듬
    }
    return mv;
  }

  @GetMapping("/join_com")
  public String joinCom(){
    return "/member/join_com";
  }
  @PostMapping("/join_com")
  public ModelAndView joinCom(
      @ModelAttribute MemberVO memberVO
      , @RequestParam MultipartFile logoImg
      , RedirectAttributes redirectAttrs,
      @AuthenticationPrincipal AuthMemberDTO authMemberDTO){
    ModelAndView mv = new ModelAndView();
    try {
      memberService.joinCom(memberVO, logoImg);
      redirectAttrs.addFlashAttribute("joined_email", memberVO.getEmail());
      if(authMemberDTO == null) {// 비로그인 상태
        mv.setViewName("redirect:/userLogin");
      } else { // 로그인 상태
        mv.setViewName("redirect:/");
      }
    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", "오류 발생");
      mv.setViewName("/member/err"); // 안만듬
    }
    return mv;
  }



  @RequestMapping("/403")
  public String accessDenied(){
    return "/403";
  }
}
