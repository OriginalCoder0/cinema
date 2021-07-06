package com.softeem.utils;

import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.Region;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.UUID;

/**
 * 七牛云对象存储工具
 */
public class QiniuOssUtils {

    /**
     * 声明用于鉴权的accessKey/secretkey
     */
    private static final String ACCESS_KEY = "6ufeDvo4w59tnkoQh5bwDJKAj9txnW1RWmrku99L";
    private static final String SECRET_KEY = "94HgtmySulPOcXzsCL6mMNGVPkZEdWks4mHyQmqK";
    /**
     * 声明存储空间名称
     */
    private static final String BUCKET = "cinema";
    /**
     * 声明资源访问域名地址
     */
    private static final String BASE_URL = "http://qv75n58e2.hd-bkt.clouddn.com/";
    /**
     * 声明用于上传的工具对象
     */
    private static UploadManager uploadManager;
    /**
     * 声明用于操作bucket（存储空间）对象（删除，修改，检索等）
     */
    private static BucketManager bucketManager;

    static {
        //创建七牛云配置对象
        Configuration cfg = new Configuration(Region.huadong());
        //根据配置获取上传管理器
        uploadManager = new UploadManager(cfg);
        //配置bucket管理器
        bucketManager = new BucketManager(Auth.create(ACCESS_KEY, SECRET_KEY),cfg);
    }

    /**
     * 返回授权码
     *
     * @return
     */
    public static String getToken() {
        Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
        String token = auth.uploadToken(BUCKET);
        return token;
    }

    /**
     * 上传本地文件到七牛云OSS
     *
     * @param path
     * @param fname
     */
    public static String upload(String path, String fname) {
        try {
            return upload(new FileInputStream(path), fname);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 将输入流传输到oss
     *
     * @param in
     * @param fname
     */
    public static String upload(InputStream in, String fname) {
        try {
            //获取文件名最后一个"."出现的位置
            int index = fname.lastIndexOf(".");
            //从指定位置之后一位开始截取到末尾（取得文件名后缀）
            String suffix = fname.substring(index + 1);
            //使用UUID作为文件新名称
            fname = UUID.randomUUID().toString() + "." + suffix;
            //上传流到云端
            Response resp = uploadManager.put(in, fname, getToken(), null, null);
            //解析云端返回结果
            DefaultPutRet putRet = new Gson().fromJson(resp.bodyString(), DefaultPutRet.class);
            //返回文件存储在服务器地址
            return BASE_URL + putRet.key;
        } catch (QiniuException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 删除文件
     * @param key
     */
    public static void deleteFile(String key){
        try {
            bucketManager.delete(BUCKET,key);
        } catch (QiniuException e) {
            e.printStackTrace();
        }
    }

}
