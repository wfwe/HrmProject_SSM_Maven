package com.gjc.hrm.mapper;

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

    List<EmployeeInf> selectByExample(EmployeeInfExample example);

    EmployeeInf selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") EmployeeInf record, @Param("example") EmployeeInfExample example);

    int updateByExample(@Param("record") EmployeeInf record, @Param("example") EmployeeInfExample example);

    int updateByPrimaryKeySelective(EmployeeInf record);

    int updateByPrimaryKey(EmployeeInf record);
}