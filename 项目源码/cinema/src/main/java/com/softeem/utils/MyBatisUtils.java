package com.softeem.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

/**
 * mybatis工具类，用于获取session对象
 */
public class MyBatisUtils {

    /**指定mybatis核心配置文件*/
    private static String config = "mybatis-config.xml";
    /**声明SqlSessionFactory引用*/
    private static SqlSessionFactory factory;
    /**声明sqlsession引用*/
    private static SqlSession session;

    static{
        try {
            //读取配置文件成为一个字节输入流
            InputStream in = Resources.getResourceAsStream(config);
            //构建SqlSessionFactory
            factory = new SqlSessionFactoryBuilder().build(in);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 返回sqlsession
     * @return
     */
    public static SqlSession getSession(){
        return factory.openSession(true);
    }

}
