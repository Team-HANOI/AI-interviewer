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

@Controller
@RequestMapping("/sample/")
public class SampleController {

  @Autowired
  MemberService memberService;

  @GetMapping("/all")
  public void exAll(){
    System.out.println("exAll..........");
  }

  @GetMapping("/example")
  public void security(@AuthenticationPrincipal AuthMemberDTO authMemberDTO){
  }





  @GetMapping("/member")
  public void exMember(@AuthenticationPrincipal AuthMemberDTO authMemberDTO){
    System.out.println("exMember..........");
    System.out.println("--------------------------");
    System.out.println(authMemberDTO);

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

  //  @GetMapping("/accessError")
  //  public void accessDenied(Authentication auth, Model model) {
  //
  //    System.out.println("access Denied : " + auth);
  //
  //    model.addAttribute("msg", "Access Denied");
  //  }
  //
  //  @GetMapping("/customLogin")
  //  public String loginInput(String error, String logout, Model model) {
  //    // 에러 메시지와 로그아웃 메시지를 파라미터로 사용할 수 있다
  //    System.out.println("error: " + error);
  //    System.out.println("logout: " + logout);
  //
  //    if (error != null) {
  //      model.addAttribute("error", "Login Error Check Your Account");
  //    }
  //
  //    if (logout != null) {
  //      model.addAttribute("logout", "Logout!!");
  //    }
  //    return "/security/customLogin";
  //  }
  //
  //  @GetMapping("/customLogout")
  //  public String logoutGET() {
  //    System.out.println("custom logout");
  //    return "/security/customLogout";
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