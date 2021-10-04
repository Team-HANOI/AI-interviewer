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
	public ArrayList<QuestionVO> backQuestion() throws Exception {
		return questionDAO.backQuestion();
	}

	@Override
	public ArrayList<QuestionVO> frontQuestion() throws Exception {
		return questionDAO.frontQuestion();
	}
	
	@Override
	public ArrayList<QuestionVO> customQuestion(String[] keyword) throws Exception {

		ArrayList<String> list = new ArrayList<String>();
		
		for(String s : keyword) {
			
			list.add(s);
			
		}
		return questionDAO.customQuestion(list);	
	}
	
}
