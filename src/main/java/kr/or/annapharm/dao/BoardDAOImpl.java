package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.jsp.dto.NoticeVO;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.BoardVO;

public class BoardDAOImpl implements BoardDAO {

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<BoardVO> SelectSearchBoardList(SearchCriteria cri) {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();

		System.out.println("offset : " + offset);
		System.out.println("limit : " + limit);

		RowBounds rowBounds = new RowBounds(offset,limit);

		List<BoardVO> list = session.selectList("Board-Mapper.selectSearchBoardList", cri, rowBounds);

		return list;
	}

	@Override
	public int selectBoardCriteriaTotalCount(SearchCriteria cri) throws SQLException {
		int boardCount = session.selectOne("Board-Mapper.selectSearchBoardListCount",cri);
		return boardCount;
	}

	@Override
	public int selectBoardSequenceNextValue() throws SQLException {
		return session.selectOne("Board-Mapper.selectBoardSequenceNextValue");
	}

	@Override
	public int insertBoard(BoardVO board) throws SQLException {
		return session.update("Board-Mapper.insertBoard",board);
	}

	@Override
	public BoardVO selectBoardByboardCode(int boardCode) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Board-Mapper.selectBoardByboardCode",boardCode);
	}

	@Override
	public void increaseViewCount(int boardCode) throws SQLException {
		// TODO Auto-generated method stub
		session.update("Board-Mapper.increaseViewCount",boardCode);
	}


}
