package com.spring.user.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.user.dao.UserDao;
import com.spring.user.vo.UserVo;

@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
	SqlSession sqlSession;
	@Override
	public int userInsert(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("user.userInsert",userVo);
	}
	@Override
	public int userIdCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.userIdCheck",userId);
	}
	@Override
	public int userPwCheck(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.userPwCheck",userVo);
	}
	@Override
	public UserVo userLogin(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.userLogin",userVo);
	}
	@Override
	public boolean loginCheck(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		String name = sqlSession.selectOne("user.loginCheck",userVo);
		return (name==null)?false:true;
	}
}
