package com.team.interview.service;

import com.team.interview.vo.MemberVO;

public interface MemberService {
  MemberVO findByEmail(String email, boolean fromSocial);
}
