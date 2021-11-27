package com.mycompany.myapp.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycompany.myapp.domain.CommentsDTO;
import com.mycompany.myapp.persistence.CommentsDAO;

@Service
public class CommentsServiceImpl implements CommentsService {
	@Inject
	private CommentsDAO commentsDAO;
	
	@Override
	public List<CommentsDTO> readComment(int cast_id) {
		return commentsDAO.readComments(cast_id);
	}

	@Override
	public void writeComments(CommentsDTO dto) {
		commentsDAO.writeComments(dto);		
	}
	
}
