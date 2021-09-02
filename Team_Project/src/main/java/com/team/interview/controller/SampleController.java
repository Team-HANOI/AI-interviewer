package com.team.interview.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.team.interview.security.dto.AuthMemberDTO;
import com.team.interview.service.MemberService;

@Controller
@RequestMapping("/sample/")
public class SampleController {

  @Autowired
  MemberService memberService;

  @GetMapping("/all")
  public void exAll(){
    System.out.println("exAll..........");
  }

  @GetMapping("/member")
  public void exMember(@AuthenticationPrincipal AuthMemberDTO authMemberDTO){
    System.out.println("exMember..........");
    System.out.println("--------------------------");
    System.out.println(authMemberDTO);

  }

  @GetMapping("/admin")
  public void exAdmin(){
    System.out.println("exAdmin..........");
  }

  //  @GetMapping("/test")
  //  public String test(Model model, MemberVO memberVO){
  //    System.out.println("exAll..........");
  //    memberVO = memberService.findByEmail("user4@alpaca.com", false);
  //    model.addAttribute("test",memberVO);
  //    return "home";
  //  }

  //  @GetMapping("/member")
  //  public void exMember(@AuthenticationPrincipal ClubAuthMemberDTO clubAuthMember){
  //
  //    log.info("exMember..........");
  //
  //    log.info("-------------------------------");
  //    log.info(clubAuthMember);
  //
  //  }

}