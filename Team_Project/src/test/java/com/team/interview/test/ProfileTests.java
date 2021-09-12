package com.team.interview.test;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import com.team.interview.dao.ProfileDAO;
import com.team.interview.vo.ProfileVO;

@SpringBootTest
public class ProfileTests {


  @Autowired
  private ProfileDAO profileDAO;

  static String newDay(String jandi) {
    StringBuilder sb = new StringBuilder(jandi);
    int indexOfComma = sb.indexOf(",");
    sb.delete(0, indexOfComma + 1);
    sb.append(",0");
    jandi = sb.toString();

    return jandi;
  }

  static String interviewComplete(String jandi) {

    StringBuilder sb = new StringBuilder(jandi);
    int lastIndexOfComma = sb.lastIndexOf(",");
    String lastCount = sb.substring(lastIndexOfComma + 1, sb.length());
    int updatedCount = Integer.parseInt(lastCount) + 1;
    sb.replace(lastIndexOfComma + 1, sb.length(), String.valueOf(updatedCount));
    jandi = sb.toString();

    return jandi;
  }

  // 자정에
  // db에서 String 가져와서 newDay() 호출 후 return 받은 String을 db에 업데이트
  //  @Test
  public void testUpdateNewDayJandiForEachProfile() {

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

  }

  @Test
  public void testInterviewComplete() {
    int total = profileDAO.getMaxNumOfPfId();

    for (int i = 1; i <= total; i++) {
      ProfileVO profileVO = profileDAO.getProfile(i);
      if(profileVO == null) {
        continue;
      }
      String jandi = profileVO.getJandi();
      jandi = interviewComplete(jandi);
      profileVO.setJandi(jandi);

      profileDAO.updateNewDayJandi(profileVO);
    }
  }

}


