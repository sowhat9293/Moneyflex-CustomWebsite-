package com.sowhat.moneyflex.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sowhat.moneyflex.dao.MemberDao;
import com.sowhat.moneyflex.model.Member;

@Service
@Transactional
public class MemberServiceImpl implements MemberService
{
	 @Autowired
	 private SqlMapClientTemplate sqlMapClientTemplate;
	 
	 public boolean putNewMember(Member member)
	 {
		 MemberDao memberDao = new MemberDao(sqlMapClientTemplate);
		 Map<String, String> map = new HashMap<String, String>();
		 map.put("NAME", member.getName());
		 map.put("ID", member.getId());
		 map.put("PASSWORD", member.getPwd());
		 map.put("BIRTHDATE", member.getbDay());
		 map.put("GENDER", String.valueOf(member.getGender()));
		 map.put("EMAIL", member.getEmail());
		 map.put("ADDRESS", member.getAddress());
		 map.put("HPNUM", member.getNum());
		 map.put("SPNUM", member.getpNum());
		 memberDao.putNewMember(map);
		 return true;
	 }
	 
	 public boolean checkIdPwd(String id, String pwd)
	 {
		 MemberDao memberDao = new MemberDao(sqlMapClientTemplate);
		 Map<String, String> map = new HashMap<String, String>();
		 map.put("ID", id);
		 map.put("PASSWORD", pwd);
		 return memberDao.checkIdPwd(map);
	 }
}
