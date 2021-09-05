package com.team.interview.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.team.interview.dao.MemberDAO;
import com.team.interview.vo.AuthVO;
import com.team.interview.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
  @Autowired
  MemberDAO memberDAO;

  @Autowired
  private PasswordEncoder passwordEncoder;

  @Override
  public MemberVO findByEmail(String email, boolean fromSocial) {
    return memberDAO.findByEmail(email, fromSocial);
  }

  @Override
  public void joinIndv(MemberVO memberVO) {
    // 이름, 이메일, 패스워드만 날라옴

    // 패스워드 암호화
    memberVO.setPw(passwordEncoder.encode(memberVO.getPw()));
    // 소셜로그인 여부
    memberVO.setFromSocial(false);
    // 회원구분  일반:M 기업:C 관리자:A
    memberVO.setType('M');

    memberDAO.insertMember(memberVO);

    AuthVO authVO = new AuthVO();
    authVO.setEmail(memberVO.getEmail());
    authVO.setAuth("ROLE_USER");// 일반 회원

    memberDAO.insertAuth(authVO);
  }

}
