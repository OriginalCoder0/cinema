package com.softeem.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.softeem.dao.TbmoviesMapper;
import com.softeem.entity.Tbadmin;
import com.softeem.entity.Tbmovies;
import com.softeem.utils.MyBatisUtils;
import com.softeem.utils.QiniuOssUtils;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

/**
 * 业务逻辑层(执行与影片相关的业务逻辑功能)
 */
public class TbmoviesService {

    private TbmoviesMapper tbmoviesMapper;

    /**
     * 分页查询
     * @param pageNum   当前的查询页
     * @param pageSize  每页数据条数
     */
    public PageInfo<Tbmovies> queryAll(int pageNum,int pageSize){
        SqlSession session = null;
        try {
            //获取session
            session = MyBatisUtils.getSession();
            //获取mapper
            tbmoviesMapper = session.getMapper(TbmoviesMapper.class);
            //开始分页
            PageHelper.startPage(pageNum,pageSize);
            //执行查询
            List<Tbmovies> list = tbmoviesMapper.selectAll();
            //将查询数据包裹到PageInfo中
            PageInfo<Tbmovies> pageInfo = new PageInfo<>(list);
            //返回分页信息
            return pageInfo;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //关闭session
            if(session != null)session.close();
        }
        return null;
    }

    /**
     * 影片添加
     * @param m
     * @return
     */
    public boolean addMovies(Tbmovies m){
        SqlSession session = null;
        try {
            //获取session
            session = MyBatisUtils.getSession();
            //获取映射器
            tbmoviesMapper = session.getMapper(TbmoviesMapper.class);
            //执行插入操作
            return tbmoviesMapper.insert(m);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(session != null)session.close();
        }
        return false;
    }

    /**
     * 根据影片id删除影片信息
     * @param id
     * @return
     */
    public boolean delMovies(int id){
        SqlSession session = null;
        try {
            session = MyBatisUtils.getSession();
            tbmoviesMapper = session.getMapper(TbmoviesMapper.class);
            //1.查询出指定id的纪录
            Tbmovies m = tbmoviesMapper.selectById(id);
            if(m == null){
                return false;
            }
            int index = m.getImg().lastIndexOf("/");
            //获取需要删除的图片名称
            String key = m.getImg().substring(index+1);
            //2.删除七牛oss的图片
            QiniuOssUtils.deleteFile(key);

            //3.删除数据库的数据
            return tbmoviesMapper.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(session != null)session.close();
        }
        return false;
    }

    /**
     * 批量删除功能
     * String[] ids = {1,2,3,4,5}
     * @param ids
     * @return
     */
    public boolean deleteMovies(String[] ids){
        //将字符串数组转换为字符串对象({1,2,3,4} => "1,2,3,4")
        String moviesIds = String.join(",",ids);
        SqlSession session = null;
        try {
            session = MyBatisUtils.getSession();
            tbmoviesMapper = session.getMapper(TbmoviesMapper.class);
            return tbmoviesMapper.deleteByIds(moviesIds);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(session != null)session.close();
        }
        return false;
    }

    /**
     * 修改影片的信息
     * @param m
     * @return
     */
    public boolean updateMovies(Tbmovies m){
        SqlSession session = null;
        try {
            //获取session
            session = MyBatisUtils.getSession();
            //获取Mapper
            tbmoviesMapper = session.getMapper(TbmoviesMapper.class);
            //判断是否需要修改图片(如果需要修改，则将原oss中的图片删除)
            if(m.getImg() != null){
                //1.查询出指定id的纪录
                Tbmovies m2 = tbmoviesMapper.selectById(m.getId().intValue());
                if(m2 == null){
                    return false;
                }
                int index = m2.getImg().lastIndexOf("/");
                //获取需要删除的图片名称
                String key = m2.getImg().substring(index+1);
                //2.删除七牛oss的图片
                QiniuOssUtils.deleteFile(key);
            }
            System.out.println("===>"+m.getId()+"===="+m.getActor());
            //更新并返回结果
            return tbmoviesMapper.updateById(m);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(session != null)session.close();
        }
        return false;
    }
}
