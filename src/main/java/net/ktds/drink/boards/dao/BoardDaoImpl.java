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
	public List<BoardVO> selectBoardLists(SearchBoardVO searchBoard) {
		@SuppressWarnings("unchecked")
		List<BoardVO> lists = (List<BoardVO>) selectList(new QueryAndResult(){

			@Override
			public PreparedStatement query(Connection conn) throws SQLException {
				StringBuffer query = new StringBuffer();
				query.append(" SELECT	B.BRD_ID ");
				query.append(" 			, B.BRD_SBJ ");
				query.append(" 			, B.BRD_CONT ");
				query.append(" 			, U.USR_ID ");
				query.append(" 			, U.USR_NICK_NM ");
				query.append(" 			, TO_CHAR(B.CRT_DT) ");
				query.append(" 			, B.FILE_NM ");
				query.append(" 			, B.CTGR_ID ");
				query.append(" 			, B.MDFY_DT ");
				query.append(" 			, B.HIT_CNT ");
				query.append(" 			, B.RCMD_CNT ");
				query.append(" FROM		BOARD B ");
				query.append(" 			, USR U ");
				query.append(" WHERE	B.USR_ID = U.USR_ID ");
				
				if (searchBoard.getSearchType() == 1) {
					query.append(" AND ( B.BRD_SBJ LIKE '%' || ? || '%' ");
					query.append(" OR 	B.BRD_CONT LIKE '%' || ? || '%' ) ");
				}
				else if (searchBoard.getSearchType() == 2) {
					query.append(" AND	B.BRD_SBJ LIKE '%' || ? || '%' ");
				}
				else if (searchBoard.getSearchType() == 3) {
					query.append(" AND	B.BRD_CONT LIKE '%' || ? || '%' ");
				}
				else if (searchBoard.getSearchType() == 4) {
					query.append(" AND	U.USR_NICK_NM LIKE '%' || ? || '%' ");
				}
				
				return null;
			}

			@Override
			public Object makeObject(ResultSet rs) throws SQLException {
				
				return null;
			}
			
		});
		return null;
	}

	@Override
	public int updateBoard(BoardVO board) {
		return insert(new Query() {
			
			@Override
			public PreparedStatement query(Connection conn) throws SQLException {
				StringBuffer query = new StringBuffer();
				query.append( " UPDATE	BOARD " );
				query.append( " SET		MDFY_DT = SYSDATE " );
				if ( board.getBoardSubject() != null ) {
					query.append( " , BRD_SBJ = ? " );
				}
				if ( board.getBoardContent() != null ) {
					query.append( " , BRD_CONT = ? " );
				}
				if ( board.getBoardSubject() != null ) {
					query.append( " , FILE_NM = ? " );
				}
				query.append(" WHERE	BRD_ID ");
				
				PreparedStatement pstmt = conn.prepareStatement(query.toString());
				
				int index = 1;
				if ( board.getBoardSubject() != null ) {
					query.append( " , BRD_SBJ = ? " );
					pstmt.setString(index++, board.getBoardSubject());
				}
				if ( board.getBoardContent() != null ) {
					query.append( " , BRD_CONT = ? " );
					pstmt.setString(index++, board.getBoardContent());
				}
				if ( board.getBoardSubject() != null ) {
					query.append( " , FILE_NM = ? " );
					pstmt.setString(index++, board.getFileName());
				}
				
				pstmt.setString(index++, board.getBoardId());
				return pstmt;
			}
		});
	}


}

	
