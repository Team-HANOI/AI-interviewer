package com.team.interview.service;

import java.util.ArrayList;

import com.team.interview.vo.InterviewVO;
import com.team.interview.vo.MentormodeVO;
import com.team.interview.vo.PageInfo;


public interface InterviewService {

	public  ArrayList<InterviewVO> searchRecruitPosting(int page, PageInfo pageInfo);
	public void insertMentorMode(MentormodeVO mentor);

}
