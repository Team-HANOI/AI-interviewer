package com.team.interview.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.interview.vo.Recruit;

@Mapper
@Repository("recruitDAO")
public interface RecruitDAO {
	List<Recruit> selectRecruits() throws Exception;
	int insertRecruit(Recruit recruit) throws Exception;
	Recruit searchRecruit(int id) throws Exception;
}
