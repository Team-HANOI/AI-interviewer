package com.team.interview.batch.tasklets;

import org.springframework.batch.core.StepContribution;
import org.springframework.batch.core.scope.context.ChunkContext;
import org.springframework.batch.core.step.tasklet.Tasklet;
import org.springframework.batch.repeat.RepeatStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.team.interview.dao.ProfileDAO;
import com.team.interview.vo.ProfileVO;

//@Component
public class JandiTasklet implements Tasklet{

  @Autowired
  public ProfileDAO profileDAO;

  @Override
  public RepeatStatus execute(StepContribution contribution, ChunkContext chunkContext)
      throws Exception {
    int total = profileDAO.getMaxNumOfPfId();

    for (int i = 1; i <= total; i++) {
      ProfileVO profileVO = profileDAO.getProfile(i);
      if(profileVO == null) {
        continue;
      }
      String jandi = profileVO.getJandi();
      jandi = newDay(jandi);
      profileVO.setJandi(jandi);

      profileDAO.updateNewDayJandi(profileVO);
    }

    System.out.println("executed jandi!!");

    return RepeatStatus.FINISHED;
  }



  static String newDay(String jandi) {
    StringBuilder sb = new StringBuilder(jandi);
    int indexOfComma = sb.indexOf(",");
    sb.delete(0, indexOfComma + 1);
    sb.append(",0");
    jandi = sb.toString();

    return jandi;
  }

}
