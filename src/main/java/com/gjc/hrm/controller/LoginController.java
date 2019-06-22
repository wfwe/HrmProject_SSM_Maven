package com.gjc.hrm.controller;


import com.gjc.hrm.domain.UserInf;

import com.gjc.hrm.mapper.UserInfMapper;
import com.gjc.hrm.service.UserInfService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;


@Controller
public class LoginController {
    @Autowired
    private UserInfService userInfService;

    @RequestMapping(value = "/login.action",method = RequestMethod.POST)
    public String login(HttpServletRequest request,UserInf userInf,Model model){
        Map<String,String> error = new HashMap<>();
        int rst = userInfService.queryUserInfByLoginName(userInf);
        if (rst == 3){
            request.getSession().setAttribute("userName",userInf.getLoginname());
            return "index";
        }else if (rst == 1){
            error.put("error","请输入账号！");
            model.addAttribute("error",error);
            return "login";
        }else if (rst == 2){
            error.put("error","请输入密码！");
            model.addAttribute("error",error);
            return "login";
        }
        else {
            error.put("error","账户或者密码错误！");
            model.addAttribute("error",error);
            return "login";
        }


    }

    @RequestMapping("quitLogin.action")
    public String quitLogin(HttpServletRequest request){
        request.getSession().removeAttribute("userName");
        return "login";
    }

}
