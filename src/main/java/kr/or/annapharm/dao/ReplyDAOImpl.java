package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.command.Criteria;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.ReplyVO;



public class ReplyDAOImpl implements ReplyDAO {



	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertReply(/* SqlSession session, */ ReplyVO reply) throws SQLException {

		session.update("Reply-Mapper.insertReply",reply);
	}

	@Override
	public void updateReply(/* SqlSession session, */ ReplyVO reply) throws SQLException {
		session.update("Reply-Mapper.updateReply",reply);
	}

	@Override
	public void deleteReply(/* SqlSession session, */ int rno) throws SQLException {
		session.update("Reply-Mapper.deleteReply",rno);

	}

	@Override
	public int selectReplySeqNextValue(/* SqlSession session */) throws SQLException {
		int rno=(Integer)session.selectOne("Reply-Mapper.selectReplySeqNextValue");
		return rno;
	}

	@Override
	public List<ReplyVO> selectReplyListPage(/* SqlSession session, */ int bno, MemberVO mavo, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);

		//System.out.println(bno+"코드으~~~~~~~~!!");
		//System.out.println(mavo.getChemistInCode()+"코드으~~~~~~~~");

		List<ReplyVO> replyList=session.selectList("Reply-Mapper.selectReplyList",mavo,rowBounds);
		return replyList;
	}

	@Override
	public int countReply(/* SqlSession session, */ int bno) throws SQLException {
		int count=session.selectOne("Reply-Mapper.countReply",bno);
		return count;
	}




	@Override
	public int CheckCheInRecom(ReplyVO reply) throws SQLException {
		int count=session.selectOne("Reply-Mapper.CheckCheInRecom",reply);
		return count;
	}

	@Override
	public int selectCheInRecom(ReplyVO reply) throws SQLException {
		int count=session.selectOne("Reply-Mapper.selectCheInRecom",reply);
		return count;
	}

	@Override
	public void insertCheInRecom(ReplyVO reply) throws SQLException {
		session.selectOne("Reply-Mapper.insertCheInRecom",reply);
	}

	@Override
	public void deleteCheInRecom(ReplyVO reply) throws SQLException {
		session.selectOne("Reply-Mapper.deleteCheInRecom",reply);
	}

	@Override
	public List<ReplyVO> selectReplyListPage(int bno, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);


		List<ReplyVO> replyList=session.selectList("Reply-Mapper.selectReplyList2",bno,rowBounds);
		return replyList;
	}

}
