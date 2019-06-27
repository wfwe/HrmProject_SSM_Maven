package com.gjc.hrm.service;

import com.gjc.hrm.domain.NoticeInf;
import com.gjc.hrm.domain.NoticeUser;

import java.text.ParseException;
import java.util.List;

public interface NoticeService {
    int addNotice(NoticeInf noticeInf);

    List<NoticeUser> findNoticePaging(int startIndex, int pageSize, String startTime, String endTime, String noticeTitle) throws ParseException;

    int findNoticeCount(String startTime, String endTime, String noticeTitle) throws ParseException;

    String findNoticeById(Integer id);

    int deleteNotice(int[] ids);
}
