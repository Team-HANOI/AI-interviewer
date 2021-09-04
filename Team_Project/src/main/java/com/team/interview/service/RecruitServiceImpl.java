package com.team.interview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.interview.dao.RecruitDAO;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.RecruitVO;

@Service
public class RecruitServiceImpl implements RecruitService {
	
	@Autowired
	private RecruitDAO recruitDAO;
	
	@Override
	public List<RecruitVO> searchAll() throws Exception {
		List<RecruitVO> recruits = recruitDAO.selectRecruits();
		if (recruits == null) throw new Exception("");
		return recruits;
	}

	@Override
	public void addRecruit(RecruitVO recruit) throws Exception {
		RecruitVO recruitFound = recruitDAO.searchRecruit(recruit.getId());
//		if (recruitFound != null) throw new Exception("");
		System.out.println(recruit.getRStartdate());
		if (recruitDAO.insertRecruit(recruit) == 0) throw new Exception("");

	}

	@Override
	public RecruitVO searchRecruit(int id) throws Exception {
		RecruitVO recruit = recruitDAO.searchRecruit(id);
		if (recruit == null) return null;
		return recruit;
	}
	
	@Override
	  public FileVO getFile(int fileId) throws Exception {
	    return recruitDAO.getFile(fileId);
	  }
}
