package com.team.interview.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.interview.vo.FileVO;
import com.team.interview.vo.RecruitVO;

@Mapper
@Repository("recruitDAO")
public interface RecruitDAO {
	List<RecruitVO> selectRecruits() throws Exception;
	int insertRecruit(RecruitVO recruitVO) throws Exception;
	RecruitVO searchRecruit(int rId) throws Exception;
	// 게시글 상세 - 첨부파일
	FileVO getFile(int fileId);
}
