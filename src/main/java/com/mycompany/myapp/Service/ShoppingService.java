package com.mycompany.myapp.Service;

import com.mycompany.myapp.domain.InterestDTO;
import com.mycompany.myapp.domain.ProductDTO;
import java.util.HashMap;
import java.util.List;

import com.mycompany.myapp.domain.ShoppingDTO;

public interface ShoppingService {
	// -------------------------------- 쇼핑방송 및 제품정보 등록
	public void insertShopping(ShoppingDTO dto);
	public int getShoppingPK(String mem_id); // 생성한 쇼핑정보 PK가져오기 
	public void insertProduct(ProductDTO productDTO);
	
	//----------------------------------쇼핑방송 및 제품정보 수정
	public void updateShopping(ShoppingDTO dto);
	public void updateProduct(ProductDTO productDTO);

	//----------------------------------쇼핑방송 및 제품정보 삭제
	public void deleteProduct(int product_id);
	public void deleteShopping(int cast_id);
	
	// -------------------------------- 쇼핑방송 리스팅
	public List<ShoppingDTO> listShopping(HashMap<String, String> map);
	
	// -------------------------------- 쇼핑방송 카테고리별 갯수 / 총 갯수
	public int countShopping(String category);
	public int totalCountShopping();
	
	// -------------------------------- 쇼핑방송 읽기
	public ShoppingDTO readShopping(int cast_id);
	
	// -------------------------------- 관심쇼핑 등록
	public void insertInterest(InterestDTO interestDTO);

	// -------------------------------- 관심쇼핑 리스트
	public List<InterestDTO> listInterest(String mem_id);
	
	// -------------------------------- 관심쇼핑 삭제
	public void deleteInterest(HashMap<String, String> map);


}// End
