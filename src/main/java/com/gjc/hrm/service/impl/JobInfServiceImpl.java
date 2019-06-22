package com.gjc.hrm.service.impl;

import com.gjc.hrm.domain.JobInf;
import com.gjc.hrm.domain.JobInfExample;
import com.gjc.hrm.mapper.JobInfMapper;
import com.gjc.hrm.service.JobInfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobInfServiceImpl implements JobInfService {

    @Autowired
    JobInfMapper jobInfMapper;

    @Override
    public int addJobInf(JobInf jobInf) {
        int rst = jobInfMapper.insertSelective(jobInf);
        return rst;
    }

    @Override
    public int findAllJobCount() {
        return jobInfMapper.countByExample(null);
    }

    @Override
    public List<JobInf> findAllJobInfPaging(int startIndex, int pageSize) {
        JobInfExample jobInfExample = new JobInfExample();
        jobInfExample.setOffset(startIndex);
        jobInfExample.setLimit(pageSize);
        List<JobInf> jobInfList = jobInfMapper.selectByExample(jobInfExample);
        return jobInfList;
    }

    @Override
    public int editJobInf(JobInf jobInf) {
        //JobInfExample jobInfExample = new JobInfExample();
        int rst = jobInfMapper.updateByPrimaryKeySelective(jobInf);
        return rst;
    }

    @Override
    public JobInf findJobInfById(int id) {
        return jobInfMapper.selectByPrimaryKey(id);
    }

    @Override
    public int deleteJobInf(int[] ids) {
        Boolean rst =false;
        for (int i=0; i<ids.length;i++){
            int r = jobInfMapper.deleteByPrimaryKey(ids[i]);
            if (r == 1){
                rst = true;
            }
        }
        if (rst)
            return 1;
        else
            return 0;
    }
}
