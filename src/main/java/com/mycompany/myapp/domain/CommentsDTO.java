package com.mycompany.myapp.domain;

import java.util.Date;

public class CommentsDTO {
	private int comment_id;
	private String mem_id;
	private int cast_id;
	private String content;
	private Date write_date;
	
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getCast_id() {
		return cast_id;
	}
	public void setCast_id(int cast_id) {
		this.cast_id = cast_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	
	@Override
	public String toString() {
		return "CommentDTO [comment_id=" + comment_id + ", mem_id=" + mem_id + ", cast_id=" + cast_id + ", content="
				+ content + ", write_date=" + write_date + "]";
	}
}
