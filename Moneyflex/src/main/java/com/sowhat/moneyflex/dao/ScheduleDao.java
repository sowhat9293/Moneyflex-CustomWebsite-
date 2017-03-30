package com.sowhat.moneyflex.dao;

import java.util.ArrayList;
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
public class ScheduleDao {
	
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	public ScheduleDao(SqlMapClientTemplate sqlMapClientTemplate)
	{
		this.sqlMapClientTemplate =sqlMapClientTemplate;
	}
	
	public List<List<String>> getScheduleList(Map<String, String> dbMap, int totalDaysOfMonth)		// �Ķ���ͷ� Map�ν��Ͻ� ���� ���� "year", "month"�� Map�� �־�ְ� �� �޼ҵ�ȿ��� ���������� "day"�� �ְ� �ѱ��.
	{
		List<List<String>> scheduleList = new ArrayList<List<String>>();		// ��ȯ �� �ν��Ͻ�
		for(int i = 1; i <= totalDaysOfMonth; i++)
		{
			Map<String, String> tempMap = dbMap;
			tempMap.put("day", String.valueOf(i));
			List list = sqlMapClientTemplate.queryForList("sample.query4", tempMap);		// �ش� ��, ��, ���� �������� ��� �ִ�.
	        List<String> tempList = new ArrayList<String>();		//DB�κ��� �޾ƿ� List�� String���� ��ȯ�Ͽ� �ٽ� ���� List
			if( list != null)
			{
		          int nList = list.size();
		          for(int j=0; j<nList; j++){
		        	  HashMap hm = (HashMap)list.get(j);
		        	  tempList.add(String.valueOf(hm.get("DO")));
		          }
			}
			scheduleList.add(tempList);
		}
		return scheduleList;
	}

}
