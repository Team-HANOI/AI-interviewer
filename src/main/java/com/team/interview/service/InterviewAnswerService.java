package com.team.interview.service;

import java.util.List;

import com.team.interview.vo.FileVO;
import com.team.interview.vo.InterviewAnswerVO;
import com.team.interview.vo.InterviewRecordVO;

public interface InterviewAnswerService {
	
	void regInterviewAnswer(InterviewAnswerVO interviewAnswerVO) throws Exception;
	
	int regInterviewRecord(InterviewRecordVO interviewRecordVO) throws Exception;

//	void regMentorInterviewRecord() throws Exception;

	int regVoiceAnswer(FileVO fileVO) throws Exception;
	

	
}
