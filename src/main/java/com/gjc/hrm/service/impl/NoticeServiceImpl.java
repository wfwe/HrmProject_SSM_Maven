package com.gjc.hrm.service.impl;


import com.alibaba.fastjson.JSONObject;
import com.gjc.hrm.domain.EmployeeInfExample;
import com.gjc.hrm.domain.NoticeInf;
import com.gjc.hrm.domain.NoticeInfExample;
import com.gjc.hrm.domain.NoticeUser;
import com.gjc.hrm.mapper.NoticeInfMapper;
import com.gjc.hrm.service.EmpInfService;
import com.gjc.hrm.service.NoticeService;
import com.gjc.hrm.service.UserInfService;
import com.gjc.hrm.util.DateUtil;
import com.gjc.hrm.util.EmailAccout;
import com.gjc.hrm.util.MessageInfo;
import com.gjc.hrm.util.SendEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeInfMapper noticeInfMapper;

   /* @Autowired
    private JavaMailSender javaMailSender;*/

    @Autowired
    private EmpInfService empInfService;

    @Autowired
    private UserInfService userInfService;

    @Override
    public int addNotice(NoticeInf noticeInf) throws IOException, MessagingException {
        if (noticeInf.getNoticePeople() != 0){
            List<String> emailList = new LinkedList<>();
            Properties properties = new Properties();
            properties.load(this.getClass().getResourceAsStream("/properties/mail.properties"));
            String from = properties.getProperty("mail.smtp.username")+"";
            String username = properties.getProperty("mail.smtp.username")+"";
            String password = properties.getProperty("mail.smtp.password")+"";
            String place = properties.getProperty("mail.smtp.host")+"";
        //为1通知公司全体，2只通知管理员
            if (noticeInf.getNoticePeople() == 1){
                emailList =empInfService.findEmpEmail();
            }else {
                //1、先查询所有的管理员，如何再发送邮件
                List<String> ids = userInfService.findUserIsMannger();
                EmployeeInfExample employeeInfExample = new EmployeeInfExample();
                EmployeeInfExample.Criteria criteria = employeeInfExample.createCriteria();
                criteria.andCardIdIn(ids);
                emailList =empInfService.findManagerEmail(employeeInfExample);
            }
            MessageInfo messageInfo = new MessageInfo(from, emailList, new Date(), noticeInf.getNoticeTitle(),noticeInf.getNoticeContent());
            EmailAccout emailAccout = new EmailAccout(username, password, place);
            SendEmail.sslSend(messageInfo,emailAccout);
        }
        int rst = noticeInfMapper.insertSelective(noticeInf);
        return rst;
    }

    @Override
    public List<NoticeUser> findNoticePaging(int status,int startIndex, int pageSize, String startTime, String endTime, String noticeTitle) throws ParseException {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = null;
        Date endDate = null;
        NoticeInfExample noticeInfExample = new NoticeInfExample();
        noticeInfExample.setOffset(startIndex);
        noticeInfExample.setLimit(pageSize);
        NoticeInfExample.Criteria criteria = noticeInfExample.createCriteria();
        if (status == 1){
            criteria.andNoticePeopleBetween(0,1);
        }
        if (!(noticeTitle == null || noticeTitle == "")){
            criteria.andNoticeTitleLike("%"+noticeTitle+"%");
        }
        if ( startTime == null || startTime == "" ){
            if (endTime == null || endTime == ""){
            }else{
                endDate = DateUtil.DateChangeAndAdd(endTime);
                criteria.andNoticeCreatedateLessThanOrEqualTo(endDate);
            }
        }else {
            startDate = format.parse(startTime);
            if (endTime == null || endTime == ""){
                criteria.andNoticeCreatedateGreaterThanOrEqualTo(startDate);
            }else {
                endDate = DateUtil.DateChangeAndAdd(endTime);
                criteria.andNoticeCreatedateBetween(startDate,endDate);
            }
        }
        List<NoticeUser> noticeUserList = noticeInfMapper.selectByExample(noticeInfExample);
        return noticeUserList;
    }

    @Override
    public int findNoticeCount(int status,String startTime, String endTime, String noticeTitle) throws ParseException {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = null;
        Date endDate = null;
        NoticeInfExample noticeInfExample = new NoticeInfExample();
        NoticeInfExample.Criteria criteria = noticeInfExample.createCriteria();
        if (status == 1){
            criteria.andNoticePeopleBetween(0,1);
        }
        if (!(noticeTitle == null || noticeTitle == "")){
            criteria.andNoticeTitleLike("%"+noticeTitle+"%");
        }
        if ( startTime == "" ||startTime == null){
            if (endTime == null || endTime == ""){
            }else{
                endDate = DateUtil.DateChangeAndAdd(endTime);
                criteria.andNoticeCreatedateLessThanOrEqualTo(endDate);
            }
        }else {
            startDate = format.parse(startTime);
            if (endTime == null || endTime == ""){
                criteria.andNoticeCreatedateGreaterThanOrEqualTo(startDate);
            }else {
                endDate = DateUtil.DateChangeAndAdd(endTime);
                criteria.andNoticeCreatedateBetween(startDate,endDate);
            }
        }
        return noticeInfMapper.countByExample(noticeInfExample);
    }

    @Override
    public String findNoticeById(Integer id) {
        NoticeInfExample noticeInfExample = new NoticeInfExample();
        NoticeInfExample.Criteria criteria = noticeInfExample.createCriteria();
        criteria.andIdEqualTo(id);
        List<NoticeInf> noticeInfList= noticeInfMapper.selectByExampleWithBLOBs(noticeInfExample);
        Map<String,Object> map = new HashMap<>();
        map.put("noticeContent",noticeInfList.get(0).getNoticeContent());
        String r = JSONObject.toJSON(map).toString();
        return r;
    }

    @Override
    public int deleteNotice(int[] ids) {
        Boolean rst =false;
        for (int i=0; i<ids.length;i++){
            int r = noticeInfMapper.deleteByPrimaryKey(ids[i]);
            if (r == 1){
                rst = true;
            }
        }
        if (rst)
            return 1;
        else
            return 0;
    }

    /*public int send(String to,String subject,String content){
        MimeMessage mMessage=javaMailSender.createMimeMessage();//创建邮件对象
        Properties prop = new Properties();
        final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
        MimeMessageHelper mMessageHelper;
        String from;
        try {
            //从配置文件中拿到发件人邮箱地址
            prop.load(this.getClass().getResourceAsStream("/properties/mail.properties"));
            from = prop.get("mail.smtp.username")+"";
            prop.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
            prop.setProperty("mail.smtp.socketFactory.fallback", "false");
            prop.setProperty("mail.smtp.port", "465");
            prop.setProperty("mail.smtp.socketFactory.port", "465");

            mMessageHelper=new MimeMessageHelper(mMessage,true);
            mMessageHelper.setTo(to); //收件人邮箱
            mMessageHelper.setFrom(from); //发件人邮箱
            mMessageHelper.setSubject(subject); //邮件的主题
            mMessageHelper.setText(content,true);
            javaMailSender.send(mMessage);//发送邮件
        } catch (MessagingException e3) {
            e3.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        }
        return 1;
    }*/

   /*25端口
   public void send(MessageInfo msg, EmailAccout emailAccout){
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setFrom(msg.getFrom());// 设置发送者地址
        List<String> tos = msg.getTo();
        String to[] = new String[tos.size()];
        tos.toArray(to);
        simpleMailMessage.setTo(to);// 设置接受者地址，可多个
        simpleMailMessage.setSubject(msg.getSubject());
        simpleMailMessage.setSentDate(msg.getSendDate());
        simpleMailMessage.setText(msg.getMsg());
        simpleMailMessage.setFrom(emailAccout.getUsername());
        System.out.println("EmailUtil 邮件发送打印 1111" + simpleMailMessage.toString());
        JavaMailSenderImpl s = new JavaMailSenderImpl();
        s.setHost(emailAccout.getPlace());
        // s.setPort(25);
        s.setUsername(emailAccout.getUsername());
        s.setPassword(emailAccout.getPassword());
        s.send(simpleMailMessage);

    }*/


}
