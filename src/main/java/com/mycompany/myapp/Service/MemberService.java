package com.mycompany.myapp.Service;

import com.mycompany.myapp.domain.*;

public interface MemberService {
	public void insertMember(MemberDTO dto);
	public MemberDTO signin(MemberDTO dto);
	public int idCheck(String mem_id);
}
