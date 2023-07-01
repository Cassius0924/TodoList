package com.cassius0924.hellospringboot.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <b>Date 2023/6/29</b>
 *
 * @author HoChihchou
 */
@RestController
public class HelloCassius {
    @RequestMapping("/hello")
    public String hello() {
        return "Hello Spring Boot! 你好 Cassius";
    }
}
