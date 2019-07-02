package com.gjc.hrm.mapper;

import com.gjc.hrm.domain.NoticeInf;
import com.gjc.hrm.domain.NoticeInfExample;
import com.gjc.hrm.domain.NoticeUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NoticeInfMapper {


    int countByExample(NoticeInfExample example);

    int deleteByExample(NoticeInfExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(NoticeInf record);

    int insertSelective(NoticeInf record);

    List<NoticeInf> selectByExampleWithBLOBs(NoticeInfExample example);

    List<NoticeUser> selectByExample(NoticeInfExample example);

    NoticeInf selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") NoticeInf record, @Param("example") NoticeInfExample example);

    int updateByExampleWithBLOBs(@Param("record") NoticeInf record, @Param("example") NoticeInfExample example);

    int updateByExample(@Param("record") NoticeInf record, @Param("example") NoticeInfExample example);

    int updateByPrimaryKeySelective(NoticeInf record);

    int updateByPrimaryKeyWithBLOBs(NoticeInf record);

    int updateByPrimaryKey(NoticeInf record);

    String findNew();

    String findEmpNew();
}