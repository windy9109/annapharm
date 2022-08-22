package kr.or.annapharm.service;

import java.util.List;

import kr.or.annapharm.dto.QnaVO;

public interface QnaService {

	public List<QnaVO> getQnaList() throws Exception;
}
