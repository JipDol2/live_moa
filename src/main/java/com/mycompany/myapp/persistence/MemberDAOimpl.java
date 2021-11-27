package com.mycompany.myapp.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mycompany.myapp.domain.MemberDTO;

@Repository
public class MemberDAOimpl implements MemberDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.mycompany.myapp.mapper.MemberMapper";
	@Override
	public void insertMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".insertMember", dto);
	}	
	@Override
	public MemberDTO signin(MemberDTO dto) {		
		return sqlSession.selectOne(namespace + ".signin",dto);
	}
	@Override
	public int idCheck(String mem_id) {
		return sqlSession.selectOne(namespace+".idCheck",mem_id);
	}
}