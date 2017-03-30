package com.sowhat.moneyflex.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.transaction.annotation.Transactional;

@ContextConfiguration("dao-context.xml")
@Transactional
public class MemberDao {
	private SqlMapClientTemplate sqlMapClientTemplate;
	public MemberDao(SqlMapClientTemplate sqlMapClientTemplate)
	{
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	
	public boolean putNewMember(Map<String, String> map)
	{
		sqlMapClientTemplate.insert("sample.query6", map);
		return true;
	}
	
	public boolean checkIdPwd(Map<String, String>map)
	{
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		List list = sqlMapClientTemplate.queryForList("sample.query5", map);
		HashMap hm = (HashMap)list.get(0);
		if( Integer.parseInt(String.valueOf(hm.get("exist"))) == 1 )	// �α����Ϸ��� ID�� �����Ѵٸ�
		{
			List list2 = sqlMapClientTemplate.queryForList("sample.query7", map);
			HashMap hm2 = (HashMap)list2.get(0);
			String inputPwd = String.valueOf(map.get("PASSWORD"));
			String cipherPwd = String.valueOf(hm2.get("PASSWORD"));
			if( passwordEncoder.matches(inputPwd, cipherPwd))			// �н����尡 ���ٸ� �α��� ����
				return true;
			else												// �н����尡 �ٸ��Ƿ� �α��� ����
				return false;	
		}
		else
			return false;	//ID�� �������� ����
	}
}
