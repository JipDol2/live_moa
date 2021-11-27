package com.mycompany.myapp.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mycompany.myapp.domain.CommentsDTO;

@Repository
public class CommentsDAOImpl implements CommentsDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.mycompany.myapp.mapper.CommentsMapper";
	
	@Override
	public List<CommentsDTO> readComments(int cast_id) {
		return sqlSession.selectList(namespace + ".readComments", cast_id);
	}

	@Override
	public void writeComments(CommentsDTO dto) {
		sqlSession.insert(namespace+".writeComments", dto);	
	}

}
