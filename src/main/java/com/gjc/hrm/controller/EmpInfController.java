package com.gjc.hrm.controller;

import com.alibaba.fastjson.JSONObject;
import com.gjc.hrm.domain.EmpDeptJob;
import com.gjc.hrm.domain.EmployeeInf;
import com.gjc.hrm.domain.PageBean;
import com.gjc.hrm.service.EmpInfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmpInfController {

    @Autowired
    private EmpInfService empInfService;

    @RequestMapping("/findEmpInfPaging.action")
    @ResponseBody
    public String findEmpInfPaging(int page,int rows,String startTime,String endTime,String searchDept,String searchJob,String searchName) throws ParseException {
        System.out.println(page+":"+rows+":"+startTime+":"+endTime+":"+searchDept+":"+searchJob+":"+searchName);
        int count = empInfService.findEmpInfCount(startTime,endTime,searchDept,searchJob,searchName);
        PageBean pageBean = new PageBean(page,rows,count);
        pageBean.setTotalRecord(count);
        List<EmpDeptJob> empDeptJobs = empInfService.findEmpInfPaging(pageBean.getStartIndex(),pageBean.getPageSize(),startTime,endTime,searchDept,searchJob,searchName);
        Map<String,Object> map = new HashMap<>();
        map.put("rows",empDeptJobs);
        map.put("total",count);
        String rst = JSONObject.toJSON(map).toString();
        return rst;
    }

    @RequestMapping(value = "/findEmpInf.action",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String findEmpInf(String startTime,String endTime,String searchDept,String searchJob,String searchName) throws ParseException {
        List<EmpDeptJob> empDeptJobs = empInfService.findEmpInfPaging(0,0,startTime,endTime,searchDept,searchJob,searchName);
        String rst = JSONObject.toJSON(empDeptJobs).toString();
        return rst;
    }

    @RequestMapping("/addEmpInf.action")
    @ResponseBody
    public String addEmpInf(EmployeeInf employeeInf){
        if (employeeInf.getDeptId() == null || employeeInf.getJobId() == null
                ||employeeInf.getName() == null || employeeInf.getName() == ""
                ||employeeInf.getCardId() == null || employeeInf.getCardId() == ""
                ||employeeInf.getSex() == null)
            return "lack";
        int rst = empInfService.addEmpInf(employeeInf);
        if (rst ==1)
            return "ok";
        else
            return "fail";
    }

    @RequestMapping(value = "/findEmpInfById.action",produces="text/html;charset=UTF-8")
    @ResponseBody
    public String findEmpInfById(int id){
        EmpDeptJob empDeptJob = empInfService.findEmpInfById(id);
        String rst = JSONObject.toJSON(empDeptJob).toString();
        return rst;
    }

    @RequestMapping("/editEmpInf.action")
    @ResponseBody
    public String editEmpInf(EmployeeInf employeeInf){
        int rst = empInfService.editEmpInf(employeeInf);
        if (rst ==1)
            return "ok";
        else
            return "fail";
    }

    @RequestMapping("/deleteEmpInfById.action")
    @ResponseBody
    public String deleteEmpInfById(int[] ids){
        if (ids.length == 0){
            return "fail";
        }
        int rst = empInfService.deleteUserInfById(ids);
        if (rst ==1)
            return "ok";
        else
            return "fail";
    }

    @RequestMapping(value = "/findEmpInfByUserName.action",produces="text/html;charset=UTF-8")
    @ResponseBody()
    public String findEmpInfByUserName(String loginName){
        //判断loginName
        EmpDeptJob empDeptJob = empInfService.findEmpInfByUserName(loginName);
        String rst=JSONObject.toJSON(empDeptJob).toString();
        if (rst == "" || rst == null)
            return "fail";
        else
            return rst;
    }
}
