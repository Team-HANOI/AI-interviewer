package com.team.interview.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.team.interview.dao.ReviewDAO;
import com.team.interview.vo.FileVO;
import com.team.interview.vo.PageInfo;
import com.team.interview.vo.RCommVO;
import com.team.interview.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {
  @Autowired
  private ReviewDAO reviewDAO;

  @Override
  public void writeReview(FileVO rImg, ReviewVO review) throws Exception {
    if (rImg != null) {
      int fileId = reviewDAO.selectRImgNextval();
      rImg.setFileId(fileId);
      reviewDAO.insertRImg(rImg);
      review.setFileId(fileId);
    } else {
      review.setFileId(0);
    }
    review.setCommCnt(0);
    review.setLikeCnt(0);
    review.setViewCnt(0);
    reviewDAO.insertReview(review);
  }

  @Override
  public List<ReviewVO> getBoardList(int page, PageInfo pageInfo) throws Exception {
    int listCount = reviewDAO.selectReviewCount(); // 총 게시글 수
    // 총 페이지 수 (올림처리 ex)게시글 95개, 페이지수 10개)
    int maxPage = (int) Math.ceil((double) listCount / 10); // ceil:올림처리
    // 현재 페이지에 보여줄 시작 페이지 수
    int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1; // 현재페이지 기준 계산법
    // 현재 페이지에 보여줄 마지막 페이지 수
    int endPage = startPage + 10 - 1;
    if (endPage > maxPage) // 총 95페이지 인데 endPage 100페이지 일 수 없으므로
      endPage = maxPage;
    pageInfo.setEndPage(endPage); // 현재 페이지 기준(18)으로 시작페이지(11) 끝페이지(20)
    pageInfo.setListCount(listCount);
    pageInfo.setMaxPage(maxPage);
    pageInfo.setPage(page);
    pageInfo.setStartPage(startPage);
    int startrow = (page - 1) * 10 + 1;

    return reviewDAO.selectReviewList(startrow);
  }

  @Override
  public List<ReviewVO> getBoardKeyList(int page, PageInfo pageInfo, String keyword)
      throws Exception {
    int listCount = reviewDAO.selectReviewKeyCount(keyword); // 총 게시글 수
    // 총 페이지 수 (올림처리 ex)게시글 95개, 페이지수 10개)
    int maxPage = (int) Math.ceil((double) listCount / 10); // ceil:올림처리
    // 현재 페이지에 보여줄 시작 페이지 수
    int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1; // 현재페이지 기준 계산법
    // 현재 페이지에 보여줄 마지막 페이지 수
    int endPage = startPage + 10 - 1;
    if (endPage > maxPage) // 총 95페이지 인데 endPage 100페이지 일 수 없으므로
      endPage = maxPage;
    pageInfo.setEndPage(endPage); // 현재 페이지 기준(18)으로 시작페이지(11) 끝페이지(20)
    pageInfo.setListCount(listCount);
    pageInfo.setMaxPage(maxPage);
    pageInfo.setPage(page);
    pageInfo.setStartPage(startPage);
    int startrow = (page - 1) * 10 + 1;
    return reviewDAO.selectReviewKeyList(startrow, keyword);
  }


  @Override
  public ReviewVO getBoard(int reviewId) throws Exception {
    reviewDAO.updateViewCount(reviewId); // 조회수 증가
    return reviewDAO.selectReview(reviewId);
  }

  @Override
  public ReviewVO getBoardPre(int reviewId) throws Exception {
    reviewDAO.updateViewCountPre(reviewId); // 조회수 증가
    return reviewDAO.selectReviewPre(reviewId);
  }

  @Override
  public ReviewVO getBoardNext(int reviewId) throws Exception {
    reviewDAO.updateViewCountNext(reviewId); // 조회수 증가
    return reviewDAO.selectReviewNext(reviewId);
  }

  @Override
  public FileVO getFile(int fileId) throws Exception {
    return reviewDAO.getFile(fileId);
  }

  @Override
  public FileVO getPfImg(int pfId) throws Exception {
    return reviewDAO.getPfImg(pfId);
  }

  @Override
  public int selectPfId(String email) throws Exception {
    int id = reviewDAO.selectPfId(email);
    return id;
  }

  @Override
  public int getLikeCount(String reviewId) throws Exception {
    return reviewDAO.selectLikeCount(reviewId);
  }

  @Override
  public void updateLikeCount(String reviewId) throws Exception {
    reviewDAO.updateLikeCount(reviewId);
  }


  @Override
  public void modifyBoard(ReviewVO review) throws Exception {
    reviewDAO.updateReview(review);
  }

  @Override
  public void removeBoard(int reviewId) throws Exception {
    reviewDAO.deleteReview(reviewId);
  }



  // 본댓글달기
  @Override
  public void addRComm(RCommVO rComm) throws Exception {
    reviewDAO.insertRComm(rComm);
    reviewDAO.updateCommCnt(rComm.getReviewId());
  }

  // 대댓글달기
  @Override
  public void addRCommChild(RCommVO rComm) throws Exception { // 부모의 comId가져오기
    System.out.println("addRCommChild:" + rComm.getPrtComId());
    int seqMax = reviewDAO.selectSeqMax(rComm.getPrtComId());
    System.out.println("content:" + rComm.getContent());
    rComm.setEmail("e@naver.com");
    rComm.setSeq(seqMax);
    reviewDAO.insertRCommChild(rComm);
    reviewDAO.updateCommCnt(rComm.getReviewId());
  }

  // 댓글 조회
  @Override
  public ArrayList<RCommVO> getRCommList(int reviewId) throws Exception {
    return (ArrayList<RCommVO>) reviewDAO.selectRCommList(reviewId);
  }

  // 댓글작성자 프로필 사진
  @Override
  public FileVO getCommImg(String email) throws Exception {
    System.out.println("getcommImg service email : " + email);
    System.out.println("getcommImg service dao : " + reviewDAO.getCommImg(email));
    FileVO commImg = reviewDAO.getCommImg(email);
    return commImg;
  }

  @Override
  public void removeBoardComm(int comId) throws Exception {
    reviewDAO.deleteRComm(comId);
  }

}
