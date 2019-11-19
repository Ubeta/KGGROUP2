package com.care.modelDTO;

import java.sql.Date;

public class ReplyDTO {

	private String m_id;
	private int r_num;
	private int r_idgroup;
	private String r_content;
	private Date r_date;
	private int r_like;
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public int getR_idgroup() {
		return r_idgroup;
	}
	public void setR_idgroup(int r_idgroup) {
		this.r_idgroup = r_idgroup;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public int getR_like() {
		return r_like;
	}
	public void setR_like(int r_like) {
		this.r_like = r_like;
	}
	
	
	
}
