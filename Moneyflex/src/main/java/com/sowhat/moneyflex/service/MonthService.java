package com.sowhat.moneyflex.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MonthService {
	public List<List<String>> getList(int year, int month);
}
