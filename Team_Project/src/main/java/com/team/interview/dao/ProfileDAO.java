package com.team.interview.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.ProfileVO;

@Mapper
@Repository
public interface ProfileDAO {

  int insertProfile(ProfileVO profileVO);
  int insertProfileImage(FileVO pfImg);

  //  MemberVO findByEmail(@Param("email") String email,@Param("fromSocial") boolean fromSocial);
}
