package com.spring.user.service.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.user.dao.UserDao;
import com.spring.user.service.UserService;
import com.spring.user.vo.UserVo;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserDao userDao;
	
	@Override
	public int userInsert(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return userDao.userInsert(userVo);
	}

	@Override
	public int userIdCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		return userDao.userIdCheck(userId);
	}

	@Override
	public int userPwCheck(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return userDao.userPwCheck(userVo);
	}

	@Override
	public UserVo userLogin(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return userDao.userLogin(userVo);
	}

	@Override
	public boolean loginCheck(UserVo userVo, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		boolean result=userDao.loginCheck(userVo);
		if(result) {
			UserVo myUserVo=userLogin(userVo);
			session.setAttribute("login", "success");
			session.setAttribute("userId", myUserVo.getUserId());
			session.setAttribute("userName", myUserVo.getUserName());
		}
		return result;
	}

	@Override
	public void logout(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		session.invalidate();
	}
}
