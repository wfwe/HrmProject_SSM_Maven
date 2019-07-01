package com.gjc.hrm.service;

import com.gjc.hrm.domain.LoadInf;
import com.gjc.hrm.domain.LoadUser;

import java.text.ParseException;
import java.util.List;

public interface LoadService {
    int addLoad(LoadInf loadInf);

    List<LoadUser> findLoadPaging(int startIndex,int pageSize,String startTime, String endTime,String searchLoadTitle,int status) throws ParseException;

    int findLoadCount(String startTime, String endTime, String searchLoadTitle,int status) throws ParseException;

    int deleteLoadById(String id);

    LoadInf findLoadById(Integer id);

    int update(LoadInf loadInf);

    LoadInf find(int id);
}
