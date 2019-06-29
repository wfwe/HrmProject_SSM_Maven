package com.gjc.hrm.controller;

import com.alibaba.fastjson.JSONObject;
import com.gjc.hrm.domain.JobInf;
import com.gjc.hrm.domain.PageBean;
import com.gjc.hrm.service.JobInfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
public class JobController {

    @Autowired
    private JobInfService jobInfService;


    @RequestMapping(value = "/findJobInfById.action",produces="text/html;charset=UTF-8")
    @ResponseBody
    public String findJobInfById(int id){
        JobInf jobInf = jobInfService.findJobInfById(id);
        String rst = JSONObject.toJSON(jobInf).toString();
        return rst;
    }

    @RequestMapping("/deleteJobInf.action")
    @ResponseBody
    public String deleteJobInf(int[] ids){
        int rst = jobInfService.deleteJobInf(ids);
        if (rst ==1)
            return "ok";
        else
            return "fail";
    }


    @RequestMapping("/editJobInf.action")
    @ResponseBody
    public String editJobInf(JobInf jobInf){
        if (jobInf.getName() == null || jobInf.getName() == ""
                || jobInf.getRemark() == null || jobInf.getRemark() == "")
            return "lack";
        int rst = jobInfService.editJobInf(jobInf);
        if (rst ==1)
            return "ok";
        else
            return "fail";
    }

    @RequestMapping("/AddJobInf.action")
    @ResponseBody
    public String AddJobInf(JobInf jobInf){
        if (jobInf.getName() == null || jobInf.getName() == ""
                || jobInf.getRemark() == null || jobInf.getRemark() == "")
            return "lack";
        int rst = jobInfService.addJobInf(jobInf);
        if (rst ==1)
            return "ok";
        else
            return "fail";
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

    @RequestMapping("/findAllJobInf.action")
    @ResponseBody()
    public String findAllJobInf(){
        List<JobInf> jobInfList = jobInfService.findAllJobInf();
        String rst = JSONObject.toJSON(jobInfList).toString();
        return rst;
    }
}
