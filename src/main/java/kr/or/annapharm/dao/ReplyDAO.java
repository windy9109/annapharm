package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.command.Criteria;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.ReplyVO;



public interface ReplyDAO {

	void insertReply(/* SqlSession session, */ReplyVO reply)throws SQLException;

	void updateReply(/* SqlSession session, */ReplyVO reply)throws SQLException;

	void deleteReply(/* SqlSession session, */int rno)throws SQLException;

	int selectReplySeqNextValue(/* SqlSession session */)throws SQLException;

	List<ReplyVO> selectReplyListPage(/* SqlSession session, */int bno, MemberVO mavo, Criteria cri)
																throws SQLException;

	List<ReplyVO> selectReplyListPage(/* SqlSession session, */int bno, Criteria cri)
			throws SQLException;


	int countReply(/* SqlSession session, */ int bno) throws SQLException;


	//좋아요 존재여부체크
	int CheckCheInRecom(ReplyVO reply)throws SQLException;

	//해당답변 좋아요갯수
	int selectCheInRecom(ReplyVO reply)throws SQLException;


	//좋아요 insert
	void insertCheInRecom(ReplyVO reply)throws SQLException;


	//좋아요 delete
	void deleteCheInRecom(ReplyVO reply)throws SQLException;


}




