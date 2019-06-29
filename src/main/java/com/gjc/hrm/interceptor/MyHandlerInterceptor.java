package com.gjc.hrm.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyHandlerInterceptor implements HandlerInterceptor {
    // controller执行后且视图返回后调用此方法
    // 这里可得到执行controller时的异常信息
    // 这里可记录操作日志
    @Override
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {
        //System.out.println("HandlerInterceptor1....afterCompletion");
    }

    // controller执行后但未返回视图前调用此方法
    // 这里可在返回用户前对模型数据进行加工处理，比如这里加入公用信息以便页面显示
    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
            throws Exception {
        //System.out.println("HandlerInterceptor1....postHandle");
    }

    // Controller执行前调用此方法
    // 返回true表示继续执行，返回false中止执行
    // 这里可以加入登录校验、权限拦截等
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
        Object userName =  request.getSession().getAttribute("userName");
        if (userName != null){
            return true;
      }
        else{
        response.sendRedirect("/login.jsp");
        }
        // 设置为true，测试使用
        return false;
    }

}
