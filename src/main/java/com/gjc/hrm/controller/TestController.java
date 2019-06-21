package com.gjc.hrm.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
    @RequestMapping("/test")
    @ResponseBody
    public String test(){
        return "This is a test!"+"这水";
    }
}
