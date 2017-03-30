package com.sowhat.moneyflex.service;

import com.sowhat.moneyflex.model.Member;

public interface MemberService {
	public boolean putNewMember(Member member);
	public boolean checkIdPwd(String id, String pwd);
}
