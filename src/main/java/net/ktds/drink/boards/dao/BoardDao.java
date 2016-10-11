package net.ktds.drink.boards.dao;

import java.util.List;

import net.ktds.drink.boards.vo.BoardVO;
import net.ktds.drink.boards.vo.SearchBoardVO;

public interface BoardDao {
	
	public List<BoardVO> getBoardLists(SearchBoardVO searchBoard);
	
}
