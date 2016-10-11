package net.ktds.drink.boards.biz;

import java.util.List;

import net.ktds.drink.boards.dao.BoardDao;
import net.ktds.drink.boards.dao.BoardDaoImpl;
import net.ktds.drink.boards.vo.BoardListVO;
import net.ktds.drink.boards.vo.BoardVO;
import net.ktds.drink.boards.vo.SearchBoardVO;
import net.ktds.drink.support.pager.Pager;
import net.ktds.drink.support.pager.PagerFactory;

public class BoardBizImpl implements BoardBiz{

	private BoardDao boardDao;
		
	public BoardBizImpl() {
		boardDao = new BoardDaoImpl();
	}
	
	@Override
	public boolean addBoard(BoardVO board) {
		return boardDao.insert(board) > 0;
	}

	@Override
	public BoardListVO getBoardListsOf(SearchBoardVO searchBoard) {
		int totalCount = boardDao.getCountOfBoards(searchBoard);
		Pager pager = PagerFactory.getPager(true, 10, 5);
		pager.setTotalArticleCount(totalCount);
		pager.setPageNumber(searchBoard.getPageNo());

		searchBoard.setStartRowNumber(pager.getStartArticleNumber());
		searchBoard.setEndRowNumber(pager.getEndArticleNumber());
		
		List<BoardVO> boards = boardDao.selectBoards(searchBoard);
		BoardListVO boardList = new BoardListVO();
		boardList.setPager(pager);
		boardList.setBoardLists(boards);
		
		return boardList;
	}

	@Override
	public BoardVO getBoardAt(String boardId) {
		return boardDao.selectBoard(boardId);
	}
	
}
