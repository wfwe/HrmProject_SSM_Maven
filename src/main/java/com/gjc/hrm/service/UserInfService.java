package com.gjc.hrm.service;


import com.gjc.hrm.domain.UserInf;

import java.util.List;

public interface UserInfService {
    int queryUserInfByLoginName(UserInf userInf);

    List<UserInf> findAUserInfPaging(int startIndex, int pageSize);

    int findAllUserCount();

    int addUserInf(UserInf userInf);
}
