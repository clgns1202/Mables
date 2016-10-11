package net.ktds.drink.boards.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.sql.SQLException;


import net.ktds.drink.boards.vo.BoardVO;
import net.ktds.drink.boards.vo.SearchBoardVO;
import net.ktds.drink.support.DaoSupport;
import net.ktds.drink.support.Query;
import net.ktds.drink.support.QueryAndResult;

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

	@Override
	public List<BoardVO> getBoardLists(SearchBoardVO searchBoard) {
		@SuppressWarnings("unchecked")
		List<BoardVO> lists = (List<BoardVO>)selectList (new QueryAndResult(){

			@Override
			public PreparedStatement query(Connection conn) throws SQLException {
				StringBuffer query = new StringBuffer();
				query.append(" SELECT	B.BRD_ID ");
				query.append(" 			, B.BRD_SBJ ");
				query.append(" 			, B.BRD_CONT ");
				query.append(" 			, U.USR_ID ");
				query.append(" 			, B.CRT_DT ");
				query.append(" 			, B.FILE_NM ");
				query.append(" 			, B.CTGR_ID ");
				query.append(" 			, B.MDFY_DT ");
				query.append(" 			, B.HIT_CNT ");
				query.append(" 			, B.RCMD_CNT ");
				query.append(" FROM		BOARD B ");
				query.append(" 			, USR U ");
				query.append(" WHERE	B.USR_ID = U.USR_ID ");
				
				return null;
			}

			@Override
			public Object makeObject(ResultSet rs) throws SQLException {
				
				return null;
			}
			
		});
		return null;
	}


}

	
