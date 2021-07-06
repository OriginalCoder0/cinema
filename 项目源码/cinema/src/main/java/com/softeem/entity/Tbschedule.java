package com.softeem.entity;

public class Tbschedule {

  private long id;
  private long mid;
  private long hid;
  private java.sql.Timestamp playtime;
  private double price;
  private String seatstatus;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getMid() {
    return mid;
  }

  public void setMid(long mid) {
    this.mid = mid;
  }


  public long getHid() {
    return hid;
  }

  public void setHid(long hid) {
    this.hid = hid;
  }


  public java.sql.Timestamp getPlaytime() {
    return playtime;
  }

  public void setPlaytime(java.sql.Timestamp playtime) {
    this.playtime = playtime;
  }


  public double getPrice() {
    return price;
  }

  public void setPrice(double price) {
    this.price = price;
  }


  public String getSeatstatus() {
    return seatstatus;
  }

  public void setSeatstatus(String seatstatus) {
    this.seatstatus = seatstatus;
  }

}
