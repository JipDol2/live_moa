package com.mycompany.myapp;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.myapp.Service.ShoppingService;
import com.mycompany.myapp.domain.InterestDTO;

@Controller
@RequestMapping("/interest/*")
public class InterestController {
	
	@Inject
	private ShoppingService shoppingService;
	
	// http://localhost:8080/product_reg
	@RequestMapping("/login_check")
	public String product_registration(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String ret = (String)session.getAttribute("mem_id");
		if(ret==null) {
			return "redirect:/loginform";
		}
		return "redirect:/interest/list";
	}// product_regitseration
	
	// http://localhost:8080/interest/list
	@RequestMapping("/list")
	public String list(HttpServletRequest req, Model model) {
		// 사용자 아이디 받아오기
		HttpSession session = req.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		System.out.println(mem_id); // 로그인해야지만 넘어갈 수 있도록 통제해줘야함
		
		// 사용자 아이디로 관심쇼핑 리스트 가져오기 
		List<InterestDTO> listDTO = shoppingService.listInterest(mem_id);
		System.out.println(listDTO);
			
		// dto JSP에 넘기기
		model.addAttribute("interestDTO", listDTO);
		return "interest_list";
	}// list
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(HttpServletRequest req) {
		HttpSession session = req.getSession();

		String mem_id = (String) session.getAttribute("mem_id");
		String cast_id = req.getParameter("cast_id"); // Mapper에서 SQL 자료형 변환해주기

		// map객체 생성 및 데이터 담기
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("mem_id", mem_id);
		map.put("cast_id", cast_id);
		
		// map객체로 데이터 넘겨서 SQL실행
		shoppingService.deleteInterest(map);
		return "redirect:/interest/list";
	}

}
