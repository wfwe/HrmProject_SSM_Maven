package com.gjc.hrm.domain;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

public class NoticeInf {
    private Integer id;

    private String noticeTitle;

    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date noticeCreatedate;

    private Integer isTop;

    private Integer userId;

    private Integer noticePeople;

    private String noticeContent;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNoticeTitle() {
        return noticeTitle;
    }

    public void setNoticeTitle(String noticeTitle) {
        this.noticeTitle = noticeTitle == null ? null : noticeTitle.trim();
    }

    public Date getNoticeCreatedate() {
        return noticeCreatedate;
    }

    public void setNoticeCreatedate(Date noticeCreatedate) {
        this.noticeCreatedate = noticeCreatedate;
    }

    public Integer getIsTop() {
        return isTop;
    }

    public void setIsTop(Integer isTop) {
        this.isTop = isTop;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getNoticePeople() {
        return noticePeople;
    }

    public void setNoticePeople(Integer noticePeople) {
        this.noticePeople = noticePeople;
    }

    public String getNoticeContent() {
        return noticeContent;
    }

    public void setNoticeContent(String noticeContent) {
        this.noticeContent = noticeContent == null ? null : noticeContent.trim();
    }
}