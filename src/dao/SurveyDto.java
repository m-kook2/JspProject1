package dao;

public class SurveyDto {
  private int s_idx;
  private String s_sub;
  private String s_sdate;
  private String s_edate;
  private String s_content;


  private String s_op1;
  private String s_op2;
  private String s_op3;
  private String s_op4;
  private String s_op5;
  private String id;
  private int commCnt;
  private boolean votable;
  private int op1Cnt;
  private int op2Cnt;
  private int op3Cnt;
  private int op4Cnt;
  private int op5Cnt;
  
  public int getOp1Cnt() {
    return op1Cnt;
  }

  public void setOp1Cnt(int op1Cnt) {
    this.op1Cnt = op1Cnt;
  }

  public int getOp2Cnt() {
    return op2Cnt;
  }

  public void setOp2Cnt(int op2Cnt) {
    this.op2Cnt = op2Cnt;
  }

  public int getOp3Cnt() {
    return op3Cnt;
  }

  public void setOp3Cnt(int op3Cnt) {
    this.op3Cnt = op3Cnt;
  }

  public int getOp4Cnt() {
    return op4Cnt;
  }

  public void setOp4Cnt(int op4Cnt) {
    this.op4Cnt = op4Cnt;
  }

  public int getOp5Cnt() {
    return op5Cnt;
  }

  public void setOp5Cnt(int op5Cnt) {
    this.op5Cnt = op5Cnt;
  }

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

  public int getS_idx() {
    return s_idx;
  }

  public void setS_idx(int s_idx) {
    this.s_idx = s_idx;
  }

  public String getS_sub() {
    return s_sub;
  }

  public void setS_sub(String sub) {
    this.s_sub = sub;
  }

  public String getS_sdate() {
    return s_sdate;
  }

  public void setS_sdate(String string) {
    this.s_sdate = string;
  }

  public String getS_edate() {
    return s_edate;
  }

  public void setS_edate(String string) {
    this.s_edate = string;
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
