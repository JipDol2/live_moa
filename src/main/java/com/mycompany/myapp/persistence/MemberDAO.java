package com.mycompany.myapp.persistence;

import com.mycompany.myapp.domain.MemberDTO;

public interface MemberDAO {
	public void insertMember(MemberDTO dto);
	public MemberDTO signin(MemberDTO dto);
	public int idCheck(String mem_id);
}