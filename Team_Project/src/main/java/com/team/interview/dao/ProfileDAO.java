package com.team.interview.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.ProfileVO;

@Mapper
@Repository
public interface ProfileDAO {

  int selectPfImgNextval() throws Exception;

  int insertProfile(ProfileVO profileVO);
  int insertProfileImage(FileVO pfImg);

  ProfileVO getProfile(int fileId);
  FileVO getFile(int pfImgId);

  void updateMypageProfile(ProfileVO profileVO);
  void updateMypageProfileImage(FileVO newFile);

  void updateNewDayJandi(ProfileVO profileVO);
  void updateInterviewCompleteJandi(ProfileVO profileVO);
  int getMaxNumOfPfId();

  //  MemberVO findByEmail(@Param("email") String email,@Param("fromSocial") boolean fromSocial);
}
