package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.AnnapharmInVO;
import kr.or.annapharm.dto.BoardVO;
import kr.or.annapharm.dto.ReplyVO;

public interface AnnapharmInDAO {

	public List<AnnapharmInVO> SelectSearchAnnapharmInList(	/* SqlSession session, */ SearchCriteria cri) throws SQLException;

	public List<AnnapharmInVO> selectSearchAnnapharmInList_myList_p(	/* SqlSession session, */ SearchCriteria cri) throws SQLException;

	public int selectAnnapharmInCriteriaTotalCount(/* SqlSession session, */ SearchCriteria cri) throws SQLException;


	AnnapharmInVO selectAnnapharmInByBno(/* SqlSession session, */ int chemistInCode) throws SQLException;

//	AnnapharmInVO selectAnnapharmInByImage ( String imageFile) throws SQLException;

	AnnapharmInVO insertAnnapharmIn(/* SqlSession session, */ AnnapharmInVO AnnapharmIn) throws SQLException;

	void updateAnnapharmIn(/* SqlSession session, */ AnnapharmInVO AnnapharmIn) throws SQLException;

	void deleteAnnapharmIn(/* SqlSession session, */ int chemistInCode) throws SQLException;


	void increaseViewCnt(/* SqlSession session, */ int chemistInCode) throws SQLException;

	int selectAnnapharmInSeqNext(/* SqlSession session */) throws SQLException;

	void selection(/* SqlSession session, */ ReplyVO cheInAns) throws SQLException;

	void selection2(/* SqlSession session, */ ReplyVO cheInAns) throws SQLException;


	//오늘중 카운터수 가장 높은 질문
	AnnapharmInVO selectAnnapharmIn_main01()throws SQLException;

	//전체에서 카운터수 가장 높은 질문
	AnnapharmInVO selectAnnapharmIn_main02()throws SQLException;

	//아하! 그렇구나! 성분에서 카운터가 가장 높은 질문
	AnnapharmInVO selectAnnapharmIn_main03()throws SQLException;

	//new 복약지도 새글
	AnnapharmInVO selectAnnapharmIn_main04()throws SQLException;

}
