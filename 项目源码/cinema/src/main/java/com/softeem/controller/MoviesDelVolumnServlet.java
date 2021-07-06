package com.softeem.controller;

import com.softeem.service.TbmoviesService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 批量删除功能
 */
@WebServlet("/movies/dels")
public class MoviesDelVolumnServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取需要批量删除的所有id
        String[] ids = req.getParameterValues("id");

        TbmoviesService service = new TbmoviesService();
        //批量删除
        boolean b = service.deleteMovies(ids);
        if(b){
            //成功
            req.setAttribute("msg","删除成功");
        }else{
            //失败
            req.setAttribute("msg","删除失败");
        }
        req.getRequestDispatcher("/movies/list").forward(req,resp);
    }
}
