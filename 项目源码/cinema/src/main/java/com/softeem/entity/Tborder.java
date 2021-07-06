package com.softeem.entity;

public class Tborder {

  private long id;
  private String orderno;
  private long uid;
  private long sid;
  private String seatnums;
  private java.sql.Timestamp ordertime;
  private double orderprice;
  private long status;
  private long logicdel;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getOrderno() {
    return orderno;
  }

  public void setOrderno(String orderno) {
    this.orderno = orderno;
  }


  public long getUid() {
    return uid;
  }

  public void setUid(long uid) {
    this.uid = uid;
  }


  public long getSid() {
    return sid;
  }

  public void setSid(long sid) {
    this.sid = sid;
  }


  public String getSeatnums() {
    return seatnums;
  }

  public void setSeatnums(String seatnums) {
    this.seatnums = seatnums;
  }


  public java.sql.Timestamp getOrdertime() {
    return ordertime;
  }

  public void setOrdertime(java.sql.Timestamp ordertime) {
    this.ordertime = ordertime;
  }


  public double getOrderprice() {
    return orderprice;
  }

  public void setOrderprice(double orderprice) {
    this.orderprice = orderprice;
  }


  public long getStatus() {
    return status;
  }

  public void setStatus(long status) {
    this.status = status;
  }


  public long getLogicdel() {
    return logicdel;
  }

  public void setLogicdel(long logicdel) {
    this.logicdel = logicdel;
  }

}
