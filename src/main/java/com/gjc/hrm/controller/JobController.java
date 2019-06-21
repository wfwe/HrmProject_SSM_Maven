package com.gjc.hrm.controller;

import com.gjc.hrm.domain.JobInf;
import com.gjc.hrm.domain.PageBean;
import com.gjc.hrm.service.JobInfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class JobController {

    @Autowired
    private JobInfService jobInfService;


    @RequestMapping("/AddJobInf.action")
    @ResponseBody
    public String AddJobInf(JobInf jobInf){
        if (jobInf.getName() == null || jobInf.getName() == ""
                || jobInf.getRemark() == null || jobInf.getRemark() == "")
            return "0";
        int rst = jobInfService.addJobInf(jobInf);
        return rst+"";
    }

    @RequestMapping("/FindAllJobInfPaging.action")
    @ResponseBody
    public Map<String,Object> FindAllJobInfPaging(int page,int rows){
        int count = jobInfService.findAllJobCount();
        PageBean pageBean = new PageBean(page,rows,count);
        List<JobInf> jobInfList = jobInfService.findAllJobInfPaging(pageBean.getStartIndex(),pageBean.getPageSize());
        Map<String,Object> map = new HashMap<>();
        map.put("rows",jobInfList);
        map.put("total",count);
        return map;
    }
}
