package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.annapharm.command.Criteria;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.ReplyVO;


public interface ReplyService {


	//리스트보기
	Map<String,Object> getReplyList(int chemistInCode, MemberVO mavo,  Criteria cri)	throws SQLException;

	//리스트보기2
	Map<String,Object> getReplyList(int chemistInCode,  Criteria cri)	throws SQLException;


	//리스트 개수
	int getReplyListCount(int chemistInCode)throws SQLException;

	//등록
	void registReply(ReplyVO reply, MemberVO mavo)throws SQLException;

	//수정
	void modifyReply(ReplyVO reply)throws SQLException;

	//삭제
	void removeReply(int chemistAnsCode)throws SQLException;


	//좋아요 존재여부체크
	int CheckCheInRecom(ReplyVO reply)throws SQLException;

	//해당답변 좋아요갯수
	int selectCheInRecom(ReplyVO reply)throws SQLException;


	//좋아요 insert
	void insertCheInRecom(ReplyVO reply)throws SQLException;


	//좋아요 delete
	void deleteCheInRecom(ReplyVO reply)throws SQLException;


}



