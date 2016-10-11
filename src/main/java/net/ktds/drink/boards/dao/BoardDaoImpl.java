package net.ktds.drink.boards.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import net.ktds.drink.boards.vo.BoardVO;
import net.ktds.drink.boards.vo.SearchBoardVO;
import net.ktds.drink.support.DaoSupport;
import net.ktds.drink.support.Query;
import net.ktds.drink.support.QueryAndResult;

public class BoardDaoImpl extends DaoSupport implements BoardDao{

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
