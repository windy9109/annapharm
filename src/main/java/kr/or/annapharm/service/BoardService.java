package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.BoardVO;

public interface BoardService {

	public Map<String, Object> getBoardList(SearchCriteria cri) throws SQLException;

	public void regist(BoardVO board) throws SQLException;

	public BoardVO read(int boardCode) throws SQLException;

	public BoardVO getBoard(int boardCode) throws SQLException;
}
