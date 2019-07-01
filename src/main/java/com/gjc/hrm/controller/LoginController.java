package com.gjc.hrm.controller;


import com.gjc.hrm.controller.exception.MyException;
import com.gjc.hrm.domain.UserInf;

import com.gjc.hrm.mapper.UserInfMapper;
import com.gjc.hrm.service.UserInfService;
import com.gjc.hrm.util.RandomValidateCode;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;


@Controller
public class LoginController {
    @Autowired
    private UserInfService userInfService;

    @RequestMapping("/toLogin.action")
    public String toLogin(){
        return "login";
    }

    @RequestMapping(value = "/login.action",method = RequestMethod.POST)
    public String login(HttpServletRequest request,UserInf userInf, Model model){
        Map<String,String> error = new HashMap<>();
        if (userInf.getLoginname() == null || userInf.getLoginname() == ""){
            error.put("error","请输入验证码！");
            model.addAttribute("error",error);
            return "/login";
        }
        String tmp = userInf.getLoginname();
        userInf.setLoginname(userInf.getUsername());
        userInf.setUsername(tmp);
        String random = (String) request.getSession().getAttribute("RANDOMVALIDATECODEKEY");
        if (random == null || random == ""){
            error.put("error","请输入验证码！");
            model.addAttribute("error",error);
            return "/login";
        }
        if (!(random.equals(userInf.getUsername().toUpperCase()))){
            error.put("error","验证码错误");
            model.addAttribute("error",error);
            return "/login";
        }
        int rst = userInfService.queryUserInfByLoginName(userInf);
        if (rst > 0){
            request.getSession().setAttribute("userName",userInf.getLoginname());
            request.getSession().setAttribute("userId",rst);
            UserInf userInfById = userInfService.findUserInfById(rst);
            request.getSession().setAttribute("status",userInfById.getStatus());
            request.getSession().setAttribute("realName",userInf.getUsername());
            return "redirect: /index.action";
        }else if (rst == -3){
            error.put("error","请输入账号！");
            model.addAttribute("error",error);
            return "/login";
        }else if (rst == -2){
            error.put("error","请输入密码！");
            model.addAttribute("error",error);
            return "/login";
        }
        else {
            error.put("error","账户或者密码错误！");
            model.addAttribute("error",error);
            return "login";
        }


    }

    /**
     * 登录页面生成验证码
     */
    @RequestMapping(value = "/getVerify.action")
    public void getVerify(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
        response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);//输出验证码图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("quitLogin.action")
    public String quitLogin(HttpServletRequest request) {
        int i =1/0;
        request.getSession().removeAttribute("userName");
        request.getSession().removeAttribute("userId");
        request.getSession().removeAttribute("status");
        request.getSession().removeAttribute("realName");
        return "login";
    }

    @RequestMapping("/index.action")
    public String index(){
        return "/index";
    }

}
