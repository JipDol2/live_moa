package com.mycompany.myapp.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mycompany.myapp.domain.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.mycompay.myapp.mapper.ProductMapper";
	
	@Override
	public List<ProductDTO> readProduct(int cast_id) {
		return sqlSession.selectList(namespace + ".readProduct", cast_id);
	}
}
