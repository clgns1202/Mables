package net.ktds.drink.boards.biz;

import net.ktds.drink.boards.dao.BoardDao;
import net.ktds.drink.boards.dao.BoardDaoImpl;
import net.ktds.drink.boards.vo.BoardVO;

public class BoardBizImpl implements BoardBiz{

		private BoardDao boardDao;
		
		public BoardBizImpl() {
			boardDao = new BoardDaoImpl();
		}
	@Override
	public boolean addBoard(BoardVO board) {
		return boardDao.insert(board) > 0;
	}

}
