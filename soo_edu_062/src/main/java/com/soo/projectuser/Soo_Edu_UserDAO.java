package com.soo.projectuser;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository("UserDAO")
public class Soo_Edu_UserDAO {
	
	@Autowired
	private SqlMapClient sql;
	
	public void user_insert(Soo_Edu_UserVO uservo) throws SQLException {
		
		sql.insert("UserDAO.user_insert", uservo);
	}
	
	public Long get_mail(String user_mail) throws SQLException {
		
		Object aa = sql.queryForObject("UserDAO.get_mail", user_mail);
		
		return Long.valueOf(String.valueOf(aa));
	}
	
	public int get_phone(String user_phone) throws SQLException {
		
		Object aa = sql.queryForObject("UserDAO.get_phone", user_phone);
		
		return Integer.valueOf(String.valueOf(aa));
	}
	
	public Soo_Edu_UserVO selectUser(String user_mail) throws SQLException {
		
		// aa = 
		Soo_Edu_UserVO aa = (Soo_Edu_UserVO)sql.queryForObject("UserDAO.selectUser", user_mail);
		
		return aa;
	}
	/*
	public Soo_Edu_UserVO selectUser(String user_mail) {
		// TODO Auto-generated method stub
		return null;
	}
	*/
	
}
