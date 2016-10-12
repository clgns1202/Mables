package net.ktds.drink.user.biz;

import net.ktds.drink.support.DaoSupport;
import net.ktds.drink.user.dao.UserDao;
import net.ktds.drink.user.dao.UserDaoImpl;
import net.ktds.drink.user.vo.UserVO;

public class UserBizImpl extends DaoSupport implements UserBiz {
	
	private UserDao userDao;
	
	public UserBizImpl(){
		userDao = new UserDaoImpl();
	}

	@Override
	public boolean isExsistUserEmail(String userEmail) {
		return userDao.countUserEmail(userEmail) > 0;
	}

	@Override
	public boolean isExsistUserNickname(String userNickname) {
		return userDao.countUserNickname(userNickname) > 0;
	}

	@Override
	public boolean signUpUser(UserVO user) {
		return userDao.signUpUser(user) > 0;
	}

}
