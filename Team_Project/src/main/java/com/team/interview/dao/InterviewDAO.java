package com.team.interview.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
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
	
}
