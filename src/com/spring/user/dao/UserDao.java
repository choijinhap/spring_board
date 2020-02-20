package com.spring.user.dao;

import com.spring.user.vo.UserVo;

public interface UserDao {

	int userInsert(UserVo userVo) throws Exception;

	int userIdCheck(String userId) throws Exception;

}
