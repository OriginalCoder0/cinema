package com.softeem.controller;

import com.softeem.dao.TbadminMapper;
import com.softeem.entity.Tbadmin;
import com.softeem.utils.MyBatisUtils;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Http协议的原理？
 * http请求(request)和http响应(response)
 * 请求的方式有：get,post,put,delete,trace...  restful
 * <p>
 * Servlet:服务端Java程序（server+applet）,是由Java官方提供的一种能够
 * 处理客户端请求（http请求），并且将处理结果响应给客户端的服务端小程序
 * <p>
 * Servlet的创建步骤(3.0为例)：
 * 1、创建Java类继承HttpServlet
 * 2、重写doGet/doPost（或者重写service）方法
 * 3、配置servlet的url-pattern(设置客户端请求地址)
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取表单提交的账号和密码
        String name = request.getParameter("username");
        String pwd = request.getParameter("password");

        //检查输入的用户名密码是否匹配数据库的账号密码
        //获取session
        SqlSession session = MyBatisUtils.getSession();
        //获取mapper
        TbadminMapper mapper = session.getMapper(TbadminMapper.class);
        //执行查询
        Tbadmin admin = mapper.selectByUsername(name);
        //业务逻辑判断
        if(admin != null){
            //判断账号是否可用
            if(admin.getStatus() == 1){
                //判断密码
                if(admin.getPassword().equals(pwd)){
                    //登录成功，进入主界面（重定向：客户端跳转，不附加任何数据传递）
                    response.sendRedirect("main.jsp");
                    return;
                }else{
                    //密码错误
                    request.setAttribute("msg","密码错误");
                }
            }else{
                //账号不可用
                request.setAttribute("msg","账号不可用");
            }
        }else{
            //用户不存在
            request.setAttribute("msg","用户不存在");
        }
        //失败时返回登录界面（请求转发：服务端跳转，可以传递数据到目标）
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }
}
