package com.softeem.controller;

import com.softeem.entity.Tbmovies;
import com.softeem.service.TbmoviesService;
import com.softeem.utils.QiniuOssUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@MultipartConfig
@WebServlet("/movies/add")
public class MoviesAddServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置请求编码
        req.setCharacterEncoding("utf-8");

        //读取文件对象
        Part part = req.getPart("img");
        //获取提交的文件名
        String fname = part.getSubmittedFileName();
        //获取客户端上传的文件输出流
        InputStream is = part.getInputStream();
        //上传文件到七牛OSS
        String path = QiniuOssUtils.upload(is, fname);

        //获取表单中其他字段信息
        String name = req.getParameter("name");
        String category = req.getParameter("category");
        String director = req.getParameter("director");
        String actor = req.getParameter("actor");
        String country = req.getParameter("country");
        String summary = req.getParameter("summary");

        String publishtime = req.getParameter("publishtime");
        String status = req.getParameter("status");
        //将上映状态的数据类型转换为int
        long stat = Long.parseLong(status);
        //上映时间
        Timestamp time = null;
        //将字符串类型的上映时间解析为Timestamp类型
        try {
            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
            Date date = fmt.parse(publishtime);
            time = new Timestamp(date.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }

        //将获取的所有影片信息包装到一个Tbmovies对象中
        Tbmovies m = new Tbmovies();
        m.setName(name);
        m.setImg(path);
        m.setActor(actor);
        m.setDirector(director);
        m.setCountry(country);
        m.setCategory(category);
        m.setSummary(summary);
        m.setPublishtime(time);
        m.setStatus(stat);

        TbmoviesService service = new TbmoviesService();
        boolean b = service.addMovies(m);
        if(b){
            //添加成功
            resp.sendRedirect("/movies/list");
        }else{
            //添加失败
            req.setAttribute("msg","添加失败!");
            req.getRequestDispatcher("../addMovies.jsp").forward(req,resp);
        }
    }
}
