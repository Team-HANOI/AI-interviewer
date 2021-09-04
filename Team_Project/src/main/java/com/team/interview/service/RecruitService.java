package com.team.interview.service;

import java.util.List;

import com.team.interview.vo.Recruit;

public interface RecruitService {
	List<Recruit> searchAll() throws Exception;
	void addRecruit(Recruit recruit) throws Exception;
	Recruit searchRecruit(int id) throws Exception;
}
