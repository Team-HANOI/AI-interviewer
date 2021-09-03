package com.team.interview.service;

import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.interview.dao.QuestionDAO;
import com.team.interview.vo.QuestionVO;
@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionDAO questionDAO;
	
	@Override
	public ArrayList<QuestionVO> questions() throws Exception {
		return questionDAO.backQuestion();
	}

	
	
}
