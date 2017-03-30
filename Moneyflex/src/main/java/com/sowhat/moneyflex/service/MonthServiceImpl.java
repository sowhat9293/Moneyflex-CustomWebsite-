package com.sowhat.moneyflex.service;

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
import com.sowhat.moneyflex.dao.ScheduleDao;


@Service
@Transactional
public class MonthServiceImpl implements MonthService
{

	 @Autowired
	 private SqlMapClientTemplate sqlMapClientTemplate;
	 
	 int[] totalDaysOfMonth = new int[] {0, 31, 28, 31, 30, 31, 30, 31, 31, 30 ,31, 30, 31};
	 
	 
		public List<List<String>> getList(int year, int month)
		{
			String yearVal = String.valueOf(year);
			String monthVal = String.valueOf(month);
			Map<String, String> dataMap = new HashMap<String, String>();
			dataMap.put("year", yearVal);
			dataMap.put("month", monthVal);
			ScheduleDao scheduleDao = new ScheduleDao(sqlMapClientTemplate);
			totalDaysOfMonth[2] = ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) ? 29 : 28;
			return scheduleDao.getScheduleList(dataMap, totalDaysOfMonth[month]);
		}
}
