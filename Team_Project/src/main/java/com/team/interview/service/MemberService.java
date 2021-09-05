package com.team.interview.service;

import java.io.IOException;
import org.springframework.web.multipart.MultipartFile;
import com.team.interview.vo.MemberVO;

public interface MemberService {
  MemberVO findByEmail(String email, boolean fromSocial);


  void joinCom(MemberVO memberVO);

  void joinIndv(MemberVO memberVO, MultipartFile pfImg) throws IOException;
}
