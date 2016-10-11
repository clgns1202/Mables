package net.ktds.drink.user.dao;
/**
 * 다음과 같은 추상 메소드를 가진다
 * 1. 로그인
 * 2. 회원가입
 * 3. 포인트 적립
 * 4. 중복회원 체크
 * @author 206-017
 *
 */
public interface UserDao {

	int countUserEmail(String userEmail);

}
