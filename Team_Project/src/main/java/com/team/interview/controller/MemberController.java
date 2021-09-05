package com.team.interview.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
  @GetMapping("/join_indv")
  public String joinIndv(){
    return "/member/join_indv";
  }
  @PostMapping("/join_indv")
  public ModelAndView joinIndv(
      @ModelAttribute MemberVO memberVO
      , RedirectAttributes redirectAttrs){
    ModelAndView mv = new ModelAndView();
    try {
      memberService.joinIndv(memberVO);
      redirectAttrs.addFlashAttribute("joined_email", memberVO.getEmail());
      mv.setViewName("redirect:/userLogin");
      // 가입 버튼 -> 로그인 화면 리다이렉트?

      // 가입시 이메일 인증?

      // 패스워드 인코더
      // 이미 가입된 이메일입니다 ajax
      // 패스워드 조합
      // 패스워드 확인

    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", "오류 발생");
      mv.setViewName("/member/err"); // 안만듬
    }
    return mv;
  }
  //  @RequestMapping("/join_com")
  //  public String joinCom(MemberVO memberVO){
  //    try {
  //      memberService.join(memberVO);
  //      // 가입 버튼 -> 로그인 화면
  //      // 패스워드 인코더
  //      mv.setViewName("redirect:/review/board_review_detail?reviewId=" + rComm.getReviewId());
  //
  //    } catch (Exception e) {
  //      e.printStackTrace();
  //      mv.addObject("err", "오류 발생");
  //      mv.setViewName("/review/err");
  //    }
  //    return "/member/join_com";
  //  }

  @RequestMapping("/403")
  public String accessDenied(){
    return "/403";
  }
}
