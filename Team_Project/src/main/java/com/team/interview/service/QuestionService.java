package com.team.interview.service;

import java.util.ArrayList;

import com.team.interview.vo.QuestionVO;

public interface QuestionService {
	
	public ArrayList<QuestionVO> questions() throws Exception;

}
