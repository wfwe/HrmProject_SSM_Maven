package com.gjc.hrm.service;


import com.gjc.hrm.domain.UserInf;

import java.text.ParseException;
import java.util.List;

public interface UserInfService {
    int queryUserInfByLoginName(UserInf userInf);

    List<UserInf> findAUserInfPaging(int startIndex, int pageSize,String startTime,String endTime,String status,String searchName) throws ParseException;

    int findAllUserCount(String startTime,String endTime,String status,String searchName) throws ParseException;

    int addUserInf(UserInf userInf);

    UserInf findUserInfById(int id);

    int editUserInf(UserInf userInf);

    int deleteUserInfById(int[] ids);
}
