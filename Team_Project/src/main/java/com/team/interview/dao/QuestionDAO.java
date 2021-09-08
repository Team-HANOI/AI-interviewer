package com.team.interview.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.team.interview.vo.AnswerVO;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.ProfileVO;
import com.team.interview.vo.QuestionVO;

@Mapper
@Repository
public interface QuestionDAO {
	
	//	
		
	List<QuestionVO> SelectAllQList(int startrow) throws Exception;

	List<QuestionVO> Querykw(@Param("kw") String kw, @Param("startrow") int startrow) throws Exception;

	ProfileVO SelectProfile(int iRecordId) throws Exception;

	int selectAllACount() throws Exception;

	List<AnswerVO> SelectAnswer(@Param("q_id") int q_id, @Param("startrow") int startrow) throws Exception;

	List<AnswerVO> SelectAnswerRCnt(@Param("q_id") int q_id, @Param("startrow") int startrow) throws Exception;

	void UpdateRcnt(int q_id) throws Exception;

	int selectAllQCount() throws Exception;

	FileVO getFile(@Param("fileId") int fileId);

	void UpdateRCnt(@Param("answerId") int answerId) throws Exception;

	int QueryRCnt(@Param("answerId") int answerId) throws Exception;
	
	String SelectQContent(@Param("q_id") int q_id) throws Exception;

	//	backQuestion
	public ArrayList<QuestionVO> backQuestion() throws Exception;
	
	//	frontQuestion
	public ArrayList<QuestionVO> frontQuestion() throws Exception;
	
	//	customQuestion()
	public ArrayList<QuestionVO> customQuestion(ArrayList<String> list) throws Exception;
	
	//	키워드 모드 Question()
	//	public ArrayList<QuestionVO> frontQuestion() throws Exception;

}
