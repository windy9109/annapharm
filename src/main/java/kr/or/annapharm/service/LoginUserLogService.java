package kr.or.annapharm.service;

import java.util.List;

import kr.or.annapharm.dto.LoginUserLogVO;


public interface LoginUserLogService {

	public void write(List<LoginUserLogVO> logVO)throws Exception;
	
	
}
