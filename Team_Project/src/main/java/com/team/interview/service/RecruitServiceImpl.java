package com.team.interview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.interview.dao.RecruitDAO;
import com.team.interview.vo.Recruit;

@Service
public class RecruitServiceImpl implements RecruitService {
	
	@Autowired
	private RecruitDAO recruitDAO;
	
	@Override
	public List<Recruit> searchAll() throws Exception {
		List<Recruit> recruits = recruitDAO.selectRecruits();
		if (recruits == null) throw new Exception("");
		return recruits;
	}

	@Override
	public void addRecruit(Recruit recruit) throws Exception {
		Recruit recruitFound = recruitDAO.searchRecruit(recruit.getId());
		if (recruitFound != null) throw new Exception("");
		if (recruitDAO.insertRecruit(recruit) == 0) throw new Exception("");

	}

	@Override
	public Recruit searchRecruit(int id) throws Exception {
		Recruit recruit = recruitDAO.searchRecruit(id);
		if (recruit == null) return null;
		return recruit;
	}
}
