package com.team.interview.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.interview.dao.KeywordDAO;
import com.team.interview.vo.KeywordVO;

@Service
public class KeywordServiceImpl implements KeywordService {

	@Autowired
	KeywordDAO keywordDAO;
	
	@Override
	public ArrayList<KeywordVO> keywordList() {
		
		return keywordDAO.keywordList();
		
	}

	
	
}
