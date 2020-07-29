package dao;

import java.sql.Date;

public class SCommDto {
  private int s_idx;
  private String id;
  private int r_idx;
  private String r_op;
  private String r_content;
  private Date r_regdate;

  public int getS_idx() {
    return s_idx;
  }

  public void setS_idx(int s_idx) {
    this.s_idx = s_idx;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public int getR_idx() {
    return r_idx;
  }

  public void setR_idx(int r_idx) {
    this.r_idx = r_idx;
  }

  public String getR_op() {
    return r_op;
  }

  public void setR_op(String r_op) {
    this.r_op = r_op;
  }

  public String getR_content() {
    return r_content;
  }

  public void setR_content(String r_content) {
    this.r_content = r_content;
  }

  public Date getR_regdate() {
    return r_regdate;
  }

  public void setR_regdate(Date r_regdate) {
    this.r_regdate = r_regdate;
  }

}
