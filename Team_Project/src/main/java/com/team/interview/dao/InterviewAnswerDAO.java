package com.team.interview.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.interview.vo.FileVO;
import com.team.interview.vo.InterviewAnswerVO;
import com.team.interview.vo.InterviewRecordVO;

@Mapper
@Repository
public interface InterviewAnswerDAO {
	
	void insertInterviewAnswer(InterviewAnswerVO interviewAnswerVO) throws Exception;
	void insertInterviewRecord(InterviewRecordVO interviewRecordVO) throws Exception;
	void insertVoiceAnswer(FileVO fileVO) throws Exception;
	
	int voiceNextNum() throws Exception;
	int interviewRecordNextNum() throws Exception;
	int answerNextNum() throws Exception;
	
	
	
}
