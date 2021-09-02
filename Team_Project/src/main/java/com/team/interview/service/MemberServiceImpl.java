package com.team.interview.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.team.interview.dao.MemberDAO;
import com.team.interview.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
  @Autowired
  MemberDAO memberDAO;

  @Override
  public MemberVO findByEmail(String email, boolean fromSocial) {
    return memberDAO.findByEmail(email, fromSocial);
  }

}
