package com.mycompany.myapp.domain;

//자료형이나 변수명을 바꿀 경우 소스코드에 주석으로 기록해두고
//별도로 어떤 부분을 바꿨는지 알려줄것

//DTO에 있는 변수와 form 태그 안에 들어있는 변수들의 이름이 동일해야 
//자동으로 매칭이 되어 사용할 수가 있다.
public class MemberDTO {
	private String mem_id;
	private String mem_pwd;
	private String mem_name;
	private String mem_email;
	private String mem_phone;
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	@Override
	public String toString() {
		return "MemberDTO [mem_id=" + mem_id + ", mem_pwd=" + mem_pwd + ", mem_name=" + mem_name + ", mem_email="
				+ mem_email + ", mem_phone=" + mem_phone + "]";
	}
	
}
