package com.gjc.hrm.service.impl;

import com.gjc.hrm.domain.EmpDeptJob;
import com.gjc.hrm.domain.EmployeeInf;
import com.gjc.hrm.domain.EmployeeInfExample;
import com.gjc.hrm.domain.UserInf;
import com.gjc.hrm.mapper.EmployeeInfMapper;
import com.gjc.hrm.service.EmpInfService;
import com.gjc.hrm.service.UserInfService;
import com.gjc.hrm.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class EmpInfServiceImpl implements EmpInfService {

    @Autowired
    private EmployeeInfMapper employeeInfMapper;

    @Autowired
    private UserInfService userInfService;

    @Override
    public int findEmpInfCount(String startTime, String endTime, String searchDept, String searchJob, String searchName) throws ParseException {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = null;
        Date endDate = null;
        EmployeeInfExample employeeInfExample = new EmployeeInfExample();
        //employeeInfExample.setSearchName(searchName);
        EmployeeInfExample.Criteria criteria = employeeInfExample.createCriteria();
        if (!(searchName == null || searchName == "")){
            criteria.andNameLike("%"+searchName+"%");
        }
        if ( startTime == null || startTime == "" ){
            if (endTime == null || endTime == ""){
            }else{
                endDate = DateUtil.DateChangeAndAdd(endTime);
                criteria.andCreateDateLessThanOrEqualTo(endDate);
            }
        }else {
            startDate = format.parse(startTime);
            if (endTime == null || endTime == ""){
                criteria.andCreateDateGreaterThanOrEqualTo(startDate);
            }else {
                endDate = DateUtil.DateChangeAndAdd(endTime);
                criteria.andCreateDateBetween(startDate,endDate);
            }
        }
        if (!(searchDept == null || searchDept == "")){
            criteria.andDeptIdEqualTo(Integer.valueOf(searchDept));
        }
        if (!(searchJob == null || searchJob == "")){
            criteria.andJobIdEqualTo(Integer.valueOf(searchJob));
        }

        return employeeInfMapper.countByExample(employeeInfExample);
    }

    @Override
    public List<EmpDeptJob> findEmpInfPaging(int startIndex, int pageSize, String startTime, String endTime, String searchDept, String searchJob, String searchName) throws ParseException {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = null;
        Date endDate = null;
        EmployeeInfExample employeeInfExample = new EmployeeInfExample();
        employeeInfExample.setOffset(startIndex);
        employeeInfExample.setLimit(pageSize);
        //employeeInfExample.setSearchName(searchName);
        EmployeeInfExample.Criteria criteria = employeeInfExample.createCriteria();
        if (!(searchName == null || searchName == "")){
            criteria.andNameLike("%"+searchName+"%");
        }
        if ( startTime == "" ||startTime == null){
            if (endTime == null || endTime == ""){
            }else{
                endDate = DateUtil.DateChangeAndAdd(endTime);
                criteria.andCreateDateLessThanOrEqualTo(endDate);
            }
        }else {
            startDate = format.parse(startTime);
            if (endTime == null || endTime == ""){
                criteria.andCreateDateGreaterThanOrEqualTo(startDate);
            }else {
                endDate = DateUtil.DateChangeAndAdd(endTime);
                criteria.andCreateDateBetween(startDate,endDate);
            }
        }
        if (!(searchDept == null || searchDept == "")){
            criteria.andDeptIdEqualTo(Integer.valueOf(searchDept));
        }
        if (!(searchJob == null || searchJob == "")){
            criteria.andJobIdEqualTo(Integer.valueOf(searchJob));
        }

        List<EmpDeptJob> empDeptJobList = employeeInfMapper.selectByExample(employeeInfExample);
        return empDeptJobList;
    }

    @Override
    public int addEmpInf(EmployeeInf employeeInf) {
        int rst = employeeInfMapper.insertSelective(employeeInf);
        UserInf userInf = new UserInf();
        userInf.setUsername(employeeInf.getName());
        userInf.setLoginname(employeeInf.getCardId());
        //密码为员工号的后6位
        userInf.setPassword(employeeInf.getCardId().substring(employeeInf.getCardId().length()-6,employeeInf.getCardId().length()));
        userInf.setStatus(1);
        int r = userInfService.addUserInf(userInf);
        if (r == 1 && rst == 1)
            return rst;
        else
            return 0;
    }

    @Override
    public EmpDeptJob findEmpInfById(int id) {
        return employeeInfMapper.selectByPrimaryKey(id);
    }

    @Override
    public int editEmpInf(EmployeeInf employeeInf) {
        int rst = employeeInfMapper.updateByPrimaryKeySelective(employeeInf);
        return rst;
    }

    @Override
    public int deleteUserInfById(int[] ids) {
        Boolean rst =false;
        for (int i=0; i<ids.length;i++){
            int r = employeeInfMapper.deleteByPrimaryKey(ids[i]);
            if (r == 1){
                rst = true;
            }
        }
        if (rst)
            return 1;
        else
            return 0;
    }

    @Override
    public List<String> findEmpEmail() {
        List<String> emailList = employeeInfMapper.selectEmail();
        return emailList;
    }

    @Override
    public EmpDeptJob findEmpInfByUserName(String loginName) {
        EmployeeInfExample employeeInfExample = new EmployeeInfExample();
        EmployeeInfExample.Criteria criteria = employeeInfExample.createCriteria();
        criteria.andCardIdEqualTo(loginName);
        List<EmpDeptJob> empDeptJob = employeeInfMapper.selectByExample(employeeInfExample);
        if (empDeptJob.size()>0){
            return empDeptJob.get(0);
        }else {
            return null;
        }

    }

    @Override
    public List<String> findManagerEmail(EmployeeInfExample employeeInfExample) {
        List<String> rst = employeeInfMapper.findManagerEmail(employeeInfExample);
        return rst;
    }
}
