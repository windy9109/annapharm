package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.annapharm.command.Criteria;
import kr.or.annapharm.command.PageMaker;
import kr.or.annapharm.dao.MemberDAO;
import kr.or.annapharm.dao.ReplyDAO;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.ReplyVO;



public class ReplyServiceImpl implements ReplyService {

	private SqlSessionFactory sqlSessionFactory;
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	private ReplyDAO replyDAO;
	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}

	private MemberDAO memberDAO;
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public Map<String, Object> getReplyList(int chemistInCode, MemberVO mavo, Criteria cri) throws SQLException {
		/* SqlSession session = sqlSessionFactory.openSession(); */

		Map<String, Object> dataMap = new HashMap<String, Object>();

		try {
			List<ReplyVO> replyList = replyDAO.selectReplyListPage(/* session, */ chemistInCode, mavo, cri);

//			if(replyList != null) for(ReplyVO reply : replyList) {
//					MemberVO member = memberDAO.selectMemberById(/* session, */ reply.getChemistCode());
//			}

		int count = replyDAO.countReply(/* session, */chemistInCode);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);

			dataMap.put("replyList", replyList);
			dataMap.put("pageMaker", pageMaker);

			return dataMap;

		}finally{
			/* session.close(); */
		}

	}

	@Override
	public int getReplyListCount(int chemist_in_code) throws SQLException {
		/* SqlSession session = sqlSessionFactory.openSession(); */
		try {
			int count = replyDAO.countReply(/* session, */ chemist_in_code);
			return count;
		} finally {
			/* session.close(); */
		}
	}

	@Override
	public void registReply(ReplyVO reply, MemberVO mavo) throws SQLException {
		/* SqlSession session = sqlSessionFactory.openSession(); */
		try {
			int chemistAnsCode = replyDAO.selectReplySeqNextValue(/* session */);
			reply.setChemistAnsCode(chemistAnsCode);
			reply.setChemistCode(mavo.getChemistCode());

			replyDAO.insertReply(/* session, */reply);
		} finally {
			/* session.close(); */
		}


	}

	@Override
	public void modifyReply(ReplyVO reply) throws SQLException {
		/* SqlSession session = sqlSessionFactory.openSession(); */
		try {

			replyDAO.updateReply(/* session, */reply);
		} finally {
			/* session.close(); */
		}
	}

	@Override
	public void removeReply(int chemist_ans_code) throws SQLException {
		/* SqlSession session = sqlSessionFactory.openSession(); */
		try {

			replyDAO.deleteReply(/* session, */chemist_ans_code);
		} finally {
			/* session.close(); */
		}

	}







	@Override
	public int CheckCheInRecom(ReplyVO reply) throws SQLException {
		try {
			int count = replyDAO.CheckCheInRecom(/* session, */reply);
			return count;
		} finally {
			/* session.close(); */
		}
	}

	@Override
	public int selectCheInRecom(ReplyVO reply) throws SQLException {
		try {
			int count = replyDAO.selectCheInRecom(/* session, */reply);
			return count;
		} finally {
			/* session.close(); */
		}
	}

	@Override
	public void insertCheInRecom(ReplyVO reply) throws SQLException {
		try {
			replyDAO.insertCheInRecom(/* session, */reply);
		} finally {
			/* session.close(); */
		}

	}

	@Override
	public void deleteCheInRecom(ReplyVO reply) throws SQLException {
		try {
			replyDAO.deleteCheInRecom(/* session, */reply);
		} finally {
			/* session.close(); */
		}

	}

	@Override
	public Map<String, Object> getReplyList(int chemistInCode, Criteria cri) throws SQLException {
		/* SqlSession session = sqlSessionFactory.openSession(); */

		Map<String, Object> dataMap = new HashMap<String, Object>();

		try {
			List<ReplyVO> replyList = replyDAO.selectReplyListPage(/* session, */ chemistInCode, cri);

//			if(replyList != null) for(ReplyVO reply : replyList) {
//					MemberVO member = memberDAO.selectMemberById(/* session, */ reply.getChemistCode());
//			}

		int count = replyDAO.countReply(/* session, */chemistInCode);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);

			dataMap.put("replyList", replyList);
			dataMap.put("pageMaker", pageMaker);

			return dataMap;

		}finally{
			/* session.close(); */
		}
	}

}
