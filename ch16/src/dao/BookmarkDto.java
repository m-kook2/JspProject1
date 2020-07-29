package dao;

import java.util.Date;

public class BookmarkDto {
private String id;
private int m_idx;
private Number idx;
private String mind;
private Date reg_date;


public Date getReg_date() {
	return reg_date;
}
public void setReg_date(Date reg_date) {
	this.reg_date = reg_date;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public int getM_idx() {
	return m_idx;
}
public void setM_idx(int m_idx) {
	this.m_idx = m_idx;
}
public Number getIdx() {
	return idx;
}
public void setIdx(Number idx) {
	this.idx = idx;
}
public String getMind() {
	return mind;
}
public void setMind(String mind) {
	this.mind = mind;
}


}
