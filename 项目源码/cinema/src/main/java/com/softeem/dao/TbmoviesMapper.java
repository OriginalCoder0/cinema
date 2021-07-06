package com.softeem.dao;

import com.softeem.entity.Tbmovies;

import java.util.List;

public interface TbmoviesMapper {

    /**
     * 查询所有影片
     * @return
     */
    List<Tbmovies> selectAll();

    /**
     * 影片添加
     * @param tbmovies
     * @return
     */
    boolean insert(Tbmovies tbmovies);

    /**
     * 根据影片id查询影片对象
     * @param id
     * @return
     */
    Tbmovies selectById(int id);

    /**
     * 根据id删除影片对象
     * @param id
     * @return
     */
    boolean deleteById(int id);

    /**
     * delete from tbmovies where id in (1,2,3,4)
     * String ids = "1,2,3,4"
     * String sql = "delete from tbmovies where id in(" + ids + ")";
     * 根据提供的id列表删除影片
     * @param ids
     * @return
     */
    boolean deleteByIds(String ids);

    /**
     * 根据修改影片信息
     * @param tbmovies
     * @return
     */
    boolean updateById(Tbmovies tbmovies);

}
