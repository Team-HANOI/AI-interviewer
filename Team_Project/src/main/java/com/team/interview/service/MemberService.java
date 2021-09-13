package com.team.interview.service;

import java.io.IOException;
import org.springframework.web.multipart.MultipartFile;
import com.team.interview.vo.MemberVO;
import com.team.interview.vo.ProfileVO;

public interface MemberService {
  MemberVO findByEmail(String email, boolean fromSocial);


  void joinCom(MemberVO memberVO, MultipartFile logoImg) throws Exception;

  void joinIndv(MemberVO memberVO, MultipartFile pfImg) throws IOException, Exception;

  void updateMypageProfile(MemberVO memberVO, ProfileVO profileVO, MultipartFile pfImg) throws Exception;

}
