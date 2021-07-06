package com.softeem.controller;

import com.softeem.service.TbmoviesService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/movies/del")
public class MoviesDelServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mid = req.getParameter("mid");
        TbmoviesService service = new TbmoviesService();
        boolean b = service.delMovies(Integer.parseInt(mid));
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
