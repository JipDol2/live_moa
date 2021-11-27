package com.mycompany.myapp.persistence;

import java.util.List;

import com.mycompany.myapp.domain.CommentsDTO;

public interface CommentsDAO {
	// 쇼핑방송에 있는 댓글 가져오기
	public List<CommentsDTO> readComments(int cast_id);
	// 댓글 작성하기
	public void writeComments(CommentsDTO dto);

}
