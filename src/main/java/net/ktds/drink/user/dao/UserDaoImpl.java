package net.ktds.drink.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.management.Query;

import net.ktds.drink.support.DaoSupport;
import net.ktds.drink.support.QueryAndResult;

public class UserDaoImpl extends DaoSupport implements UserDao {

	@Override
	public int countUserEmail(String userEmail) {
		return (int) selectOne( new QueryAndResult(){

			@Override
			public PreparedStatement query(Connection conn) throws SQLException {
				StringBuffer query = new StringBuffer();
				query.append(" SELECT	COUNT(1) CNT ");
				query.append(" FROM		USR ");
				query.append(" WHERE	USR_EML = ? ");
				
				PreparedStatement pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1, userEmail);
				return pstmt;
			}

			@Override
			public Object makeObject(ResultSet rs) throws SQLException {
				if( rs.next() ){
					return rs.getInt("CNT");
				}
				return 0;
			}
			
		});
	}

}
