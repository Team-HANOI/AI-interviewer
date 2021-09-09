package com.team.interview.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.team.interview.vo.AuthVO;
import com.team.interview.vo.CompanyVO;
import com.team.interview.vo.MemberVO;

@Mapper
@Repository
public interface MemberDAO {

  int insertMember(MemberVO memberVO);
  int insertAuth(AuthVO auth);

  MemberVO findByEmail(@Param("email") String email,@Param("fromSocial") boolean fromSocial);
  MemberVO findByEmailOnly(String email);
  void insertCompany(CompanyVO companyVO);
  void insertSocialMember(MemberVO newMemberVO);

  void updatePfIdByEmail(String email);
  void updateMypageProfile(MemberVO memberVO);
}
