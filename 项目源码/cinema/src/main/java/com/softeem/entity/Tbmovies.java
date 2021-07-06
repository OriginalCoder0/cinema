package com.softeem.entity;


import com.google.gson.Gson;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class Tbmovies {

  private Long id;
  private String name;
  private String img;
  private String category;
  private String country;
  private String director;
  private String actor;
  private java.sql.Timestamp publishtime;
  private Double rank;
  private Long status;
  private String summary;

  public String getSummary() {
    return summary;
  }

  public void setSummary(String summary) {
    this.summary = summary;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getImg() {
    return img;
  }

  public void setImg(String img) {
    this.img = img;
  }


  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }


  public String getCountry() {
    return country;
  }

  public void setCountry(String country) {
    this.country = country;
  }


  public String getDirector() {
    return director;
  }

  public void setDirector(String director) {
    this.director = director;
  }


  public String getActor() {
    return actor;
  }

  public void setActor(String actor) {
    this.actor = actor;
  }


  public java.sql.Timestamp getPublishtime() {
    return publishtime;
  }

  public void setPublishtime(java.sql.Timestamp publishtime) {
    this.publishtime = publishtime;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public Double getRank() {
    return rank;
  }

  public void setRank(Double rank) {
    this.rank = rank;
  }

  public Long getStatus() {
    return status;
  }

  public void setStatus(Long status) {
    this.status = status;
  }

  @Override
  public String toString() {
    //重写toString返回当前对象的json字符串表示形式
    String data = null;
    try {
      //使用urlencoder对数据（json格式数据）进行编码
      data = URLEncoder.encode(new Gson().toJson(this),"utf-8");
    } catch (UnsupportedEncodingException e) {
      e.printStackTrace();
    }
    return data;
  }
}
