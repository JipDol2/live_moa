package com.mycompany.myapp.Service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycompany.myapp.domain.InterestDTO;
import com.mycompany.myapp.domain.ProductDTO;
import com.mycompany.myapp.domain.ShoppingDTO;
import com.mycompany.myapp.persistence.ShoppingDAO;

@Service
public class ShoppingServiceImpl implements ShoppingService {
	@Inject
	private ShoppingDAO shoppingDAO;
	private static final String namespace = "com.mycompany.myapp.mapper.ShoppingMapper";

	// -------------------------------- 쇼핑방송 및 제품 등록
	@Override
	public void insertShopping(ShoppingDTO dto) {
		// System.out.println("dto : " + dto);
		shoppingDAO.insertShopping(dto);
	}
	@Override // 등록한 쇼핑방송 PK가져와서 제품등록시 활용
	public int getShoppingPK(String mem_id) {
		return shoppingDAO.getPK(mem_id);
	}	
	@Override
	public void insertProduct(ProductDTO productDTO) {
		shoppingDAO.insertProduct(productDTO);
	}

	// -------------------------------- 쇼핑방송 및 제품 수정
	@Override
	public void updateShopping(ShoppingDTO dto) {
		shoppingDAO.updateShopping(dto);
	}
	@Override
	public void updateProduct(ProductDTO productDTO) {
		shoppingDAO.updateProduct(productDTO);
	}

	// -------------------------------- 쇼핑방송 및 제품 삭제
	@Override
	public void deleteProduct(int product_id) {
		shoppingDAO.deleteProduct(product_id);
	}
	@Override
	public void deleteShopping(int cast_id) {
		shoppingDAO.deleteShopping(cast_id);
	}
	
	// -------------------------------- 쇼핑방송 리스팅
	@Override
	public List<ShoppingDTO> listShopping(HashMap<String, String> map) {
		return shoppingDAO.listShopping(map);
	}
	
	// -------------------------------- 쇼핑방송 카테고리별 갯수 / 총 갯수
	@Override
	public int countShopping(String category) {
		return shoppingDAO.countShopping(category);
	}
	@Override
	public int totalCountShopping() {
		return shoppingDAO.totalCountShopping();
	}
	
	// -------------------------------- 쇼핑방송 읽기
	@Override
	public ShoppingDTO readShopping(int cast_id) {
		shoppingDAO.updateHit(cast_id);
		return shoppingDAO.getShopping(cast_id);
	}
	
	// -------------------------------- 관심쇼핑 등록
	@Override
	public void insertInterest(InterestDTO interestDTO) {
		int flag= shoppingDAO.duplicationCheck(interestDTO);	//중복된 테이블 확인
		if(flag<=0)
			shoppingDAO.insertInterest(interestDTO);
	}
	
	// -------------------------------- 관심쇼핑 리스팅
	@Override
	public List<InterestDTO> listInterest(String mem_id) {
		return shoppingDAO.listInterest(mem_id);
	}
	
	// -------------------------------- 관심쇼핑 삭제
	@Override
	public void deleteInterest(HashMap<String, String> map) {
		shoppingDAO.deleteInterest(map);
	}
}
