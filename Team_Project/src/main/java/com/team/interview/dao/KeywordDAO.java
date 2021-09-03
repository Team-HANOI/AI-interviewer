package com.team.interview.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.interview.vo.KeywordVO;

@Mapper
@Repository
public interface KeywordDAO {

	public ArrayList<KeywordVO> keywordList();
	
}
