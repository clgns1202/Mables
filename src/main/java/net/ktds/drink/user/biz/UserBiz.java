package net.ktds.drink.user.biz;

import net.ktds.drink.user.vo.UserVO;

public interface UserBiz {

	public boolean isExsistUserEmail(String userEmail);

	public boolean isExsistUserNickname(String userNickname);

	public boolean signUpUser(UserVO user);

}
