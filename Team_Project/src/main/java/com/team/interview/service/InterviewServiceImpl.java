package com.team.interview.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.interview.dao.InterviewDAO;
import com.team.interview.vo.InterviewVO;
import com.team.interview.vo.MentormodeVO;
import com.team.interview.vo.PageInfo;

@Service
public class InterviewServiceImpl implements InterviewService {
	
	@Autowired
	InterviewDAO dao;
	
	@Override
	public ArrayList<InterviewVO> searchRecruitPosting(int page,PageInfo pageInfo) {
	
		System.out.println("==========recruit  service==");
		
		int listCount = dao.selectTotPostCnt();
		System.out.println("==================listCount============="+listCount+"=================================");
		//총 페이지 수(올림처리) //한페이지 당 
		int maxPage = (int)Math.ceil((double)listCount/12);
		System.out.println("=================maxPage=============="+maxPage+"=================================");
		//현재 페이지에 보여줄 시작 페이지 수(1,11,21,31...)  // 페이지 끝번호
		int startPage = (((int) ((double)page/10+0.9))-1)*10+1;
		System.out.println("===============startPage================"+startPage+"=================================");
		//현재 페이지에 보여줄 마지막 페이지 수(10,20,30...)
		int endPage = startPage+10-1;
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		int startrow = (page-1)*12+1;  // 페이지당 글 수 
		return dao.selectRecruitPosting(startrow); 
	}

	@Override
	public void insertMentorMode(MentormodeVO mentor) {
		dao.insertMentorMode();
		
	}

}
