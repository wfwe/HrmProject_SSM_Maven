package com.gjc.hrm.util;


import java.util.Date;
import java.util.List;

public class MessageInfo {

    private String  from;


    private List<String> to;


    private Date sendDate;


    private String subject;


    private String msg;

    public MessageInfo() {

    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public List<String> getTo() {
        return to;
    }

    public void setTo(List<String> to) {
        this.to = to;
    }

    public Date getSendDate() {
        return sendDate;
    }

    public void setSendDate(Date sendDate) {
        this.sendDate = sendDate;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public MessageInfo(String from, List<String> to, Date sendDate, String subject, String msg) {

        this.from = from;
        this.to = to;
        this.sendDate = sendDate;
        this.subject = subject;
        this.msg = msg;
    }
}
