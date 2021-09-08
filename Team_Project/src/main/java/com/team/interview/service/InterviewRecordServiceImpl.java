package com.team.interview.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.team.interview.dao.InterviewRecordDAO;
import com.team.interview.vo.Criteria;
import com.team.interview.vo.InterviewRecordVO;

@Service
public class InterviewRecordServiceImpl implements InterviewRecordService{

  @Autowired
  private InterviewRecordDAO interviewRecordDAO;

  @Override
  public boolean remove(int iRecordId) {
    return interviewRecordDAO.delete(iRecordId) == 1;
  }

  @Override
  public InterviewRecordVO get(int iRecordId) {
    return interviewRecordDAO.read(iRecordId);
  }

  @Override
  public List<InterviewRecordVO> getList(Criteria cri) {
    return interviewRecordDAO.getListWithPaging(cri);
  }

  @Override
  public int getTotal(Criteria cri) {
    return interviewRecordDAO.getTotalCount(cri);
  }

}
