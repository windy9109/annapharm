package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.AnnapharmInVO;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.ReplyVO;

public interface AnnapharmInService {

	public Map<String, Object> getAnnapharmInList(SearchCriteria cri) throws SQLException;

	public Map<String, Object> getAnnapharmInList_myList_p(SearchCriteria cri) throws SQLException;


	// 상세보기
	AnnapharmInVO getAnnapharmIn(int chemistInCode)throws SQLException;

	AnnapharmInVO getAnnapharmInForModify(int chemistInCode)throws SQLException;

	// 등록
	AnnapharmInVO regist(AnnapharmInVO AnnapharmIn, MemberVO mavo)throws SQLException;

	// 수정
	void modify(AnnapharmInVO AnnapharmIn)throws SQLException;

	// 삭제
	void remove(int bno)throws SQLException;

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
