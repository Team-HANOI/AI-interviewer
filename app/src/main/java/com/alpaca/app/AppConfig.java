package com.alpaca.app;

import org.apache.catalina.Context;
import org.apache.tomcat.util.scan.StandardJarScanFilter;
import org.apache.tomcat.util.scan.StandardJarScanner;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.StringUtils;

import java.util.LinkedHashSet;
import java.util.Set;

// basePackages 지정하지 않더라도 com.alpaca.app.* 를 탐색하며 스프링 빈 등록
@Configuration
@ComponentScan(basePackages = "com.alpaca.app")
@MapperScan(value = {"com.alpaca.app.sample.mapper"})
public class AppConfig {
    @Bean
    public TomcatServletWebServerFactory tomcatFactory() {
        return new TomcatServletWebServerFactory() {
            @Override
            protected void postProcessContext(Context context) {
                Set<String> pattern = new LinkedHashSet<>();
                pattern.add("osdt*.jar");
                pattern.add("oraclepki*.jar");
                StandardJarScanFilter filter = new StandardJarScanFilter();
                filter.setTldSkip(StringUtils.collectionToCommaDelimitedString(pattern));
                ((StandardJarScanner) context.getJarScanner()).setJarScanFilter(filter);
            }
        };
    }
}

