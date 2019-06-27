package com.gjc.hrm.service.impl;


import com.alibaba.fastjson.JSONObject;
import com.gjc.hrm.domain.NoticeInf;
import com.gjc.hrm.domain.NoticeInfExample;
import com.gjc.hrm.domain.NoticeUser;
import com.gjc.hrm.mapper.NoticeInfMapper;
import com.gjc.hrm.service.NoticeService;
import com.gjc.hrm.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    NoticeInfMapper noticeInfMapper;

    @Override
    public int addNotice(NoticeInf noticeInf) {
        int rst = noticeInfMapper.insertSelective(noticeInf);
        return rst;
    }

    @Override
    public List<NoticeUser> findNoticePaging(int startIndex, int pageSize, String startTime, String endTime, String noticeTitle) throws ParseException {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = null;
        Date endDate = null;
        NoticeInfExample noticeInfExample = new NoticeInfExample();
        noticeInfExample.setOffset(startIndex);
        noticeInfExample.setLimit(pageSize);
        NoticeInfExample.Criteria criteria = noticeInfExample.createCriteria();
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
    public int findNoticeCount(String startTime, String endTime, String noticeTitle) throws ParseException {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = null;
        Date endDate = null;
        NoticeInfExample noticeInfExample = new NoticeInfExample();
        NoticeInfExample.Criteria criteria = noticeInfExample.createCriteria();
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
}
