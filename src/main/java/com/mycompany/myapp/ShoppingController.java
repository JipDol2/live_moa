package com.mycompany.myapp;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.myapp.Service.CommentsService;
import com.mycompany.myapp.Service.ProductService;
import com.mycompany.myapp.Service.ShoppingService;
import com.mycompany.myapp.domain.CommentsDTO;
import com.mycompany.myapp.domain.ProductDTO;
import com.mycompany.myapp.domain.ShoppingDTO;

@Controller
@RequestMapping("/shopping/*")
public class ShoppingController {
	@Inject
	private ShoppingService shoppingService;
	
	@Inject
	private ProductService productService;
	
	@Inject
	private CommentsService commentsService;
	
//	// http://localhost:8080/shopping/list
//	@RequestMapping("/list")
//	public String list0() {
//		return "redirect:/shopping/list/1"; //REST방식 <--> 전통적인 .jsp방식은 list.jsp?pg=1
//	}// list()로 재접근
	
	
	// http://localhost:8080/shopping/list/페이지
	@RequestMapping("/list")
	public String list(@RequestParam(value="category", defaultValue="all") String category,
			@RequestParam(value="pg", defaultValue="1") int pg, 
			HttpServletRequest req, Model model) { 
		int size = 10; // 글의 수 (한 페이지 기준)
		int pageSize = 10; // 페이지 링크 갯수, [11], [12], [13] ... [19], [20]

		int begin = (pg-1) * size + 1; // pg가 2일때, 2 - 1 >> 1 * 10 >> 10 + 1 >> 11 cf. MySQL은 첫 시작번호가 0이기 때문에 마지막 +1을 지워줘야 함 
		int end = begin + (size-1); // 11 + (10 - 1) >> 11 + 9 >> 20

		int startPage = ((pg-1) / pageSize * pageSize) + 1; // 일의 자리를 버리기 위해 나눈 몫을 활용
		int endPage = startPage + (pageSize - 1); // 11+(10-1) >> 11 + 9 >> 20
		
		// SQL에 데이터를 넘겨주기 위해 map객체 생성
		HashMap<String, String> map = new HashMap<String, String>();
		
		// 오라클은 숫자를 문자형 데이터로 받아도 숫자형으로 처리가능
		String str_begin = Integer.toString(begin);
		String str_end = Integer.toString(end);
		
		map.put("begin", str_begin);
		map.put("end", str_end);
		
		// SQL return값을 저장해놓은 변수 생성
		int count;
		List<ShoppingDTO> list;
		
		// 카테고리별로 작동하는 SQL 구분
		// Mapper.xml에서 ${}로 받으면 문자열 부분은 ''(작은따옴표)표시 해줘야 함
		if (category.equals("all")) {
			count = shoppingService.totalCountShopping();
			map.put("category", "'패션' OR category='뷰티' OR category='라이프' OR category='푸드'");
			list = shoppingService.listShopping(map);
		} else {
			count = shoppingService.countShopping(category);
			map.put("category", "'" + category + "'"); 
			list = shoppingService.listShopping(map);
		}

		
		int totalPage = count / size + (count % size == 0 ? 0 : 1);
		int max = count - ((pg -1) * size); // 각 페이지의 최대 글번호. 103 - ((2-1) * 10) >> 103-(1*10) >> 103 -10 >> 93
		
		if (endPage > totalPage) { // 20 > 17
			endPage = totalPage; // 끝 페이지를 17로 재설정
		}
				
		// 로그인 정보 넘기기
		HttpSession session = req.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		
		// model에 데이터를 담는다.
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("list", list);
		model.addAttribute("category", category); // category정보를 .jsp로 넘겨줘서 카테고리별 페이징 처리 유지 목적
		model.addAttribute("pg", pg);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("max", max);

		return "list";
	}// list(현재 페이지, ShoppingDTO)
	
	// 쇼핑방송 및 제품정보 조회
	// http://localhost:8080/shopping/read/페이지/쇼핑방송번호
	@RequestMapping("/read/{pg}/{cast_id}")
	public String read(@PathVariable(value="cast_id") int cast_id, 
					   @PathVariable(value="pg") int pg, Model model) {
		
		// 쇼핑방송 정보, 제품 정보, 댓글 정보 불러오기(cast_id로)
		ShoppingDTO sdto = shoppingService.readShopping(cast_id);
		List<ProductDTO> pdto = productService.readProduct(cast_id); // 1개 이상의 객체를 담아야 함
		List<CommentsDTO> cdto = commentsService.readComment(cast_id);

		System.out.println("sdto=" + sdto);
		System.out.println("pdto=" + pdto);
		System.out.println("cdto=" + cdto);
		
		// DB객체 jsp에 뿌려줄 준비
		model.addAttribute("sdto", sdto);
		model.addAttribute("pdto", pdto); 
		model.addAttribute("cdto", cdto);
		model.addAttribute("pg", pg);
		return "shopping_read";
	}// read()
}// End
