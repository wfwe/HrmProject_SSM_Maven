package com.gjc.hrm.controller;

import com.alibaba.fastjson.JSONObject;
import com.gjc.hrm.domain.NoticeInf;
import com.gjc.hrm.domain.NoticeUser;
import com.gjc.hrm.domain.PageBean;
import com.gjc.hrm.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    NoticeService noticeService;

    @RequestMapping("/add.action")
    @ResponseBody
    public String add(HttpServletRequest request,NoticeInf noticeInf){
        int userId = (int) request.getSession().getAttribute("userId");
        noticeInf.setUserId(userId);
        int rst = noticeService.addNotice(noticeInf);
        if (rst == 1){
            return "ok";
        }else {
            return "fail";
        }
    }

    @RequestMapping("/query/{id}")
    public String queryContent(@PathVariable Integer id, Model model){
        model.addAttribute("id",id);
        return "/views/noticeShow";
    }

    @RequestMapping(value = "/findById/{id}",produces = {"text/html;charset=utf-8"})
    @ResponseBody
    public String findNoticeById(@PathVariable Integer id){
        if (id == null){
            return "fail";
        }
        return noticeService.findNoticeById(id);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(int[] ids){
        if (ids.length == 0){
            return "fail";
        }
        int rst = noticeService.deleteNotice(ids);
        if (rst == 1){
            return "ok";
        }else {
            return "fail";
        }
    }

    @RequestMapping("/findPaging")
    @ResponseBody
    public String findNoticePaging(int page,int rows,String startTime,String endTime,String noticeTitle) throws ParseException {
        int count = noticeService.findNoticeCount(startTime,endTime,noticeTitle);
        PageBean pageBean = new PageBean(page,rows,count);
        pageBean.setTotalRecord(count);
        List<NoticeUser> noticeUserList = noticeService.findNoticePaging(pageBean.getStartIndex(),pageBean.getPageSize(),startTime,endTime,noticeTitle);
        Map<String,Object> map = new HashMap<>();
        map.put("rows",noticeUserList);
        map.put("total",count);
        String rst = JSONObject.toJSON(map).toString();
        return rst;
    }
}
