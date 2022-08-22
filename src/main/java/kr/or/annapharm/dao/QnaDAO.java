package kr.or.annapharm.dao;

import java.util.List;

import kr.or.annapharm.dto.QnaVO;

public interface QnaDAO {

	public List<QnaVO> selectQnaList() throws Exception;
}
