package com.sowhat.moneyflex.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.transaction.annotation.Transactional;

@ContextConfiguration("dao-context.xml")
@Transactional
public class IdDao {
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	public IdDao(SqlMapClientTemplate sqlMapClientTemplate)
	{
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	
	public boolean isExist(String id)
	{
		Map<String, String> map = new HashMap<String, String>();
		map.put("ID", id);
		List list = sqlMapClientTemplate.queryForList("sample.query5", map);
		HashMap hm = (HashMap)list.get(0);
		return Integer.parseInt(String.valueOf(hm.get("exist"))) == 1 ? true : false;
	}
}
