package com.sowhat.moneyflex.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
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
public class NewsDao {
	
	private SqlMapClientTemplate sqlMapClientTemplate;
	private final int PAGE_PER_NEWS = 3;
	
	public NewsDao(SqlMapClientTemplate sqlMapClientTemplate)
	{
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	
	public int getTotalCount()	// 총 글의 개수를 갖고 온다.
	{
		List list = sqlMapClientTemplate.queryForList("sample.query2");
		HashMap hm = (HashMap)list.get(0);
		return Integer.parseInt(String.valueOf(hm.get("totalnum")));
	}
	
	public List<List<String>> getNewsList(int pageNum)
	{
		List<List<String>> newsList = new ArrayList<List<String>>();		// 반환 할 인스턴스
		List list = sqlMapClientTemplate.queryForList("sample.query1", (pageNum -1) * PAGE_PER_NEWS, PAGE_PER_NEWS);	// FirstRow부터 3개의 튜플을 갖고온다.
	    int size = list.size();
		if( list != null)
		{
		       int nList = list.size();
		       for(int j=0; j<nList; j++){			// 큰 List 만드는 구간
		      	  HashMap hm = (HashMap)list.get(j);
		       	  newsList.add(makeNewsListFromHashMap(hm));
		       }
		}
		return newsList;
	}
	
	
	private List<String> makeNewsListFromHashMap(HashMap hm)
	{
		List<String> list = new ArrayList<String>();
		list.add(String.valueOf(hm.get("TEXT_NUMBER")));		// 0
		list.add(String.valueOf(hm.get("CATEGORY")));			// 1
		list.add(String.valueOf(hm.get("IMG_SRC")));			// 2
		list.add(String.valueOf(hm.get("TITLE")));					// 3
		list.add(String.valueOf(hm.get("CONTENT")));			// 4
		list.add(String.valueOf(hm.get("TEXT_DATE")));			// 5

		return list;
	}

}
