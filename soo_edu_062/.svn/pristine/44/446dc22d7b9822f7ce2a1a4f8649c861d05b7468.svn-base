package com.soo.projectuser;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("UserService")
public class Soo_Edu_UserServiceImp implements Soo_Edu_UserService {

	@Resource (name = "UserDAO")
	private Soo_Edu_UserDAO dao;
	
	/*
	@Autowired
	private Soo_Edu_UserDAO dao;
	*/
	@Override
	public void user_insert(Soo_Edu_UserVO uservo) throws Exception {
		dao.user_insert(uservo);
	}

	@Override
	public Long get_mail(String user_mail) throws Exception {
		return Long.valueOf(user_mail);
	}

	
	@Override
	public int get_phone(String user_phone) throws Exception {
		return dao.get_phone(user_phone);
	}
	
	@Override
	public Soo_Edu_UserVO selectUser(String user_mail) throws Exception {
		
		return dao.selectUser(user_mail) ;
	}
	
	
	
}
