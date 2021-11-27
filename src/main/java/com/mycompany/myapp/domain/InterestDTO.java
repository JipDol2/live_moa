package com.mycompany.myapp.domain;

public class InterestDTO {
	private String mem_id; // cast테이블의 작성자(mem_id)와 다름
	private int cast_id;
	private String category;
	private String cast_date;
	private String cast_time;
	private String cast_name;
	private String cast_platform;
	private String seller;
	private String shopping_link;
	private String product_name;
	private int price;
	
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
	public String getShopping_link() {
		return shopping_link;
	}
	public void setShopping_link(String shopping_link) {
		this.shopping_link = shopping_link;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "InterestDTO [mem_id=" + mem_id + ", cast_id=" + cast_id + ", category=" + category + ", cast_date="
				+ cast_date + ", cast_time=" + cast_time + ", cast_name=" + cast_name + ", cast_platform="
				+ cast_platform + ", seller=" + seller + ", shopping_link=" + shopping_link + ", product_name="
				+ product_name + ", price=" + price + "]";
	}

}
