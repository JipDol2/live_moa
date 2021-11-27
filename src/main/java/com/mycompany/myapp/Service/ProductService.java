package com.mycompany.myapp.Service;

import java.util.List;

import com.mycompany.myapp.domain.ProductDTO;

public interface ProductService {
	// 제품 정보 읽어보기
	List<ProductDTO> readProduct(int cast_id);

}
