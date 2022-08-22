package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.BoardVO;

public interface BoardDAO {

	public List<BoardVO> SelectSearchBoardList(SearchCriteria cri) throws SQLException;

	public int selectBoardCriteriaTotalCount(SearchCriteria cri) throws SQLException;

	public int selectBoardSequenceNextValue() throws SQLException;

	public int insertBoard(BoardVO board) throws SQLException;

	public BoardVO selectBoardByboardCode(int boardCode) throws SQLException;

	public void increaseViewCount(int boardCode) throws SQLException;

}
