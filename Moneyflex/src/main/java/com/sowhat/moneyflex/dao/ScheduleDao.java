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
	
	public List<List<String>> getScheduleList(Map<String, String> dbMap, int totalDaysOfMonth)		// 파라미터로 Map인스턴스 전송 전에 "year", "month"를 Map에 넣어넣고 이 메소드안에서 마지막으로 "day"를 넣고 넘긴다.
	{
		List<List<String>> scheduleList = new ArrayList<List<String>>();		// 반환 할 인스턴스
		for(int i = 1; i <= totalDaysOfMonth; i++)
		{
			Map<String, String> tempMap = dbMap;
			tempMap.put("day", String.valueOf(i));
			List list = sqlMapClientTemplate.queryForList("sample.query4", tempMap);		// 해당 년, 월, 일의 스케줄이 담겨 있다.
	        List<String> tempList = new ArrayList<String>();		//DB로부터 받아온 List를 String으로 변환하여 다시 담을 List
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
