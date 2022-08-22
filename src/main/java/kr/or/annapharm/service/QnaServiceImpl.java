package kr.or.annapharm.service;

import java.util.List;

import kr.or.annapharm.dao.QnaDAO;
import kr.or.annapharm.dto.QnaVO;

public class QnaServiceImpl implements QnaService {

	private QnaDAO qnaDAO;
	public void setQnaDAO(QnaDAO qnaDAO) {
		this.qnaDAO = qnaDAO;
	}

	@Override
	public List<QnaVO> getQnaList() throws Exception {
		return qnaDAO.selectQnaList();
	}

}
