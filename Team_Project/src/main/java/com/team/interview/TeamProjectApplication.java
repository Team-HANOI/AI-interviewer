package com.team.interview;

import org.springframework.batch.core.configuration.annotation.EnableBatchProcessing;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableScheduling
@EnableBatchProcessing
@SpringBootApplication
public class TeamProjectApplication {

  public static void main(String[] args) {
    SpringApplication.run(TeamProjectApplication.class, args);
  }

}
