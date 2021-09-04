package com.team.interview.service;

import java.util.List;

import com.team.interview.vo.FileVO;
import com.team.interview.vo.RecruitVO;

public interface RecruitService {
	List<RecruitVO> searchAll() throws Exception;
	void addRecruit(RecruitVO recruit) throws Exception;
	RecruitVO searchRecruit(int id) throws Exception;
	FileVO getFile(int fileId) throws Exception; 
}
