package com.gjc.hrm.service.impl;

import com.gjc.hrm.domain.UserInf;
import com.gjc.hrm.domain.UserInfExample;
import com.gjc.hrm.mapper.UserInfMapper;
import com.gjc.hrm.service.UserInfService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
            rst = 1;
            return rst;
        }
        if (!(StringUtils.isNotBlank(userInf.getPassword()))){
            //密码未输入
            rst = 2;
            return rst;
        }
        UserInfExample userInfExample = new UserInfExample();
        UserInfExample.Criteria criteria = userInfExample.createCriteria();
        criteria.andLoginnameEqualTo(userInf.getLoginname());
        List<UserInf> userInfList = userInfMapper.selectByExample(userInfExample);
        if (userInfList.size() > 0){
            if (userInfList.get(0).getPassword().equals(userInf.getPassword())){
                //登录成功
                rst = 3;
                return rst;
            }else {
                //密码错误
                rst = 4;
                return rst;
            }
        }
        return rst;
    }

    @Override
    public List<UserInf> findAUserInfPaging(int startIndex, int pageSize) {
        UserInfExample userInfExample = new UserInfExample();
        userInfExample.setOffset(startIndex);
        userInfExample.setLimit(pageSize);
        List<UserInf> userInfList = userInfMapper.selectByExample(userInfExample);
        return userInfList;
    }

    @Override
    public int findAllUserCount() {
        return userInfMapper.countByExample(new UserInfExample());
    }

    @Override
    public int addUserInf(UserInf userInf) {
        int rst = userInfMapper.insertSelective(userInf);
        return rst;
    }
}
