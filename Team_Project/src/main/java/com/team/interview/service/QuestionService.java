package com.team.interview.service;

import java.util.ArrayList;

import com.team.interview.vo.QuestionVO;

public interface QuestionService {
	
	public ArrayList<QuestionVO> backQuestion() throws Exception;

	public ArrayList<QuestionVO> frontQuestion() throws Exception;
	
	
	
}
