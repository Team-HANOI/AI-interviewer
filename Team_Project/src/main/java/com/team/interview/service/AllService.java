package com.team.interview.service;

import java.util.List;

import com.team.interview.vo.AnswerVO;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.PageInfo;
import com.team.interview.vo.QuestionVO;

public interface AllService {
    List<QuestionVO> getAllQList(int pg, PageInfo pageInfo) throws Exception;
    List<QuestionVO> getkwQList(String kw,int pg, PageInfo pageInfo) throws Exception;
    List<AnswerVO> getAnsList(int q_id, int pg, PageInfo pageInfo) throws Exception;
    FileVO getFile(int fileId) throws Exception;
    void recommend(int answerId) throws Exception;
    int getRCnt(int answerId) throws Exception;
}
