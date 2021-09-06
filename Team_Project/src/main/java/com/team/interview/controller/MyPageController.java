package com.team.interview.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.team.interview.security.dto.AuthMemberDTO;
import com.team.interview.service.ProfileService;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.ProfileVO;

@Controller
@RequestMapping(value="mypage")
public class MyPageController {

  @Autowired
  private ProfileService profileService;

  @RequestMapping(value="/")
  public ModelAndView mypageProfile(@AuthenticationPrincipal AuthMemberDTO authMemberDTO) {

    ModelAndView mv = new ModelAndView("mypage/profile");

    ProfileVO profile;
    try {
      profile = profileService.getProfile(authMemberDTO.getPfId());
      FileVO file = profileService.getFile(profile.getPfImgId());

      mv.addObject("file", file);
      mv.addObject("profile", profile);
    } catch (Exception e) {
      e.printStackTrace();
      mv.addObject("err", "프로필 조회 실패");
      mv.setViewName("/err");
    }

    return mv;
  }

  //
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
  public ModelAndView mypageProfileEdit() {
    ModelAndView mav = new ModelAndView("mypage/profile_edit");
    mav.addObject("", "");
    return mav;
  }

  @PostMapping(value="/profile_edit")
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
