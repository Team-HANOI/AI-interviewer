package com.team.interview.service;

import java.util.ArrayList;
import java.util.List;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.PageInfo;
import com.team.interview.vo.RCommVO;
import com.team.interview.vo.ReviewVO;

public interface ReviewService {

  void writeReview(FileVO rImg, ReviewVO review) throws Exception;

  List<ReviewVO> getBoardList(int page, PageInfo pageInfo) throws Exception;

  List<ReviewVO> getBoardKeyList(int page, PageInfo pageInfo, String keyword) throws Exception;

  ReviewVO getBoard(int reviewId) throws Exception;

  ReviewVO getBoardPre(int reviewId) throws Exception;

  ReviewVO getBoardNext(int reviewId) throws Exception;

  FileVO getFile(int fileId) throws Exception;

  int getLikeCount(String reviewId) throws Exception;

  void updateLikeCount(String reviewId) throws Exception;

  void modifyBoard(ReviewVO review) throws Exception;


  void removeBoard(int reviewId) throws Exception;

  // 댓글

  void addRComm(RCommVO rComm) throws Exception;

  void addRCommChild(RCommVO rComm) throws Exception;

  ArrayList<RCommVO> getRCommList(int reviewId) throws Exception;



}
