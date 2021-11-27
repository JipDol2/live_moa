package com.mycompany.myapp;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.myapp.Service.MemberService;
import com.mycompany.myapp.Service.ProductService;
import com.mycompany.myapp.Service.ShoppingService;
import com.mycompany.myapp.domain.InterestDTO;
import com.mycompany.myapp.domain.MemberDTO;
import com.mycompany.myapp.domain.ProductDTO;
import com.mycompany.myapp.domain.ShoppingDTO;

import jdk.internal.org.jline.utils.Log;

@Controller
public class MemberController {
	//Inject는 매 변수를 선언할때마다 붙여주어야 한다.
	@Inject
	private MemberService memberService;
	@Inject
	private ShoppingService shoppingService;
	@Inject
	private ProductService productService;
	
	// http://localhost:8080/
	@RequestMapping("/")
	public String index(Model model) {
		return "index";
	}// index

	// http://localhost:8080/signupform
	@RequestMapping("/signupform")
	public String writeform() {
		return "signupform";
	}// writeform	
	
	//회원가입이 완료된 후 로그인 페이지로 이동시켜야 함.(임시로 home으로 이동)
	// http://localhost:8080/signup
	@RequestMapping(value="/signup",method=RequestMethod.POST)
	public String register(MemberDTO dto) {
		memberService.insertMember(dto);
		return "redirect:/";
	}// register
	
	@RequestMapping("/loginform")
	public String loginform() {
		return "loginform";
	}// loginform
	
	//회원가입 아이디 중복체크
	@ResponseBody
	@RequestMapping(value="/idCheck" , method=RequestMethod.POST)
	public int idCheck(@RequestBody String mem_id) {
		int ret = memberService.idCheck(mem_id);
		return ret;
	}// idCheck
	
	//로그인 구현
	//만약 DB에 담겨져 있지 않은 아이디와 비밀번호를 입력시 로그인이 안되게끔 해야됨.
	//http://localhost:8080/login
	@RequestMapping(value="/signin",method=RequestMethod.POST)
	public String login(MemberDTO dto,HttpServletRequest req ,RedirectAttributes rttr) {
		HttpSession session = req.getSession();
		MemberDTO login = memberService.signin(dto);		
		if(login==null) {
			session.setAttribute("mem_id",null);
			rttr.addFlashAttribute("msg",false);
		}else {
			session.setAttribute("mem_id", login.getMem_id());
		}
		return "redirect:/";
	}// login
	
	//로그아웃
	//http://localhost:8080/signout
	@RequestMapping("/signout")
	public String logout(HttpServletRequest req,RedirectAttributes rttr) {
		HttpSession session = req.getSession();
		session.invalidate();
		rttr.addFlashAttribute("msg",true);
		return "redirect:/";
	}//logout
	
	//상품등록 페이지
	//http://localhost:8080/product_reg
	@RequestMapping("/product_registration")
	public String product_registration(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String ret = (String)session.getAttribute("mem_id");
		if(ret==null) {
			return "redirect:/loginform";
		}
		return "product_registration";
	}// product_regitseration
	
	//쇼핑방송 등록
	//cast_id,seller,category,cast_platform,cast_date
	@RequestMapping(value="/product_reg",method=RequestMethod.POST)
	public String product_reg(HttpServletRequest req) {
		HttpSession session = req.getSession();
		ShoppingDTO shoppingDTO = new ShoppingDTO();
		ProductDTO productDTO = new ProductDTO();
		
		// 쇼핑방송 정보 생성 (클라이언트 POST된 데이터 > DTO에 저장 > Service레이어 호출(SQL insert문 실행)
		shoppingDTO.setMem_id((String)session.getAttribute("mem_id"));
		shoppingDTO.setCast_name(req.getParameter("cast_name"));
		shoppingDTO.setCategory(req.getParameter("category"));
		shoppingDTO.setCast_platform(req.getParameter("cast_platform"));
		shoppingDTO.setSeller(req.getParameter("seller"));
		shoppingDTO.setCast_date(req.getParameter("cast_date"));
		shoppingDTO.setCast_time(req.getParameter("cast_time"));
		shoppingDTO.setShopping_link(req.getParameter("shopping_link"));
		shoppingDTO.setHit(0);
		shoppingService.insertShopping(shoppingDTO);

		// 생성된 쇼핑방송 기본키 가져오기
		int cast_id = shoppingService.getShoppingPK(shoppingDTO.getMem_id());
		
		// 쇼핑방송 기본키로 제품 정보 생성
		productDTO.setCast_id(cast_id);
		productDTO.setProduct_name(req.getParameter("product1"));
		productDTO.setPrice(Integer.parseInt(req.getParameter("price1")));
		productDTO.setDiscount(Integer.parseInt(req.getParameter("discount1")));
		shoppingService.insertProduct(productDTO);
		
		String p_name=req.getParameter("product2");
		String p_price = req.getParameter("price2");
		String p_discount = req.getParameter("discount2");		
		if(p_name!="" && p_price!="" && p_discount!="") {			
			productDTO.setProduct_name(p_name);
			productDTO.setPrice(Integer.parseInt(p_price));
			productDTO.setDiscount(Integer.parseInt(p_discount));			
			shoppingService.insertProduct(productDTO);
		}
		
		p_name=req.getParameter("product3");
		p_price = req.getParameter("price3");
		p_discount = req.getParameter("discount3");
		if(p_name!="" && p_price!="" && p_discount!="") {			
			productDTO.setProduct_name(p_name);
			productDTO.setPrice(Integer.parseInt(p_price));
			productDTO.setDiscount(Integer.parseInt(p_discount));			
			shoppingService.insertProduct(productDTO);
		}
		return "redirect:/shopping/list";
	}// product_reg
	
	//쇼빙방송 상품 수정
	@RequestMapping("/product_updateform/{cast_id}/{pg}")
	public String product_updateform(@PathVariable(value="cast_id") int cast_id,HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
		String id_session = (String)session.getAttribute("mem_id");
		if(id_session==null)
			return "redirect:/loginform";
		String id_form = req.getParameter("mem_id");
		//System.out.println("id_session : " + id_session);
		//System.out.println("id_form : "+id_form);	
		if(!(id_session.equals(id_form)))
			return "fail";		
		ShoppingDTO sdto = shoppingService.readShopping(cast_id);
		List<ProductDTO> pdto = productService.readProduct(cast_id);
		model.addAttribute("sdto",sdto);
		model.addAttribute("pdto",pdto);
		return "product_updateform";
	}//product_updateform
	
	@RequestMapping(value="/product_update",method=RequestMethod.POST)
	public String product_update(HttpServletRequest req){
		HttpSession session = req.getSession();
		ShoppingDTO shoppingDTO = new ShoppingDTO();
		ProductDTO productDTO = new ProductDTO();
		
		shoppingDTO.setMem_id((String)session.getAttribute("mem_id"));
		shoppingDTO.setCast_name(req.getParameter("cast_name"));
		shoppingDTO.setCategory(req.getParameter("category"));
		shoppingDTO.setCast_platform(req.getParameter("cast_platform"));
		shoppingDTO.setSeller(req.getParameter("seller"));
		shoppingDTO.setCast_date(req.getParameter("cast_date"));
		shoppingDTO.setCast_time(req.getParameter("cast_time"));
		shoppingDTO.setShopping_link(req.getParameter("shopping_link"));
		shoppingDTO.setHit(0);
		shoppingDTO.setCast_id(Integer.parseInt(req.getParameter("cast_id")));
		//System.out.println("cast_id : " + req.getParameter("cast_id"));
		shoppingService.updateShopping(shoppingDTO);		
		
		// System.out.println("product_id1 : "+ Integer.parseInt(req.getParameter("product_id1")));
		
		if(req.getParameter("product_id1")!=null) {
			productDTO.setProduct_id(Integer.parseInt(req.getParameter("product_id1")));
			productDTO.setCast_id(Integer.parseInt(req.getParameter("cast_id")));
			productDTO.setProduct_name(req.getParameter("product1"));
			productDTO.setPrice(Integer.parseInt(req.getParameter("price1")));
			productDTO.setDiscount(Integer.parseInt(req.getParameter("discount1")));
			shoppingService.updateProduct(productDTO);
		}
		//1.기존 등록된 상품이 존재하고 이를 수정하려는 경우
		//2.기존 등록된 상품이 없고 새롭게 추가하려는 경우
		//3.기존 등록된 상품이 존재하고 이를 삭제하려는 경우
		if(req.getParameter("product_id2")!="" && req.getParameter("product2")!="") {
			productDTO.setProduct_id(Integer.parseInt(req.getParameter("product_id2")));
			productDTO.setCast_id(Integer.parseInt(req.getParameter("cast_id")));
			productDTO.setProduct_name(req.getParameter("product2"));
			productDTO.setPrice(Integer.parseInt(req.getParameter("price2")));
			productDTO.setDiscount(Integer.parseInt(req.getParameter("discount2")));
			shoppingService.updateProduct(productDTO);
		}else if(req.getParameter("product_id2")=="" && req.getParameter("product2")!="") {
			productDTO.setCast_id(Integer.parseInt(req.getParameter("cast_id")));
			productDTO.setProduct_name(req.getParameter("product2"));
			productDTO.setPrice(Integer.parseInt(req.getParameter("price2")));
			productDTO.setDiscount(Integer.parseInt(req.getParameter("discount2")));
			shoppingService.insertProduct(productDTO);
		}else if(req.getParameter("product_id2")!="" && req.getParameter("product2")=="") {
			shoppingService.deleteProduct(Integer.parseInt(req.getParameter("product_id2")));
		}
		if(req.getParameter("product_id3")!="" && req.getParameter("product3")!="") {
			productDTO.setProduct_id(Integer.parseInt(req.getParameter("product_id3")));
			productDTO.setCast_id(Integer.parseInt(req.getParameter("cast_id")));
			productDTO.setProduct_name(req.getParameter("product3"));
			productDTO.setPrice(Integer.parseInt(req.getParameter("price3")));
			productDTO.setDiscount(Integer.parseInt(req.getParameter("discount3")));
			shoppingService.updateProduct(productDTO);
		}else if(req.getParameter("product_id3")=="" && req.getParameter("product3")!="") {
			productDTO.setCast_id(Integer.parseInt(req.getParameter("cast_id")));
			productDTO.setProduct_name(req.getParameter("product3"));
			productDTO.setPrice(Integer.parseInt(req.getParameter("price3")));
			productDTO.setDiscount(Integer.parseInt(req.getParameter("discount3")));
			shoppingService.insertProduct(productDTO);
		}else if(req.getParameter("product_id3")!="" && req.getParameter("product3")=="") {
			shoppingService.deleteProduct(Integer.parseInt(req.getParameter("product_id3")));
		}
		return "redirect:/shopping/list";
	}// product_update
	
	// 쇼핑방송 상품 삭제
	@RequestMapping("/product_deleteform/{cast_id}/{pg}")
	public String product_deleteform(@PathVariable(value="cast_id") int cast_id,HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id_session = (String)session.getAttribute("mem_id");
		if(id_session==null)
			return "redirect:/loginform";
		String id_form = req.getParameter("mem_id");
		//System.out.println("id_session : " + id_session);
		//System.out.println("id_form : "+id_form);	
		if(!(id_session.equals(id_form)))
			return "fail";
		shoppingService.deleteShopping(cast_id);
		return "redirect:/shopping/list";
	}// product_deleteform
	
	//관심목록 추가
	@RequestMapping("/insertInterest/{pg}/{cast_id}")
	public String insertInterest(@PathVariable(value="pg") int pg, @PathVariable(value="cast_id") int cast_id,
			HttpServletRequest req) {
		InterestDTO interestDTO = new InterestDTO();
		HttpSession session = req.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		if(mem_id==null) return "redirect:/loginform";	//로그인이 안되있다면 자동으로 로그인 폼으로 이동
		
		interestDTO.setCast_id(cast_id);
		interestDTO.setMem_id(mem_id);		
		shoppingService.insertInterest(interestDTO);
		return "redirect:/idCheck2";
	}// insertInterest
	
	@RequestMapping("/idCheck2")
	public String idCheck2(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		return "success";
	}// idCheck2
}// end