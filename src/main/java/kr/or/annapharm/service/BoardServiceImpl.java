package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jsp.dto.NoticeVO;

import kr.or.annapharm.command.PageMaker;
import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dao.BoardDAO;
import kr.or.annapharm.dto.BoardVO;

public class BoardServiceImpl implements BoardService {

	private BoardDAO boardDAO;

	public void setBoardDAO(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
	}

	@Override
	public Map<String, Object> getBoardList(SearchCriteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		System.out.println("cri page : " + cri.getPage());

		List<BoardVO> boardList = boardDAO.SelectSearchBoardList(cri);

		int totalCount = boardDAO.selectBoardCriteriaTotalCount(cri);

		System.out.println("boardList :" + boardList.size());
		System.out.println("totalCount :" + totalCount);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("boardList", boardList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public void regist(BoardVO board) throws SQLException {
		int bno = boardDAO.selectBoardSequenceNextValue();
		board.setBoardCode(bno);
		boardDAO.insertBoard(board);
	}

	@Override
	public BoardVO getBoard(int boardCode) throws SQLException {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardByboardCode(boardCode);
	}

	@Override
	public BoardVO read(int boardCode) throws SQLException {
		boardDAO.increaseViewCount(boardCode);
		return boardDAO.selectBoardByboardCode(boardCode);
	}



}
