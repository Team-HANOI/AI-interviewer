package com.team.interview.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.interview.vo.QuestionVO;

@Mapper
@Repository
public interface QuestionDAO {

	public ArrayList<QuestionVO> backQuestion() throws Exception;
	
}
