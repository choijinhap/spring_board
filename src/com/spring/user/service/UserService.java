package com.spring.user.service;

import javax.servlet.http.HttpSession;

import com.spring.user.vo.UserVo;

public interface UserService {

	int userInsert(UserVo userVo) throws Exception;

	int userIdCheck(String userId) throws Exception;

	int userPwCheck(UserVo userVo) throws Exception;

	UserVo userLogin(UserVo userVo) throws Exception;

	boolean loginCheck(UserVo userVo, HttpSession session) throws Exception;

	void logout(HttpSession session) throws Exception;

}
