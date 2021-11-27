package com.mycompany.myapp.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.mycompany.myapp.domain.InterestDTO;
import com.mycompany.myapp.domain.ProductDTO;
import com.mycompany.myapp.domain.ShoppingDTO;
@Service
public class ShoppingDAOimpl implements ShoppingDAO{
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.mycompany.myapp.mapper.ShoppingMapper";

	// -------------------------------- 쇼핑방송 및 제품정보 등록
	@Override
	public void insertShopping(ShoppingDTO dto) {
		System.out.println("dto : " + dto);
		sqlSession.insert(namespace+".insertShopping", dto);
	}
	@Override
	public int getPK(String mem_id) {
		return sqlSession.selectOne(namespace+".getPK", mem_id);
	}
	@Override
	public void insertProduct(ProductDTO productDTO) {
		//System.out.println("productDTO : "+productDTO);
		sqlSession.insert(namespace+".insertProduct",productDTO);
	}
	
	//--------------------------------쇼핑방송 및 제품정보 수정
	@Override
	public void updateShopping(ShoppingDTO dto) {
		System.out.println(dto);
		sqlSession.update(namespace+".updateShopping",dto);
	}
	@Override
	public void updateProduct(ProductDTO productDTO) {
		sqlSession.update(namespace+".updateProduct",productDTO);
	}
	
	//---------------------------------------- 쇼핑방송 및 제품정보 삭제
	@Override
	public void deleteProduct(int product_id) {
		sqlSession.delete(namespace+".deleteProduct",product_id);
	}
	@Override
	public void deleteShopping(int cast_id) {
		sqlSession.delete(namespace+".deleteShopping",cast_id);
	}

	// -------------------------------- 쇼핑방송 리스팅
	@Override
	public List<ShoppingDTO> listShopping(HashMap<String, String> map) {
		return sqlSession.selectList(namespace + ".listShopping", map);
	}// listShopping()
	
	// -------------------------------- 쇼핑방송 카테고리별 갯수 / 총 갯수
	@Override
	public int countShopping(String category) {
		return sqlSession.selectOne(namespace+".countShopping", category); //파라미터가 없고, 반환값이 리스트, 해쉬맵이 아닌경우(파라미터가 있으려면 WHERE절을 써야함)
	}// countShopping()
	@Override
	public int totalCountShopping() {
		return sqlSession.selectOne(namespace+".totalCountShopping");
	}
	
	// -------------------------------- 쇼핑방송 읽기
	@Override
	public void updateHit(int cast_id) {
		sqlSession.update(namespace+".updateHit", cast_id);
	}// updateHit()
	@Override
	public ShoppingDTO getShopping(int cast_id) {
		return sqlSession.selectOne(namespace+".getShopping", cast_id);
	}// getShopping()

	// -------------------------------- 관심쇼핑 등록
	@Override
	public void insertInterest(InterestDTO interestDTO) {
		sqlSession.insert(namespace+".insertInterest",interestDTO);
		//System.out.println(interestDTO);
	}
	@Override
	public int duplicationCheck(InterestDTO interestDTO) {
		//System.out.println(interestDTO);
		return sqlSession.selectOne(namespace+".duplicationCheck",interestDTO);
	}

	// -------------------------------- 관심쇼핑 리스트
	@Override
	public List<InterestDTO> listInterest(String mem_id) {
		return sqlSession.selectList(namespace+".listInterest", mem_id);
	}

	// -------------------------------- 관심쇼핑 삭제
	@Override
	public void deleteInterest(HashMap<String, String> map) {
		sqlSession.delete(namespace+".deleteInterest", map);
		
	}
	
}
