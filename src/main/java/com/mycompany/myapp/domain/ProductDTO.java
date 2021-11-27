package com.mycompany.myapp.domain;

//자료형이나 변수명을 바꿀 경우 소스코드에 주석으로 기록해두고
//별도로 어떤 부분을 바꿨는지 알려줄것

//product_id String형 -> int 형
public class ProductDTO {
	private int product_id;
	private int cast_id;
	private String product_name;
	private int price;
	private int discount; // discount 변수 생성
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getCast_id() {
		return cast_id;
	}
	public void setCast_id(int cast_id) {
		this.cast_id = cast_id;
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
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	
	@Override
	public String toString() {
		return "ProductDTO [product_id=" + product_id + ", cast_id=" + cast_id + ", product_name=" + product_name
				+ ", price=" + price + ", discount=" + discount + "]";
	}
	
	
}
