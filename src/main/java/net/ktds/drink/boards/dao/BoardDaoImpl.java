package net.ktds.drink.boards.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import net.ktds.drink.boards.vo.BoardVO;
import net.ktds.drink.support.DaoSupport;
import net.ktds.drink.support.Query;

public class BoardDaoImpl extends DaoSupport implements BoardDao{

	@Override
	public int insert(BoardVO board) {
		return insert(new Query() {
			
			@Override
			public PreparedStatement query(Connection conn) throws SQLException {
				StringBuffer query = new StringBuffer();
				query.append(" INSERT	INTO	BOARD( ");
				query.append("  				, BRD_ID ");
				query.append("  				, BRD_SBJ, BRD_CONT, USR_ID ");
				query.append("  				, CRT_DT, FILE_NM, CTGR_ID, MDFY_DT ");
				query.append("  				, HIT_CNT, RCMD_CNT) ");
				query.append("  				VAL( ");
				query.append("  				'BR-' || TO_CHAR(SYSDATE, 'YYYYMMDD') || '-' || LAPD(BRD_ID_SEQ.NEXTVAL,6,0) ");
				query.append("  				, ?, ?, ?, SYSDATE, ?, ?, SYSDATE, 0, 0) ");
			
				PreparedStatement pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1, board.getBoardSubject());
				pstmt.setString(2, board.getBoardContent());
				pstmt.setString(3, board.getUserId());
				pstmt.setString(4, board.getFileName());
				pstmt.setString(5, board.getCategoryId());
				
				return pstmt;
			}
		});
	}

}
