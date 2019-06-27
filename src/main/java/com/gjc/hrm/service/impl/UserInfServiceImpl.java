package com.gjc.hrm.service.impl;

import com.gjc.hrm.domain.UserInf;
import com.gjc.hrm.domain.UserInfExample;
import com.gjc.hrm.mapper.UserInfMapper;
import com.gjc.hrm.service.UserInfService;
import com.gjc.hrm.util.DateUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class UserInfServiceImpl implements UserInfService {
    @Autowired
    private UserInfMapper userInfMapper;

    @Override
    public int queryUserInfByLoginName(UserInf userInf) {
        int rst = 0;
        if (!(StringUtils.isNotBlank(userInf.getLoginname()))){
            //账号未输入
            rst = -3;
            return rst;
        }
        if (!(StringUtils.isNotBlank(userInf.getPassword()))){
            //密码未输入
            rst = -2;
            return rst;
        }
        UserInfExample userInfExample = new UserInfExample();
        UserInfExample.Criteria criteria = userInfExample.createCriteria();
        criteria.andLoginnameEqualTo(userInf.getLoginname());
        List<UserInf> userInfList = userInfMapper.selectByExample(userInfExample);
        if (userInfList.size() > 0){
            if (userInfList.get(0).getPassword().equals(userInf.getPassword())){
                //登录成功
                rst = userInfList.get(0).getId();
                return rst;
            }else {
                //密码错误
                rst = -4;
                return rst;
            }
        }
        return rst;
    }

    @Override
    public List<UserInf> findAUserInfPaging(int startIndex, int pageSize,String startTime,String endTime,String status,String searchName) throws ParseException {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = null;
        Date endDate = null;
        UserInfExample userInfExample = new UserInfExample();
        userInfExample.setOffset(startIndex);
        userInfExample.setLimit(pageSize);
        //userInfExample.setSearchName(searchName);
        UserInfExample.Criteria criteria = userInfExample.createCriteria();
        if (!(searchName == null || searchName == "")){
            criteria.andUsernameLike("%"+searchName+"%");
        }
        if ( startTime == "" ||startTime == null){
            if (endTime == null || endTime == ""){
            }else{
                endDate = DateUtil.DateChangeAndAdd(endTime);
                criteria.andCreatedateLessThanOrEqualTo(endDate);
            }
        }else {
            startDate = format.parse(startTime);
            if (endTime == null || endTime == ""){
                criteria.andCreatedateGreaterThanOrEqualTo(startDate);
            }else {
                endDate = DateUtil.DateChangeAndAdd(endTime);
                criteria.andCreatedateBetween(startDate,endDate);
            }
        }
        if (!(status ==null || status == "" )){
            criteria.andStatusEqualTo(Integer.parseInt(status));
        }
        List<UserInf> userInfList = userInfMapper.selectByExample(userInfExample);
        return userInfList;
    }

    @Override
    public int findAllUserCount(String startTime,String endTime,String status,String searchName) throws  ParseException {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = null;
        Date endDate = null;
        UserInfExample userInfExample = new UserInfExample();
        //userInfExample.setSearchName(searchName);
        UserInfExample.Criteria criteria = userInfExample.createCriteria();
        if (!(searchName == null || searchName == "")){
            criteria.andUsernameLike("%"+searchName+"%");
        }
        if (startTime == null || startTime == ""){
            if (endTime == null || endTime == ""){
            }else{
                Date date = DateUtil.DateChangeAndAdd(endTime);
                criteria.andCreatedateLessThanOrEqualTo(date);
            }
        }else {
            startDate = format.parse(startTime);
            if (endTime == null || endTime == ""){
                criteria.andCreatedateGreaterThanOrEqualTo(startDate);
            }else {
                Date date = DateUtil.DateChangeAndAdd(endTime);
                criteria.andCreatedateBetween(startDate,date);
            }
        }
        if (!(status ==null || status == "" )){
            criteria.andStatusEqualTo(Integer.parseInt(status));
        }
        return userInfMapper.countByExample(userInfExample);
    }

    @Override
    public int addUserInf(UserInf userInf) {
        int rst = userInfMapper.insertSelective(userInf);
        return rst;
    }

    @Override
    public UserInf findUserInfById(int id) {
        return userInfMapper.selectByPrimaryKey(id);
    }

    @Override
    public int editUserInf(UserInf userInf) {
        int rst = userInfMapper.updateByPrimaryKeySelective(userInf);
        return rst;
    }

    @Override
    public int deleteUserInfById(int[] ids) {
        Boolean rst =false;
        for (int i=0; i<ids.length;i++){
            int r = userInfMapper.deleteByPrimaryKey(ids[i]);
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
