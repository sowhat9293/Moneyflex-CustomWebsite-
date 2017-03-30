package com.sowhat.moneyflex;
import java.util.HashMap;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("dao-context.xml")
//@TransactionConfiguration(transactionManager="txManager")
//@Transactional
public class DaoContextTest {
 @Autowired
 private SqlMapClientTemplate sqlMapClientTemplate;	// ���
 
 @Test
 public void testApplicationContext() throws Exception { 
 
 }
 @Test
 public void testQuery1() throws Exception { 
      System.err.println(sqlMapClientTemplate);
      List list = sqlMapClientTemplate.queryForList("sample.query3");	// sql�� xml����ȭ�Ͽ� ������ ���� sample.query1�̶�� id�� ��������
      if(list != null){
       int nList = list.size();
       for(int i=0; i<nList; i++){
        System.out.println(list.get(i));
       }
      }
 }
}