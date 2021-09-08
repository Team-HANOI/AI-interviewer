package com.team.interview.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.team.interview.vo.InterviewVO;
import com.team.interview.vo.MentormodeVO;

@Mapper
@Repository
public interface InterviewDAO {

	public ArrayList<InterviewVO> selectRecruitPosting(int startrow);
	public void insertMentorMode(MentormodeVO mentor);
	public int selectMaxmentorId();
	public int selectTotPostCnt();
	int selectMentorCount() throws Exception;
	List<MentormodeVO> SelectMentorList(int startrow) throws Exception;
	public int selectMyMentorCount(@Param("mentorEmail") String mentorEmail)  throws Exception;
	public List<MentormodeVO> SelectMyMentorList(@Param("mentorEmail") String mentorEmail,@Param("startrow") int startrow) throws Exception;
	void updateMentor(@Param("appEmail") String appEmail, @Param("mentorEmail") String mentorEmail) throws Exception;
}
