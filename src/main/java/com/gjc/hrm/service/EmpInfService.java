package com.gjc.hrm.service;

import com.gjc.hrm.domain.EmpDeptJob;
import com.gjc.hrm.domain.EmployeeInf;
import com.gjc.hrm.domain.EmployeeInfExample;

import java.text.ParseException;
import java.util.List;

public interface EmpInfService {
    int findEmpInfCount(String startTime, String endTime, String searchDept, String searchJob, String searchName) throws ParseException;

    List<EmpDeptJob> findEmpInfPaging(int startIndex, int pageSize, String startTime, String endTime, String searchDept, String searchJob, String searchName) throws ParseException;

    int addEmpInf(EmployeeInf employeeInf);

    EmpDeptJob findEmpInfById(int id);

    int editEmpInf(EmployeeInf employeeInf);

    int deleteUserInfById(int[] ids);

    List<String> findEmpEmail();

    EmpDeptJob findEmpInfByUserName(String loginName);

    List<String> findManagerEmail(EmployeeInfExample employeeInfExample);
}
