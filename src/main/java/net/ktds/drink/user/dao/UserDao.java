package net.ktds.drink.user.dao;

import net.ktds.drink.user.vo.UserVO;

public interface UserDao {

	public int countUserEmail(String userEmail);

	public int countUserNickname(String userNickname);

	public int signUpUser(UserVO user);

}
