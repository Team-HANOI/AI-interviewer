package com.team.interview.batch.jobs;

import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import com.team.interview.batch.tasklets.JandiTasklet;

//@Configuration
public class JandiConfig {
  @Autowired
  private  JobBuilderFactory jobBuilderFactory; // Job 빌더 생성용
  @Autowired
  private  StepBuilderFactory stepBuilderFactory; // Step 빌더 생성용
  @Autowired
  private  JandiTasklet jandiTasklet; // Step 빌더 생성용

  // JobBuilderFactory를 통해서 jandiJob을 생성
  @Bean
  public Job jandiJob() {
    return jobBuilderFactory.get("jandiJob")
        .start(jandiStep())  // Step 설정
        .build();
  }

  // StepBuilderFactory를 통해서 jandiStep을 생성
  @Bean
  public Step jandiStep() {
    return stepBuilderFactory.get("jandiStep")
        .tasklet(jandiTasklet) // Tasklet 설정
        .build();
  }

}
