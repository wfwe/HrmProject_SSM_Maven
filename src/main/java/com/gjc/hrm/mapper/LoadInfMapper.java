package com.gjc.hrm.mapper;

import com.gjc.hrm.domain.LoadInf;
import com.gjc.hrm.domain.LoadInfExample;
import com.gjc.hrm.domain.LoadUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LoadInfMapper {
    int countByExample(LoadInfExample example);

    int deleteByExample(LoadInfExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(LoadInf record);

    int insertSelective(LoadInf record);

    List<LoadUser> selectByExample(LoadInfExample example);

    LoadInf selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") LoadInf record, @Param("example") LoadInfExample example);

    int updateByExample(@Param("record") LoadInf record, @Param("example") LoadInfExample example);

    int updateByPrimaryKeySelective(LoadInf record);

    int updateByPrimaryKey(LoadInf record);
}