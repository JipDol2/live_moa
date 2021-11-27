package com.mycompany.myapp.persistence;

import java.util.List;

import com.mycompany.myapp.domain.ProductDTO;

public interface ProductDAO {
	// 상품 불러오기
	public List<ProductDTO> readProduct(int cast_id);
}
