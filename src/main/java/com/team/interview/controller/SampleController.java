package com.team.interview.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.team.interview.security.dto.AuthMemberDTO;
import com.team.interview.service.MemberService;
import com.team.interview.vo.MemberVO;

@Controller
@RequestMapping("/sample/")
public class SampleController {

  @Autowired
  MemberService memberService;

  @GetMapping("/ex1")
  public void securityEx1(){
  }

  @GetMapping("/all")
  public void exAll(){
    System.out.println("exAll..........");
  }

  @GetMapping("/member")
  public void exMember(@AuthenticationPrincipal AuthMemberDTO authMemberDTO){
    System.out.println("exMember..........");
    System.out.println("--------------------------");
    System.out.println(authMemberDTO);
    System.out.println(authMemberDTO.getEmail());

    MemberVO memberVO = new MemberVO();
    memberVO.setEmail(authMemberDTO.getEmail());
  }
  @GetMapping("/company")
  public void exCompany(@AuthenticationPrincipal AuthMemberDTO authMemberDTO){
    System.out.println("exCompany..........");
    System.out.println("--------------------------");
    System.out.println(authMemberDTO);

  }

  @GetMapping("/admin")
  public void exAdmin(){
    System.out.println("exAdmin..........");
  }
}