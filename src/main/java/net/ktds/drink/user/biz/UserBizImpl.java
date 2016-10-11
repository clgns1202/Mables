package net.ktds.drink.user.biz;

import net.ktds.drink.support.DaoSupport;
import net.ktds.drink.user.dao.UserDao;
import net.ktds.drink.user.dao.UserDaoImpl;

public class UserBizImpl extends DaoSupport implements UserBiz {
	
	private UserDao userDao;
	
	public UserBizImpl(){
		userDao = new UserDaoImpl();
	}

	@Override
	public boolean isExsistUserEmail(String userEmail) {
		return userDao.countUserEmail(userEmail) > 0;
	}

}
