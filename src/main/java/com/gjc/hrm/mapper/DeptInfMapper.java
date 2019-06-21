package com.gjc.hrm.mapper;

import com.gjc.hrm.domain.DeptInf;
import com.gjc.hrm.domain.DeptInfExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DeptInfMapper {
    int countByExample(DeptInfExample example);

    int deleteByExample(DeptInfExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(DeptInf record);

    int insertSelective(DeptInf record);

    List<DeptInf> selectByExample(DeptInfExample example);

    DeptInf selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") DeptInf record, @Param("example") DeptInfExample example);

    int updateByExample(@Param("record") DeptInf record, @Param("example") DeptInfExample example);

    int updateByPrimaryKeySelective(DeptInf record);

    int updateByPrimaryKey(DeptInf record);
}