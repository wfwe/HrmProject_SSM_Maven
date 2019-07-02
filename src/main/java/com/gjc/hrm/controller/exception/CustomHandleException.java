package com.gjc.hrm.controller.exception;

import com.gjc.hrm.service.NoticeService;
import com.gjc.hrm.service.impl.NoticeServiceImpl;
import com.gjc.hrm.util.DateUtil;
import com.gjc.hrm.util.EmailAccout;
import com.gjc.hrm.util.MessageInfo;
import com.gjc.hrm.util.SendEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;

public class CustomHandleException implements HandlerExceptionResolver {

    /*@Autowired
    private JavaMailSender javaMailSender;*/

    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        //异常信息
        String msg;

        if (e instanceof MyException){
            msg = e.getMessage();
        }else{
            Writer out = new StringWriter();
            PrintWriter s = new PrintWriter(out);
            e.printStackTrace(s);
            msg = out.toString();
        }
        //将错误信息发邮件给网站管理员

        if (!(e instanceof MessagingException)){
            List<String> list = new LinkedList<>();
            list.add("m13630444146@163.com");
            MessageInfo messageInfo = new MessageInfo("m13630444146@163.com", list, new Date(), "人事管理系统故障",
                    "<a href='http://hrm.dfeng.xyz:8080'>点击打开人事管理系统</a><br/>"+"员工号为："+httpServletRequest.getSession().getAttribute("userName")+"，姓名为"+httpServletRequest.getSession().getAttribute("realName")+",在"+DateUtil.currentDate() +"使用系统时出现问题如下：" +
                            msg);
            EmailAccout emailAccout = new EmailAccout("m13630444146@163.com", "gjc123456", "smtp.163.com");
            try {
                SendEmail.sslSend(messageInfo,emailAccout);
            } catch (MessagingException e1) {
                e1.printStackTrace();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("msg",msg);
        modelAndView.setViewName("/error");
        return modelAndView;
    }
}
