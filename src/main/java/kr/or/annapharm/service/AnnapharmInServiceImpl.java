package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;



import kr.or.annapharm.command.PageMaker;
import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dao.AnnapharmInDAO;
import kr.or.annapharm.dao.ReplyDAO;
import kr.or.annapharm.dto.AnnapharmInVO;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.ReplyVO;

public class AnnapharmInServiceImpl implements AnnapharmInService {


	private AnnapharmInDAO annapharmInDAO;

	private SqlSessionFactory sqlSessionFactory;
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	public void setAnnapharmInDAO(AnnapharmInDAO annapharmInDAO) {
		this.annapharmInDAO = annapharmInDAO;
	}

	private ReplyDAO replyDAO;
	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}




	@Override
	public Map<String, Object> getAnnapharmInList(SearchCriteria cri) throws SQLException {

		/* SqlSession session = sqlSessionFactory.openSession(); */


		Map<String, Object> dataMap = new HashMap<String, Object>();

		System.out.println("cri page : " + cri.getPage());

		List<AnnapharmInVO> annapharmInList = annapharmInDAO.SelectSearchAnnapharmInList(/* session, */ cri);


		// reply count 입력
//		if(annapharmInList!=null) for (AnnapharmInVO annapharmIn : annapharmInList) {
//				int replycnt = replyDAO.countReply(/* session, */ annapharmIn.getChemist_in_code());
//			annapharmIn.setChemist_in_reply_cnt(replycnt);
//		}


		int totalCount = annapharmInDAO.selectAnnapharmInCriteriaTotalCount(/* session, */ cri);

		System.out.println("annapharmInList :" + annapharmInList.size());
		System.out.println("totalCount :" + totalCount);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("annapharmInList", annapharmInList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public AnnapharmInVO getAnnapharmIn(int chemistInCode) throws SQLException {
		/* SqlSession session = sqlSessionFactory.openSession(); */

		AnnapharmInVO AnnapharmIn = annapharmInDAO.selectAnnapharmInByBno(/* session, */ chemistInCode);
		annapharmInDAO.increaseViewCnt(/* session, */ chemistInCode);
		return AnnapharmIn;
	}

	@Override
	public AnnapharmInVO getAnnapharmInForModify(int chemistInCode) throws SQLException {
		/* SqlSession session = sqlSessionFactory.openSession(); */


		AnnapharmInVO AnnapharmIn = annapharmInDAO.selectAnnapharmInByBno(/* session, */ chemistInCode);
		return AnnapharmIn;
	}



	@Override
	public AnnapharmInVO regist(AnnapharmInVO AnnapharmIn, MemberVO mavo) throws SQLException {
		/* SqlSession session = sqlSessionFactory.openSession(); */


		int chemistInCode = annapharmInDAO.selectAnnapharmInSeqNext(/* session */);

		AnnapharmIn.setChemistInCode(""+chemistInCode);
		AnnapharmIn.setPatientCode(mavo.getPatientCode());
		AnnapharmIn.setChemistInWriter(mavo.getMemId());

		annapharmInDAO.insertAnnapharmIn(/* session, */ AnnapharmIn);
		return AnnapharmIn;

	}

	@Override
	public void modify(AnnapharmInVO AnnapharmIn) throws SQLException {
		/* SqlSession session = sqlSessionFactory.openSession(); */
		annapharmInDAO.updateAnnapharmIn(/* session, */ AnnapharmIn);

	}

	@Override
	public void remove(int chemistInCode) throws SQLException {
		/* SqlSession session = sqlSessionFactory.openSession(); */
		annapharmInDAO.deleteAnnapharmIn(/* session, */ chemistInCode);

	}

	@Override
	public void selection(ReplyVO cheInAns) throws SQLException {
		// TODO Auto-generated method stub
		annapharmInDAO.selection(/* session, */ cheInAns);
	}

	@Override
	public void selection2(ReplyVO cheInAns) throws SQLException {
		// TODO Auto-generated method stub
		annapharmInDAO.selection2(/* session, */ cheInAns);
	}

	@Override
	public Map<String, Object> getAnnapharmInList_myList_p(SearchCriteria cri) throws SQLException {
		/* SqlSession session = sqlSessionFactory.openSession(); */


		Map<String, Object> dataMap = new HashMap<String, Object>();

		System.out.println("cri page : " + cri.getPage());

		List<AnnapharmInVO> annapharmInList = annapharmInDAO.selectSearchAnnapharmInList_myList_p(/* session, */ cri);


		// reply count 입력
//		if(annapharmInList!=null) for (AnnapharmInVO annapharmIn : annapharmInList) {
//				int replycnt = replyDAO.countReply(/* session, */ annapharmIn.getChemist_in_code());
//			annapharmIn.setChemist_in_reply_cnt(replycnt);
//		}


		int totalCount = annapharmInDAO.selectAnnapharmInCriteriaTotalCount(/* session, */ cri);

		System.out.println("annapharmInList :" + annapharmInList.size());
		System.out.println("totalCount :" + totalCount);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("annapharmInList", annapharmInList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public AnnapharmInVO selectAnnapharmIn_main01() throws SQLException {
		return annapharmInDAO.selectAnnapharmIn_main01();
	}

	@Override
	public AnnapharmInVO selectAnnapharmIn_main02() throws SQLException {
		return annapharmInDAO.selectAnnapharmIn_main02();
	}

	@Override
	public AnnapharmInVO selectAnnapharmIn_main03() throws SQLException {
		return annapharmInDAO.selectAnnapharmIn_main03();
	}

	@Override
	public AnnapharmInVO selectAnnapharmIn_main04() throws SQLException {
		return annapharmInDAO.selectAnnapharmIn_main04();
	}




}
