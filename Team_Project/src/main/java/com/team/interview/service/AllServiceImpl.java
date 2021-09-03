package com.team.interview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.team.interview.dao.QuestionDAO;
import com.team.interview.vo.AnswerVO;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.PageInfo;
import com.team.interview.vo.ProfileVO;
import com.team.interview.vo.QuestionVO;

@Service
@Repository("allService")
public class AllServiceImpl implements AllService {
	@Autowired
	private QuestionDAO qdao;
	
	@Override
	public List<QuestionVO> getAllQList(int page, PageInfo pageInfo) throws Exception {
			int listCount = qdao.selectAllQCount();
			int maxPage = (int)Math.ceil((double)listCount/10);
			int startPage = (((int)((double)page/10+0.9))-1)*10+1;
			int endPage = startPage+10-1;
			if(endPage>maxPage) endPage=maxPage;
			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);
			int startrow = (page-1)*10+1;
			
			
			return qdao.SelectAllQList(startrow);
		}

	@Override
	public List<QuestionVO> getkwQList(String kw, int page, PageInfo pageInfo) throws Exception {
		int listCount = qdao.selectAllQCount();
		int maxPage = (int)Math.ceil((double)listCount/10);
		int startPage = (((int)((double)page/10+0.9))-1)*10+1;
		int endPage = startPage+10-1;
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		int startrow = (page-1)*10+1;
		
		return qdao.Querykw(kw, startrow);
	}

	@Override
	public List<AnswerVO> getAnsList(int q_id, int page, PageInfo pageInfo) throws Exception {
		int listCount = qdao.selectAllACount();
		int maxPage = (int)Math.ceil((double)listCount/10);
		int startPage = (((int)((double)page/10+0.9))-1)*10+1;
		int endPage = startPage+10-1;
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		int startrow = (page-1)*10+1;
		
		List<AnswerVO> answers = qdao.SelectAnswer(q_id,startrow);
		System.out.println(answers);
		for(AnswerVO a: answers) {
			System.out.println(a.getContent());
			System.out.println(a.getiRecordId());
			ProfileVO pf = qdao.SelectProfile(a.getiRecordId());
			System.out.println(pf);
			a.setPfImgId(pf.getPfImgId());
			a.setMemberName(pf.getName());
			a.setQ_id(q_id);
		}
	 return answers;
	
	}
	
	
	@Override
	public List<AnswerVO> getAnsListCnt(int q_id, int page, PageInfo pageInfo) throws Exception {
		int listCount = qdao.selectAllACount();
		int maxPage = (int)Math.ceil((double)listCount/10);
		int startPage = (((int)((double)page/10+0.9))-1)*10+1;
		int endPage = startPage+10-1;
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		int startrow = (page-1)*10+1;
		
		List<AnswerVO> answers = qdao.SelectAnswerRCnt(q_id,startrow);
		System.out.println(answers);
		for(AnswerVO a: answers) {
			System.out.println(a.getContent());
			System.out.println(a.getiRecordId());
			ProfileVO pf = qdao.SelectProfile(a.getiRecordId());
			System.out.println(pf);
			a.setPfImgId(pf.getPfImgId());
			a.setMemberName(pf.getName());
		}
	 return answers;
	
	}
	

	@Override
		public FileVO getFile(int fileId) throws Exception{
			return qdao.getFile(fileId);
		
	}

	@Override
	public void recommend(int answerId) throws Exception {
		qdao.UpdateRCnt(answerId);
		
	}

	@Override
	public int getRCnt(int answerId) throws Exception {
			return qdao.QueryRCnt(answerId);
	}
	

	}


