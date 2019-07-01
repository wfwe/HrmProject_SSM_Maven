package com.gjc.hrm.service;

import com.gjc.hrm.domain.NoticeInf;
import com.gjc.hrm.domain.NoticeUser;

import javax.mail.MessagingException;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;

public interface NoticeService {
    int addNotice(NoticeInf noticeInf) throws IOException, MessagingException;

    List<NoticeUser> findNoticePaging(int status, int startIndex, int pageSize, String startTime, String endTime, String noticeTitle) throws ParseException;

    int findNoticeCount(int status, String startTime, String endTime, String noticeTitle) throws ParseException;

    String findNoticeById(Integer id);

    int deleteNotice(int[] ids);
}
