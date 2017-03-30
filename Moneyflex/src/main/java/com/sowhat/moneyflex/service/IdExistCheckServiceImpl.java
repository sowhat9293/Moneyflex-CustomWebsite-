package com.sowhat.moneyflex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sowhat.moneyflex.dao.IdDao;

@Service
@Transactional
public class IdExistCheckServiceImpl implements IdExistCheckService
{

	 @Autowired
	 private SqlMapClientTemplate sqlMapClientTemplate;
	 
	 public boolean isExistId(String id)
	 {
		 IdDao idDao = new IdDao(sqlMapClientTemplate);
		 return idDao.isExist(id);
	 }
}
