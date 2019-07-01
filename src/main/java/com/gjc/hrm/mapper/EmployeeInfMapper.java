package com.gjc.hrm.mapper;

import com.gjc.hrm.domain.EmpDeptJob;
import com.gjc.hrm.domain.EmployeeInf;
import com.gjc.hrm.domain.EmployeeInfExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeInfMapper {
    int countByExample(EmployeeInfExample example);

    int deleteByExample(EmployeeInfExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(EmployeeInf record);

    int insertSelective(EmployeeInf record);

    List<EmpDeptJob> selectByExample(EmployeeInfExample example);

    EmpDeptJob selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") EmployeeInf record, @Param("example") EmployeeInfExample example);

    int updateByExample(@Param("record") EmployeeInf record, @Param("example") EmployeeInfExample example);

    int updateByPrimaryKeySelective(EmployeeInf record);

    int updateByPrimaryKey(EmployeeInf record);

    List<String> selectEmail();

    List<String> findManagerEmail(EmployeeInfExample employeeInfExample);
}