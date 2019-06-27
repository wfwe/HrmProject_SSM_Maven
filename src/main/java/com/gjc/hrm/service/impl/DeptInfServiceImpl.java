package com.gjc.hrm.service.impl;

import com.gjc.hrm.domain.DeptInf;
import com.gjc.hrm.domain.DeptInfExample;
import com.gjc.hrm.domain.JobInfExample;
import com.gjc.hrm.mapper.DeptInfMapper;
import com.gjc.hrm.service.DeptInfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptInfServiceImpl implements DeptInfService {

    @Autowired
    private DeptInfMapper deptInfMapper;

    @Override
    public DeptInf findDeptInfById(int id) {
        return deptInfMapper.selectByPrimaryKey(id);
    }

    @Override
    public int deleteDeptInfById(int[] ids) {
        Boolean rst =false;
        for (int i=0; i<ids.length;i++){
            int r = deptInfMapper.deleteByPrimaryKey(ids[i]);
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
    public int editDeptInf(DeptInf deptInf) {
        int rst = deptInfMapper.updateByPrimaryKeySelective(deptInf);
        return rst;
    }

    @Override
    public int findAllDeptCount() {
        return deptInfMapper.countByExample(null);
    }

    @Override
    public List<DeptInf> findAllDeptInfPaging(int startIndex, int pageSize) {
        DeptInfExample deptInfExample = new DeptInfExample();
        deptInfExample.setOffset(startIndex);
        deptInfExample.setLimit(pageSize);
        List<DeptInf> deptInfList = deptInfMapper.selectByExample(deptInfExample);
        return deptInfList;
    }

    @Override
    public int addDeptInf(DeptInf deptInf) {
        int rst = deptInfMapper.insertSelective(deptInf);
        return rst;
    }

    @Override
    public List<DeptInf> findAllDeptInf() {
        return deptInfMapper.selectByExample(null);
    }
}
