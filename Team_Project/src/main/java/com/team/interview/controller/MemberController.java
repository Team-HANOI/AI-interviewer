package com.team.interview.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.team.interview.service.MemberService;
import com.team.interview.vo.MemberVO;

@Controller
public class MemberController {

  @Autowired
  private MemberService memberService;

  @RequestMapping("/userLogin")
  public String userLogin(){
    return "/security/userLogin";
  }
  @RequestMapping("/join_indv")
  public String joinIndv(){
    return "/member/join_indv";
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
