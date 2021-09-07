package com.team.interview.service;

import java.util.List;
import com.team.interview.vo.Criteria;
import com.team.interview.vo.InterviewRecordVO;

public interface InterviewRecordService {
  public boolean remove(int iRecordId);
  public InterviewRecordVO get(int iRecordId);
  public List<InterviewRecordVO> getList(Criteria cri);

  public int getTotal(Criteria cri);
}
