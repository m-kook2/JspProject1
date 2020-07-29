package dao;

import java.sql.Date;

public class SurveyDto {
  private String s_idx;
  private String s_sub;
  private Date s_sdate;
  private Date s_edate;
  private String s_content;


  private String s_op1;
  private String s_op2;
  private String s_op3;
  private String s_op4;
  private String s_op5;
  private String id;
  private int commCnt;
  private boolean votable;
  
  public boolean isVotable() {
    return votable;
  }

  public void setVotable(boolean votable) {
    this.votable = votable;
  }

  public int getCommCnt() {
    return commCnt;
  }

  public void setCommCnt(int commCnt) {
    this.commCnt = commCnt;
  }

  public String getS_content() {
    return s_content;
  }

  public void setS_content(String s_content) {
    this.s_content = s_content;
  }

  public String getS_idx() {
    return s_idx;
  }

  public void setS_idx(String s_idx) {
    this.s_idx = s_idx;
  }

  public String getS_sub() {
    return s_sub;
  }

  public void setS_sub(String sub) {
    this.s_sub = sub;
  }

  public Date getS_sdate() {
    return s_sdate;
  }

  public void setS_sdate(Date s_sdate) {
    this.s_sdate = s_sdate;
  }

  public Date getS_edate() {
    return s_edate;
  }

  public void setS_edate(Date s_edate) {
    this.s_edate = s_edate;
  }

  public String getS_op1() {
    return s_op1;
  }

  public void setS_op1(String s_op1) {
    this.s_op1 = s_op1;
  }

  public String getS_op2() {
    return s_op2;
  }

  public void setS_op2(String s_op2) {
    this.s_op2 = s_op2;
  }

  public String getS_op3() {
    return s_op3;
  }

  public void setS_op3(String s_op3) {
    this.s_op3 = s_op3;
  }

  public String getS_op4() {
    return s_op4;
  }

  public void setS_op4(String s_op4) {
    this.s_op4 = s_op4;
  }

  public String getS_op5() {
    return s_op5;
  }

  public void setS_op5(String s_op5) {
    this.s_op5 = s_op5;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }


}
