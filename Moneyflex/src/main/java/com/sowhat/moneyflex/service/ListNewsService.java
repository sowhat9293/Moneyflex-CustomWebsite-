package com.sowhat.moneyflex.service;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sowhat.moneyflex.model.News;
public interface ListNewsService {
	public List<List<String>> getList(int pageNum);
	public News getTotalNum();
}
