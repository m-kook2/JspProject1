package dao;

import java.util.Date;

public class BookmarkDto {
	private String id;
	private int m_idx;
	private Number idx;
	private Date reg_date;
	private String m_photo;
	private String m_name;
	private String m_genre;
	private Date m_date;

	public String getM_photo() {
		return m_photo;
	}

	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

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

	public String getM_genre() {
		return m_genre;
	}

	public void setM_genre(String m_genre) {
		this.m_genre = m_genre;
	}

	public Date getM_date() {
		return m_date;
	}

	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}

}
