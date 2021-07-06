package com.softeem.dao;

import com.softeem.entity.Tbadmin;

import java.util.List;

/**
 * DAO:data access object（数据访问对象：用于操作数据库的核心Java类）
 * 管理员的数据访问接口
 */
public interface TbadminMapper {

    /**
     * 管理员添加
     * @param admin
     * @return
     */
    public boolean insert(Tbadmin admin);

    /**
     * 根据id删除管理员
     * @param id
     * @return
     */
    public boolean deleteById(int id);

    /**
     * 修改管理员信息
     * @param admin
     * @return
     */
    public boolean updateById(Tbadmin admin);

    /**
     * 根据用户名查询管理员（登录）
     * @param username
     * @return
     */
    public Tbadmin selectByUsername(String username);

    /**
     * 查询所有管理员
     * @return
     */
    public List<Tbadmin> selectAll();
}
