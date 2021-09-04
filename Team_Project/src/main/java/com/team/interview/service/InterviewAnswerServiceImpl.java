package com.team.interview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.interview.dao.InterviewAnswerDAO;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.InterviewAnswerVO;
import com.team.interview.vo.InterviewRecordVO;

@Service
public class InterviewAnswerServiceImpl implements InterviewAnswerService {

	@Autowired
	InterviewAnswerDAO interviewAnswerDAO;

	@Override
	public void regInterviewAnswer(InterviewAnswerVO interviewAnswerVO) throws Exception {
		
		int answerNumber = interviewAnswerDAO.answerNextNum();
		interviewAnswerVO.setAnswerId(answerNumber);
		interviewAnswerDAO.insertInterviewAnswer(interviewAnswerVO);
		
	}

	@Override
	public int regVoiceAnswer(FileVO fileVO) throws Exception {
		
		int voiceNextNum = interviewAnswerDAO.voiceNextNum();
		fileVO.setFileId(voiceNextNum);
		interviewAnswerDAO.insertVoiceAnswer(fileVO);
		return voiceNextNum;

	}


	@Override
	public int regInterviewRecord(InterviewRecordVO interviewRecordVO) throws Exception {
		
		int interviewNumber = interviewAnswerDAO.interviewRecordNextNum();
		interviewRecordVO.setiRecordId(interviewNumber);
		interviewRecordVO.setMentorEmail("");
		interviewAnswerDAO.insertInterviewRecord(interviewRecordVO);
		
		return interviewNumber;
	}

}






