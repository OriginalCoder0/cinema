package com.softeem.controller;

import com.github.pagehelper.PageInfo;
import com.softeem.entity.Tbmovies;
import com.softeem.service.TbmoviesService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// restful   rest-API
@WebServlet("/movies/list")
public class MoviesListServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取请求参数中的当前页码数和每页大小数
        String cp = req.getParameter("page");
        String limit = req.getParameter("limit");
        //初始化当前页(默认值:1)和每页数据条数（默认值:3）
        int pageNum = cp == null ? 1 : Integer.parseInt(cp);
        int pageSize = limit == null ? 3 : Integer.parseInt(limit);

        TbmoviesService service = new TbmoviesService();
        PageInfo<Tbmovies> pi = service.queryAll(pageNum, pageSize);

        //将需要传递的数据存储到request范围，转发到客户端
        req.setAttribute("pageInfo",pi);
        //将当前页存储到request返回，转发到客户端
        req.setAttribute("page",pageNum);
        //请求转发  /movies.jsp
        req.getRequestDispatcher("../movies.jsp").forward(req,resp);
    }
}
