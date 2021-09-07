package com.team.interview.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.team.interview.security.dto.AuthMemberDTO;
import com.team.interview.service.KeywordService;
import com.team.interview.service.MemberService;
import com.team.interview.service.ProfileService;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.MemberVO;
import com.team.interview.vo.ProfileVO;

@Controller
@RequestMapping(value="mypage")
public class MyPageController {

  @Autowired
  private ProfileService profileService;
  @Autowired
  private KeywordService keywordSevice;
  @Autowired
  private MemberService memberService;

  @RequestMapping(value="/")
  public ModelAndView mypageProfile(@AuthenticationPrincipal AuthMemberDTO authMemberDTO) {

    ModelAndView mv = new ModelAndView("mypage/profile");

    ProfileVO profile;
    try {
      MemberVO member = memberService.findByEmail(authMemberDTO.getEmail(), authMemberDTO.isFromSocial());
      profile = profileService.getProfile(member.getPfId(), authMemberDTO.getEmail());
      FileVO file = profileService.getFile(profile.getPfImgId());

      String pSkill = profile.getpSkill();
      ArrayList<String> pSkillList = new ArrayList<>();
      if(pSkill != null) {
        StringTokenizer st = new StringTokenizer(pSkill, ",");
        while(st.hasMoreTokens()) {
          pSkillList.add(st.nextToken());
        }
      }

      mv.addObject("pSkillList", pSkillList);
      mv.addObject("file", file);
      mv.addObject("profile", profile);
    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", "프로필 조회 실패");
      mv.setViewName("/err");
    }

    return mv;
  }

  @GetMapping(value = {"/img/{fileId}", "/pds/{fileId}"})
  public ResponseEntity<byte[]> getImageFile(@PathVariable int fileId) throws Exception { // @PathVariable_url값을_변수로_담는다
    FileVO file = profileService.getFile(fileId);
    final HttpHeaders headers = new HttpHeaders(); // 상수화
    if (file != null) {
      String[] mtypes = file.getFileContentType().split("/");
      headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
      headers.setContentDispositionFormData("attachment", file.getFileName());
      headers.setContentLength(file.getFileSize());
      return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
    } else {
      return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
    }
  }

  @GetMapping(value="/profile_edit")
  public ModelAndView mypageProfileEdit(@AuthenticationPrincipal AuthMemberDTO authMemberDTO) {
    ModelAndView mv = new ModelAndView("mypage/profile_edit");
    ProfileVO profile;
    try {
      profile = profileService.getProfile(authMemberDTO.getPfId(), authMemberDTO.getEmail());
      FileVO file = profileService.getFile(profile.getPfImgId());

      String pSkill = profile.getpSkill();
      ArrayList<String> pSkillList = new ArrayList<>();
      if(pSkill != null) {
        StringTokenizer st = new StringTokenizer(pSkill, ",");
        while(st.hasMoreTokens()) {
          pSkillList.add(st.nextToken());
        }
      }

      mv.addObject("kwList", keywordSevice.keywordList());
      mv.addObject("pSkillList", pSkillList);
      mv.addObject("file", file);
      mv.addObject("profile", profile);
    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", "프로필 조회 실패");
      mv.setViewName("/err");
    }
    return mv;
  }

  @PostMapping(value="/profile_edit")
  public ModelAndView mypageProfileEdit(
      @ModelAttribute MemberVO memberVO 
      , @ModelAttribute ProfileVO profileVO
      , @RequestParam MultipartFile pfImg
      , @RequestParam List<String> kws /* 키워드 리스트 */
      , @AuthenticationPrincipal AuthMemberDTO authMemberDTO
      , RedirectAttributes redirectAttrs) {

    ModelAndView mv = new ModelAndView("profile_edit");

    try {
      // session에 로그인 유저 정보 업데이트
      authMemberDTO.setName(memberVO.getName());
      authMemberDTO.setPhoneNum(memberVO.getPhoneNum());

      memberVO.setEmail(authMemberDTO.getEmail());
      memberVO.setFromSocial(authMemberDTO.isFromSocial());
      StringBuilder sb = new StringBuilder();
      for (int i = 0; i < kws.size(); i++) {
        if(i == kws.size() - 1) {
          sb.append(kws.get(i));
        } else {
          sb.append(kws.get(i)).append(",");
        }
      }
      profileVO.setpSkill(sb.toString());

      memberService.updateMypageProfile(memberVO, profileVO, pfImg);


      mv.setViewName("redirect:/mypage/"); 
    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", "오류 발생");
      mv.setViewName("/member/err"); // 안만듬
    }
    return mv;
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
