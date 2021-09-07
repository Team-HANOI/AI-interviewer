package com.team.interview.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.team.interview.vo.Criteria;
import com.team.interview.vo.InterviewRecordVO;

@Mapper
@Repository
public interface InterviewRecordDAO {

  public InterviewRecordVO read(int iRecordId);
  public List<InterviewRecordVO> getListWithPaging(Criteria cri);
  public int getTotalCount(Criteria cri);

  public int delete(int iRecordId);


}
