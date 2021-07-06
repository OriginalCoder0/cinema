package com.softeem.entity;

public class Tbhall {

  private long id;
  private String name;
  private String halltype;
  private long seatcount;
  private String seatinfo;
  private long status;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getHalltype() {
    return halltype;
  }

  public void setHalltype(String halltype) {
    this.halltype = halltype;
  }


  public long getSeatcount() {
    return seatcount;
  }

  public void setSeatcount(long seatcount) {
    this.seatcount = seatcount;
  }


  public String getSeatinfo() {
    return seatinfo;
  }

  public void setSeatinfo(String seatinfo) {
    this.seatinfo = seatinfo;
  }


  public long getStatus() {
    return status;
  }

  public void setStatus(long status) {
    this.status = status;
  }

}
