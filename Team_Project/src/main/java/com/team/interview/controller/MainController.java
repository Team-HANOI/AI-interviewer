package com.team.interview.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.team.interview.security.dto.AuthMemberDTO;
import com.team.interview.service.KeywordService;
import com.team.interview.service.MemberService;
import com.team.interview.service.ProfileService;
import com.team.interview.vo.MemberVO;
import com.team.interview.vo.ProfileVO;

@Controller
public class MainController {

  @Autowired
  private ProfileService profileService;
  @Autowired
  private KeywordService keywordSevice;
  @Autowired
  private MemberService memberService;

  @RequestMapping(value="/")
  public ModelAndView main() {
    ModelAndView mav = new ModelAndView("main");
    mav.addObject("main", "main");
    return mav;
  }
  
  @RequestMapping(value="/contact")
  public ModelAndView contact() {
	  ModelAndView mav = new ModelAndView("contact");
	  return mav;
  }
  
  @RequestMapping(value="/about")
  public ModelAndView about() {
	  ModelAndView mav = new ModelAndView("about");
	  return mav;
  }

  @GetMapping("/jandi")
  public ModelAndView jandi2(@AuthenticationPrincipal AuthMemberDTO authMemberDTO){
    ModelAndView mav = new ModelAndView("jandi");

    try {
      MemberVO member = memberService.findByEmail(authMemberDTO.getEmail(), authMemberDTO.isFromSocial());
      ProfileVO profile = profileService.getProfile(member.getPfId(), authMemberDTO.getEmail());

      // db에서 String을 가져와서 int배열로 만들자
      String jandi = profile.getJandi();
      int[] intArr = new int[365];
      StringTokenizer st = new StringTokenizer(jandi, ",");
      int i = 0;
      int test = 0;
      String test2;
      while(st.hasMoreTokens()) {
        intArr[i++] = Integer.parseInt(st.nextToken());
      }
      mav.addObject("intArr", intArr);
    } catch(Exception e) {

    }


    StringBuilder sb = new StringBuilder();




    return mav;
  }

  // 면접 완료후
  // db에서 String가져와서 interviewComplete 호출하고 리턴받은 String을 db에 update
}
