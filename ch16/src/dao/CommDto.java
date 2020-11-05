package dao;

import java.util.Date;

public class CommDto {
	private int c_idx;
	private String id;
	private String c_content;
	private int c_sympathy;
	private int c_unsympathy;
	private int c_grade;
	private String date;
	private String del_yn;
	private int m_idx;
	private int step;
	private int dep;
	private Date c_date;
	private int m_grade;
	private String overlap;
	
	
	
	public String getOverlap() {
		return overlap;
	}
	public void setOverlap(String overlap) {
		this.overlap = overlap;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public int getM_grade() {
		return m_grade;
	}
	public void setM_grade(int m_grade) {
		this.m_grade = m_grade;
	}
	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public int getC_sympathy() {
		return c_sympathy;
	}
	public void setC_sympathy(int c_sympathy) {
		this.c_sympathy = c_sympathy;
	}
	public int getC_unsympathy() {
		return c_unsympathy;
	}
	public void setC_unsympathy(int c_unsympathy) {
		this.c_unsympathy = c_unsympathy;
	}
	public int getC_grade() {
		return c_grade;
	}
	public void setC_grade(int c_grade) {
		this.c_grade = c_grade;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDep() {
		return dep;
	}
	public void setDep(int dep) {
		this.dep = dep;
	}
	
	
	
	
	

}
