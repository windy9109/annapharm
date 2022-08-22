package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;


import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.AnnapharmInVO;
import kr.or.annapharm.dto.BoardVO;
import kr.or.annapharm.dto.ReplyVO;

public class AnnapharmInDAOImpl implements AnnapharmInDAO {

	private SqlSession session;
	private AnnapharmInDAO annapharmInDAO;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	public void setAnnapharmIndDAO(AnnapharmInDAO annapharmInDAO) {
		this.annapharmInDAO = annapharmInDAO;
	}


	@Override
	public List<AnnapharmInVO> SelectSearchAnnapharmInList(/* SqlSession session, */ SearchCriteria cri) {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();

		System.out.println("offset : " + offset);
		System.out.println("limit : " + limit);

		RowBounds rowBounds = new RowBounds(offset,limit);

		List<AnnapharmInVO> list = session.selectList("AnnapharmIn-Mapper.selectSearchAnnapharmInList", cri, rowBounds);

		return list;
	}

	@Override
	public int selectAnnapharmInCriteriaTotalCount(/* SqlSession session, */ SearchCriteria cri) throws SQLException {
		int AnnapharmInCount = session.selectOne("AnnapharmIn-Mapper.selectSearchAnnapharmInListCount",cri);
		return AnnapharmInCount;
	}




	@Override
	public AnnapharmInVO selectAnnapharmInByBno(/* SqlSession session, */ int chemistInCode) throws SQLException {
		AnnapharmInVO AnnapharmIn=session.selectOne("AnnapharmIn-Mapper.selectAnnapharmInByBno",chemistInCode);
		return AnnapharmIn;
	}


	@Override
	public AnnapharmInVO insertAnnapharmIn(/* SqlSession session, */ AnnapharmInVO AnnapharmIn) throws SQLException {
		session.update("AnnapharmIn-Mapper.insertAnnapharmIn",AnnapharmIn);
		return AnnapharmIn;
	}

	@Override
	public void updateAnnapharmIn(/* SqlSession session, */ AnnapharmInVO AnnapharmIn) throws SQLException {
		session.update("AnnapharmIn-Mapper.updateAnnapharmIn",AnnapharmIn);

	}

	@Override
	public void deleteAnnapharmIn(/* SqlSession session, */ int chemistInCode) throws SQLException {
		session.update("AnnapharmIn-Mapper.deleteAnnapharmIn",chemistInCode);

	}

	@Override
	public void increaseViewCnt(/* SqlSession session, */ int chemistInCode) throws SQLException {
		session.update("AnnapharmIn-Mapper.increaseViewCnt",chemistInCode);

	}

	@Override
	public int selectAnnapharmInSeqNext(/* SqlSession session */) throws SQLException {
		int seq_num=session.selectOne("AnnapharmIn-Mapper.selectAnnapharmInSeqNext");
		return seq_num;
	}

	@Override
	public void selection(ReplyVO cheInAns) throws SQLException {
		session.update("AnnapharmIn-Mapper.selection", cheInAns);

	}

	@Override
	public void selection2(ReplyVO cheInAns) throws SQLException {
		session.update("AnnapharmIn-Mapper.selection2", cheInAns);

	}

	@Override
	public List<AnnapharmInVO> selectSearchAnnapharmInList_myList_p(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();

		System.out.println("offset : " + offset);
		System.out.println("limit : " + limit);

		RowBounds rowBounds = new RowBounds(offset,limit);

		List<AnnapharmInVO> list = session.selectList("AnnapharmIn-Mapper.selectSearchAnnapharmInList_myList_p", cri, rowBounds);

		return list;
	}

	@Override
	public AnnapharmInVO selectAnnapharmIn_main01() throws SQLException {
		AnnapharmInVO AnnapharmIn=session.selectOne("AnnapharmIn-Mapper.selectAnnapharmIn_main01");
		return AnnapharmIn;
	}

	@Override
	public AnnapharmInVO selectAnnapharmIn_main02() throws SQLException {
		AnnapharmInVO AnnapharmIn=session.selectOne("AnnapharmIn-Mapper.selectAnnapharmIn_main02");
		return AnnapharmIn;
	}

	@Override
	public AnnapharmInVO selectAnnapharmIn_main03() throws SQLException {
		AnnapharmInVO AnnapharmIn=session.selectOne("AnnapharmIn-Mapper.selectAnnapharmIn_main03");
		return AnnapharmIn;
	}

	@Override
	public AnnapharmInVO selectAnnapharmIn_main04() throws SQLException {
		AnnapharmInVO AnnapharmIn=session.selectOne("AnnapharmIn-Mapper.selectAnnapharmIn_main04");
		return AnnapharmIn;
	}


	/*
	 * @Override public AnnapharmInVO selectAnnapharmInByImage(String imageFile)
	 * throws SQLException { AnnapharmInVO AnnapharmIn =
	 * session.selectOne("Board-Mapper.selectBoardByImage",imageFile);
	 *
	 * return AnnapharmIn; }
	 */





}
