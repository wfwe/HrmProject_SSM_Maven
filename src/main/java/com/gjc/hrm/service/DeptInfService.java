package com.gjc.hrm.service;

import com.gjc.hrm.domain.DeptInf;

import java.util.List;

public interface DeptInfService {
    DeptInf findDeptInfById(int id);

    int deleteDeptInfById(int[] ids);

    int editDeptInf(DeptInf deptInf);

    int findAllDeptCount();

    List<DeptInf> findAllDeptInfPaging(int startIndex, int pageSize);

    int addDeptInf(DeptInf deptInf);

    List<DeptInf> findAllDeptInf();
}
