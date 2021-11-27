package com.mycompany.myapp.domain;

// 자료형이나 변수명을 바꿀 경우 소스코드에 주석으로 기록해두고
// 별도로 어떤 부분을 바꿨는지 알려줄것
public class ShoppingDTO {
	private int cast_id;
	private String category;
	private String cast_date;
	private String cast_time;
	private String cast_name;
	private String cast_platform;
	private String seller;
	private String mem_id;
	private String shopping_link;
	private int hit;
	
	public int getCast_id() {
		return cast_id;
	}
	public void setCast_id(int cast_id) {
		this.cast_id = cast_id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCast_date() {
		return cast_date;
	}
	public void setCast_date(String cast_date) {
		this.cast_date = cast_date;
	}
	public String getCast_time() {
		return cast_time;
	}
	public void setCast_time(String cast_time) {
		this.cast_time = cast_time;
	}
	public String getCast_name() {
		return cast_name;
	}
	public void setCast_name(String cast_name) {
		this.cast_name = cast_name;
	}
	public String getCast_platform() {
		return cast_platform;
	}
	public void setCast_platform(String cast_platform) {
		this.cast_platform = cast_platform;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getShopping_link() {
		return shopping_link;
	}
	public void setShopping_link(String shopping_link) {
		this.shopping_link = shopping_link;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	@Override
	public String toString() {
		return "ShoppingDTO [cast_id=" + cast_id + ", category=" + category + ", cast_date=" + cast_date
				+ ", cast_time=" + cast_time + ", cast_name=" + cast_name + ", cast_platform=" + cast_platform
				+ ", seller=" + seller + ", mem_id=" + mem_id + ", shopping_link=" + shopping_link + ", hit=" + hit
				+ "]";
	}
	
}

