package com.mycompany.myapp;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.myapp.Service.CommentsService;
import com.mycompany.myapp.domain.CommentsDTO;

@Controller
@RequestMapping("/comments/*")
public class CommentsController {
	@Inject
	private CommentsService commentsService;
	
	// http://localhost:8080/comments/write : POST방식
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(CommentsDTO dto, HttpServletRequest req, 
			@RequestParam(value="pg") int pg,
			@RequestParam(value="cast_id") int cast_id) {
		
		// Session 객체 생성 
		HttpSession session = req.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		System.out.println(mem_id);
		
		// mem_id값 존재여부에 따라 처리
		if (mem_id == null) {
			return "redirect:/loginform";
		} else {
			// Session의 mem_id값을 dto에 저장
			dto.setMem_id(mem_id);
			System.out.println(mem_id);
			
			// dto를 SQL작업을 위해 넘김
			commentsService.writeComments(dto);		
			return "redirect:/shopping/read/" + pg +"/" + cast_id;
		}
		
	}// write
}// End
