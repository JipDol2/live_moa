package com.mycompany.myapp.Service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.mycompany.myapp.domain.ProductDTO;
import com.mycompany.myapp.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {
	@Inject
	private ProductDAO productDAO;
	
	@Override
	public List<ProductDTO> readProduct(int cast_id) {
		return productDAO.readProduct(cast_id);
	}// readProduct()

}
