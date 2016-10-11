package net.ktds.drink.boards.biz;

import net.ktds.drink.boards.vo.BoardListVO;
import net.ktds.drink.boards.vo.BoardVO;
import net.ktds.drink.boards.vo.SearchBoardVO;

public interface BoardBiz {
	
	public boolean addBoard(BoardVO board);
	
	public BoardListVO getBoardListsOf(SearchBoardVO searchBoard);

	public BoardVO getBoardAt(String boardId);
	
}
