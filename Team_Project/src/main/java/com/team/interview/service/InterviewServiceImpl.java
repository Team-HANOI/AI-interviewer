package com.team.interview.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.interview.dao.InterviewDAO;
import com.team.interview.vo.Criteria;
import com.team.interview.vo.InterviewRecordVO;
import com.team.interview.vo.InterviewVO;
import com.team.interview.vo.MentormodeVO;
import com.team.interview.vo.PageInfo;

@Service
public class InterviewServiceImpl implements InterviewService {

  @Autowired
  InterviewDAO dao;

  @Override
  public ArrayList<InterviewVO> searchRecruitPosting(int page, PageInfo pageInfo) {

    System.out.println("==========recruit  service==");

    int listCount = dao.selectTotPostCnt();
    System.out
    .println("==================listCount=============" + listCount + "=================================");
    // 총 페이지 수(올림처리) //한페이지 당
    int maxPage = (int) Math.ceil((double) listCount / 12);
    System.out.println("=================maxPage==============" + maxPage + "=================================");
    // 현재 페이지에 보여줄 시작 페이지 수(1,11,21,31...) // 페이지 끝번호
    int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
    System.out
    .println("===============startPage================" + startPage + "=================================");
    // 현재 페이지에 보여줄 마지막 페이지 수(10,20,30...)
    int endPage = startPage + 10 - 1;
    if (endPage > maxPage)
      endPage = maxPage;
    pageInfo.setEndPage(endPage);
    pageInfo.setListCount(listCount);
    pageInfo.setMaxPage(maxPage);
    pageInfo.setPage(page);
    pageInfo.setStartPage(startPage);
    int startrow = (page - 1) * 12 + 1; // 페이지당 글 수
    return dao.selectRecruitPosting(startrow);
  }

  @Override
  public void regMentor(MentormodeVO mentor) {
    int mentor_id = dao.selectMaxmentorId() + 1;
    mentor.setMentorId(mentor_id);
    mentor.setMentorName(dao.getMentorNameByEmail(mentor.getMentorEmail()));
    dao.insertMentorMode(mentor);

  }

  @Override
  public void appMentor(MentormodeVO mentor) throws Exception {
    dao.updateMentor(mentor.getApplEmail(),mentor.getMentorEmail());
  }

  @Override
  public List<MentormodeVO> getMentorList(int page, PageInfo pageInfo) throws Exception {
    int listCount = dao.selectMentorCount();
    int maxPage = (int) Math.ceil((double) listCount / 10);
    int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
    int endPage = startPage + 10 - 1;
    if (endPage > maxPage)
      endPage = maxPage;
    pageInfo.setEndPage(endPage);
    pageInfo.setListCount(listCount);
    pageInfo.setMaxPage(maxPage);
    pageInfo.setPage(page);
    pageInfo.setStartPage(startPage);
    int startrow = (page - 1) * 10 + 1;

    return dao.SelectMentorList(startrow);
  }

  @Override
  public List<MentormodeVO> getMyMentorList(String mentorEmail, int page, PageInfo pageInfo) throws Exception {
    int listCount = dao.selectMyMentorCount(mentorEmail);
    int maxPage = (int) Math.ceil((double) listCount / 10);
    int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
    int endPage = startPage + 10 - 1;
    if (endPage > maxPage)
      endPage = maxPage;
    pageInfo.setEndPage(endPage);
    pageInfo.setListCount(listCount);
    pageInfo.setMaxPage(maxPage);
    pageInfo.setPage(page);
    pageInfo.setStartPage(startPage);
    int startrow = (page - 1) * 10 + 1;

    return dao.SelectMyMentorList(mentorEmail,startrow);
  }


  @Override
  public List<MentormodeVO> getList(Criteria cri) throws Exception {
    return dao.SelectMyAppliedMentoring(cri);
  }

  @Override
  public int getTotal(Criteria cri) {
    return dao.getTotalCount(cri);
  }
}
