package com.gjc.hrm.service;

import com.gjc.hrm.domain.JobInf;

import java.util.List;

public interface JobInfService {
    int addJobInf(JobInf jobInf);

    int findAllJobCount();

    List<JobInf> findAllJobInfPaging(int startIndex, int pageSize);

    int editJobInf(JobInf jobInf);

    JobInf findJobInfById(int id);

    int deleteJobInf(int[] ids);

    List<JobInf> findAllJobInf();
}
