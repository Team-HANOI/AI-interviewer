package com.team.interview.batch.schedulers;

import java.time.LocalDateTime;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobExecutionException;
import org.springframework.batch.core.JobParametersBuilder;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

//@Component
public class JandiScheduler {
  @Autowired
  private Job job;
  @Autowired
  private JobLauncher jobLauncher;

  // 5초마다 실행
  //  @Scheduled(fixedDelay = 5 * 1000L)
  @Scheduled(cron = "* * 0 * * *")
  public void executeJob () {
    try {
      jobLauncher.run(
          job,
          new JobParametersBuilder()
          .addString("datetime", LocalDateTime.now().toString())
          .toJobParameters()  // job parameter 설정
          );
    } catch (JobExecutionException ex) {
      System.out.println(ex.getMessage());
      ex.printStackTrace();
    }
  }

}
