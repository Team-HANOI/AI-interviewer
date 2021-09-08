package com.team.interview.service;

import java.util.ArrayList;
import java.util.List;
import com.team.interview.vo.Criteria;
import com.team.interview.vo.InterviewVO;
import com.team.interview.vo.MentormodeVO;
import com.team.interview.vo.PageInfo;


public interface InterviewService {

  public  ArrayList<InterviewVO> searchRecruitPosting(int page, PageInfo pageInfo);
  public void regMentor(MentormodeVO mentor);
  public List<MentormodeVO> getMentorList(int page,PageInfo pageInfo) throws Exception;
  public List<MentormodeVO> getMyMentorList(String mentorEmail,int page, PageInfo pageInfo) throws Exception;
  public void appMentor(MentormodeVO mentor) throws Exception;
  List<MentormodeVO> getList(Criteria cri) throws Exception;
  int getTotal(Criteria cri); 
}
