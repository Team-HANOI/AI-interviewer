package com.team.interview.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.interview.vo.InterviewVO;

@Mapper
@Repository
public interface InterviewDAO {

	public ArrayList<InterviewVO> selectRecruitPosting(int startrow);

	public int selectTotPostCnt();
	
}
