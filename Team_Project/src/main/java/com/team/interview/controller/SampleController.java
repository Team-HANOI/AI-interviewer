package com.team.interview.controller;


import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.team.interview.security.dto.AuthMemberDTO;

@Controller
@RequestMapping("/sample/")
public class SampleController {

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