package com.alpaca.app.sample.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created by Hyunsik Lee on 2021-08-11
 * Blog : https://hs95blue.github.io/
 * Github : https://github.com/hs95blue
 */
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class AuthVO {

    // 아이디
    private String email;
    // 권한
    private MemberRole auth;

}
