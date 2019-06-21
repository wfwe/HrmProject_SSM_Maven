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
}
