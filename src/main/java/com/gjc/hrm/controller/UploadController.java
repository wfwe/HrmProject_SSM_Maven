package com.gjc.hrm.controller;

import com.alibaba.fastjson.JSONObject;
import com.gjc.hrm.domain.LoadInf;
import com.gjc.hrm.domain.LoadUser;
import com.gjc.hrm.domain.PageBean;
import com.gjc.hrm.domain.UserInf;
import com.gjc.hrm.service.LoadService;
import com.gjc.hrm.service.UserInfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/file")
public class UploadController {

    @Autowired
    private LoadService loadService;

    @Autowired
    private UserInfService userInfService;

    @RequestMapping("/findLoadPaging.action")
    @ResponseBody
    public String findLoadPaging(HttpServletRequest request,int page,int rows,String startTime,String endTime,String searchLoadTitle) throws ParseException {

        int userId = (int) request.getSession().getAttribute("userId");
        UserInf userInf = userInfService.findUserInfById(userId);

        int count = loadService.findLoadCount(startTime,endTime,searchLoadTitle,userInf.getStatus());

        PageBean pageBean = new PageBean(page,rows,count);

        pageBean.setTotalRecord(count);

        List<LoadUser> loadUserList = loadService.findLoadPaging(pageBean.getStartIndex(),pageBean.getPageSize(),startTime,endTime,searchLoadTitle,userInf.getStatus());


        Map<String,Object> map = new HashMap<>();

        map.put("rows",loadUserList);
        map.put("total",count);
        String rst = JSONObject.toJSON(map).toString();
        return rst;
    }

    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    @ResponseBody
    public String upload(LoadInf loadInf,MultipartFile file, HttpServletRequest request) throws IOException {
        if (loadInf.getLoadTitle() == null || loadInf.getLoadTitle() == ""){
            return "fail";
        }
        String path = request.getSession().getServletContext().getRealPath("upload");

        //设置文件路径名称，不能重复，可以使用uuid
        String uuName = UUID.randomUUID().toString();
        //获取文件名
        String fileName = file.getOriginalFilename();
        //获取文件的后缀
        String extName = fileName.substring(fileName.lastIndexOf("."));

        int userId = (int) request.getSession().getAttribute("userId");
        loadInf.setLoadUser(userId);
        loadInf.setLoadName(fileName);
        loadInf.setLoadPath(path+"/"+uuName+extName);

        File dir = new File(path,uuName+extName);
        if (!dir.exists()){
            dir.mkdirs();
        }
        file.transferTo(dir);

        int rst = loadService.addLoad(loadInf);
        if (rst == 1){
            return "ok";
        }else {
            return "fail";
        }

    }

    @RequestMapping("/down")
    @ResponseBody
    public void down(HttpServletRequest request, HttpServletResponse response, int fileId) throws IOException {

        //file为文件的名称
        LoadInf loadInf =loadService.findLoadById(fileId);
        //fileName为文件的绝对路径
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(loadInf.getLoadPath())));

        String file = loadInf.getLoadName();

        //防止文件中文名乱码
        file = URLEncoder.encode(file,"UTF-8");
        //设置文件下载头
        response.addHeader("Content-Disposition","attachment;filename="+file);

        //设置文件ContentType的类型，如下设置后，会自动判断下载文件类型
        response.setContentType("multipart/form-data");

        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());

        int len = 0;

        while ((len = bis.read()) != -1){
            out.write(len);
            out.flush();
        }
        out.close();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(String ids){
        String[] arr = ids.split(",");
        Boolean b = false;
        for (String i:arr) {
            int rst = loadService.deleteLoadById(i);
            if (rst == 1)
                b = true;
        }
        if (b){
            return "ok";
        }else {
            return "fail";
        }
    }

    @RequestMapping("/edit")
    @ResponseBody
    public String edit(LoadInf loadInf){
        int rst = loadService.update(loadInf);
        if (rst == 1){
            return "ok";
        }else {
            return "fail";
        }
    }

    @RequestMapping(value = "/find/{id}" ,produces="text/html;charset=UTF-8")
    @ResponseBody
    public String find(@PathVariable int id){
        LoadInf loadInf = loadService.find(id);
        return JSONObject.toJSON(loadInf).toString();
    }


}
