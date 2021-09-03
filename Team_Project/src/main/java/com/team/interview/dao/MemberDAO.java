package com.team.interview.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.team.interview.vo.AuthVO;
import com.team.interview.vo.MemberVO;

@Mapper
@Repository
public interface MemberDAO {

  //  public MemberVO read(String userid);
  int insertMember(MemberVO member);
  int insertAuth(AuthVO auth);

  MemberVO findByEmail(@Param("email") String email,@Param("fromSocial") boolean fromSocial);
}


//@Select("select * from tbl_sec_member where email = #{email}")
//AppMember findByEmail(String email, boolean social);
//
//@Insert("insert into tbl_sec_member values(#{email}, #{password}, #{name}, #{fromSocial})")
//int save(AppMember appMember);