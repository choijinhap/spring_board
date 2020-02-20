package com.spring.user.service;

import com.spring.user.vo.UserVo;

public interface UserService {

	int userInsert(UserVo userVo) throws Exception;

	int userIdCheck(String userId) throws Exception;

}
