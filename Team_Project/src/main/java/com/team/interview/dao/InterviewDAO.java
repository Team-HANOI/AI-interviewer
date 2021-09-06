package com.team.interview.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.interview.vo.InterviewVO;
import com.team.interview.vo.MentormodeVO;
import com.team.interview.vo.MentormodeVO;

@Mapper
@Repository
public interface InterviewDAO {

	public ArrayList<InterviewVO> selectRecruitPosting(int startrow);
	public MentormodeVO insertMentorMode();
	public int selectMaxmentorId();
	public int selectTotPostCnt();
	
}
