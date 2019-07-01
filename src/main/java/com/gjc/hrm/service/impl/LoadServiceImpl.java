package com.gjc.hrm.service.impl;

import com.gjc.hrm.domain.LoadInf;
import com.gjc.hrm.domain.LoadInfExample;
import com.gjc.hrm.domain.LoadUser;
import com.gjc.hrm.mapper.LoadInfMapper;
import com.gjc.hrm.service.LoadService;
import com.gjc.hrm.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

@Service
public class LoadServiceImpl implements LoadService {

    @Autowired
    LoadInfMapper loadInfMapper;

    @Override
    public int addLoad(LoadInf loadInf) {
        int rst = loadInfMapper.insertSelective(loadInf);
        return rst;
    }



    @Override
    public List<LoadUser> findLoadPaging(int startIndex,int pageSize,String startTime, String endTime, String searchLoadTitle,int status) throws ParseException {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = null;
        Date endDate = null;
        LoadInfExample loadInfExample = new LoadInfExample();
        loadInfExample.setOffset(startIndex);
        loadInfExample.setLimit(pageSize);

        LoadInfExample.Criteria criteria = loadInfExample.createCriteria();
        if (status !=0){
            if (status == 1){
                criteria.andCanLoadUserEqualTo(7);
            }else if (status == 2){
                List<Integer> arr = new LinkedList<>();
                arr.add(7);
                arr.add(6);
                criteria.andCanLoadUserIn(arr);
            }
        }
        if (!(searchLoadTitle == null || searchLoadTitle =="")){
            criteria.andLoadNameLike("%"+searchLoadTitle+"%");
        }
        if ( startTime == "" ||startTime == null){
            if (endTime == null || endTime == ""){
            }else{
                endDate = DateUtil.DateChangeAndAdd(endTime);
                criteria.andLoadCreatedateLessThanOrEqualTo(endDate);
            }
        }else {
            startDate = format.parse(startTime);
            if (endTime == null || endTime == ""){
                criteria.andLoadCreatedateGreaterThanOrEqualTo(startDate);
            }else {
                endDate = DateUtil.DateChangeAndAdd(endTime);
                criteria.andLoadCreatedateBetween(startDate,endDate);
            }
        }
        List<LoadUser> loadUserList = loadInfMapper.selectByExample(loadInfExample);
        return loadUserList;
    }

    @Override
    public int findLoadCount(String startTime, String endTime,String searchLoadTitle,int status) throws ParseException {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = null;
        Date endDate = null;
        LoadInfExample loadInfExample = new LoadInfExample();

        LoadInfExample.Criteria criteria = loadInfExample.createCriteria();
        if (!(searchLoadTitle == null || searchLoadTitle =="")){
            criteria.andLoadNameLike("%"+searchLoadTitle+"%");
        }
        if ( startTime == null || startTime == ""){
            if (endTime == null || endTime == ""){
            }else{
                endDate = DateUtil.DateChangeAndAdd(endTime);
                criteria.andLoadCreatedateLessThanOrEqualTo(endDate);
            }
        }else {
            startDate = format.parse(startTime);
            if (endTime == null || endTime == ""){
                criteria.andLoadCreatedateGreaterThanOrEqualTo(startDate);
            }else {
                endDate = DateUtil.DateChangeAndAdd(endTime);
                criteria.andLoadCreatedateBetween(startDate,endDate);
            }
        }

        return loadInfMapper.countByExample(loadInfExample);
    }

    @Override
    public int deleteLoadById(String id) {
        LoadInf loadInf = findLoadById(Integer.valueOf(id));
        File file = new File(loadInf.getLoadPath());
        if (file.exists()){
            file.delete();
        }
        int rst = loadInfMapper.deleteByPrimaryKey(Integer.valueOf(id));
        if (rst == 1)
            return 1;
        else
            return 0;
    }

    @Override
    public LoadInf findLoadById(Integer id) {
        return loadInfMapper.selectByPrimaryKey(id);
    }

    @Override
    public int update(LoadInf loadInf) {
        int r = loadInfMapper.updateByPrimaryKeySelective(loadInf);
        return r;
    }

    @Override
    public LoadInf find(int id) {
        LoadInf loadInf = loadInfMapper.selectByPrimaryKey(id);
        return loadInf;
    }
}
