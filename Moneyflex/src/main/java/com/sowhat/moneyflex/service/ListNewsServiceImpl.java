package com.sowhat.moneyflex.service;

import java.util.List;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sowhat.moneyflex.dao.NewsDao;
import com.sowhat.moneyflex.model.News;



@Service
@Transactional
public class ListNewsServiceImpl implements ListNewsService
{
	
	 @Autowired
	 private SqlMapClientTemplate sqlMapClientTemplate;
	 
	 
	public List<List<String>> getList(int pageNum)
	{
		 NewsDao newsDao = new NewsDao(sqlMapClientTemplate);	// Service는 Dao를 통해 데이터를 갖고오고
		 return newsDao.getNewsList(pageNum);
	}
	
	public News getTotalNum()
	{
		NewsDao newsDao = new NewsDao(sqlMapClientTemplate);
		News news = new News();
		news.setPnum(newsDao.getTotalCount());
		return news;
	}
	
}
