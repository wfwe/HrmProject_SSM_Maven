package com.gjc.hrm.controller;

import com.alibaba.fastjson.JSONObject;
import com.gjc.hrm.domain.DeptInf;
import com.gjc.hrm.domain.PageBean;
import com.gjc.hrm.service.DeptInfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class DeptController {

    @Autowired
    private DeptInfService deptInfService;

    @RequestMapping(value = "/findDeptInfById.action",produces="text/html;charset=UTF-8")
    @ResponseBody()
    public String findDeptInfById(int id){
        DeptInf deptInf = deptInfService.findDeptInfById(id);
        String rst = JSONObject.toJSON(deptInf).toString();
        return rst;
    }

    @RequestMapping("/deleteDeptInfById.action")
    @ResponseBody
    public String deleteDeptInfById(int[] ids){
        int rst = deptInfService.deleteDeptInfById(ids);
        if (rst ==1)
            return "ok";
        else
            return "fail";
    }

    @RequestMapping("/editDeptInf.action")
    @ResponseBody
    public String editDeptInf(DeptInf deptInf){
        if (deptInf.getName() == null || deptInf.getName() == ""
                || deptInf.getRemark() == null || deptInf.getRemark() == "")
            return "lack";
        int rst = deptInfService.editDeptInf(deptInf);
        if (rst ==1)
            return "ok";
        else
            return "fail";
    }

    @RequestMapping("/addDeptInf.action")
    @ResponseBody
    public String addDeptInf(DeptInf deptInf){
        if (deptInf.getName() == null || deptInf.getName() == ""
                || deptInf.getRemark() == null || deptInf.getRemark() == "")
            return "lack";
        int rst = deptInfService.addDeptInf(deptInf);
        if (rst ==1)
            return "ok";
        else
            return "fail";
    }

    @RequestMapping("/findAllDeptInfPaging.action")
    @ResponseBody
    public Map<String,Object> findAllDeptInfPaging(int page,int rows){
        int count = deptInfService.findAllDeptCount();
        PageBean pageBean = new PageBean(page,rows,count);
        List<DeptInf> deptInfList = deptInfService.findAllDeptInfPaging(pageBean.getStartIndex(),pageBean.getPageSize());
        Map<String,Object> map = new HashMap<>();
        map.put("rows",deptInfList);
        map.put("total",count);
        return map;
    }

    @RequestMapping("/findAllDeptInf.action")
    @ResponseBody
    public String findAllDeptInf(){
        List<DeptInf> deptInfList = deptInfService.findAllDeptInf();
        String rst = JSONObject.toJSON(deptInfList).toString();
        return rst;
    }
}
