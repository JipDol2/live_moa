package com.mycompany.myapp.Service;

import java.util.List;

import com.mycompany.myapp.domain.CommentsDTO;

public interface CommentsService {
	// 쇼핑방송에 달린 댓글 가져오기
	List<CommentsDTO> readComment(int cast_id);
	// 댓글 작성하기	
	void writeComments(CommentsDTO dto);

}
