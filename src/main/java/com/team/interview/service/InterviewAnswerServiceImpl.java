package com.team.interview.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.team.interview.dao.InterviewAnswerDAO;
import com.team.interview.dao.MemberDAO;
import com.team.interview.dao.ProfileDAO;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.InterviewAnswerVO;
import com.team.interview.vo.InterviewRecordVO;
import com.team.interview.vo.ProfileVO;

@Service
public class InterviewAnswerServiceImpl implements InterviewAnswerService {

  @Autowired
  InterviewAnswerDAO interviewAnswerDAO;

  @Autowired
  ProfileDAO profileDAO;

  @Autowired
  MemberDAO memberDAO;

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

    // 잔디 +1 업데이트
    ProfileVO profile = profileDAO.getProfile(memberDAO.findByEmailOnly(interviewRecordVO.getEmail()).getPfId());
    profile.setJandi(interviewComplete(profile.getJandi()));
    profileDAO.updateInterviewCompleteJandi(profile);

    return interviewNumber;
  }

  static String interviewComplete(String jandi) {

    StringBuilder sb = new StringBuilder(jandi);
    int lastIndexOfComma = sb.lastIndexOf(",");
    String lastCount = sb.substring(lastIndexOfComma + 1, sb.length());
    int updatedCount = Integer.parseInt(lastCount) + 1;
    sb.replace(lastIndexOfComma + 1, sb.length(), String.valueOf(updatedCount));
    jandi = sb.toString();

    return jandi;
  }

}






