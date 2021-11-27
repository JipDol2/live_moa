package com.mycompany.myapp.Service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycompany.myapp.domain.MemberDTO;
import com.mycompany.myapp.persistence.MemberDAO;

//@Service를 써주지 않으면 Dependency annotations:{@javax.inject.Inject()} 라는 오류가 발생
@Service
public class MemberServiceimpl implements MemberService {
	@Inject
	private MemberDAO memberDAO;
	@Override
	public void insertMember(MemberDTO dto) {
		memberDAO.insertMember(dto);
	}
	@Override
	public MemberDTO signin(MemberDTO dto) {
		return memberDAO.signin(dto);
	}
	@Override
	public int idCheck(String mem_id) {
		return memberDAO.idCheck(mem_id);
	}
}
