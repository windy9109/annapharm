package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.annapharm.command.InsertRetrieveCommand;
import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.RetrieveListVO;

public interface RetrieveService {

	public Map<String, Object> getRetrieveProductList(SearchCriteria cri) throws SQLException;

	public int selectRetrieveNo() throws SQLException;

	public int insertRetrieve(InsertRetrieveCommand insertRetrieveCommand) throws SQLException;

	public int insertRetrieveList(InsertRetrieveCommand insertRetrieveCommand) throws SQLException;

	public int updateProductNum(InsertRetrieveCommand insertRetrieveCommand) throws SQLException;

	public int selectMaxRetrieveNo() throws SQLException;

	public int zeroProductDelete(InsertRetrieveCommand insertRetrieveCommand) throws SQLException;

	public Map<String, Object> getRetrieveList(SearchCriteria cri) throws SQLException;

	public List<RetrieveListVO> getRetriveDetail(String retrieveNo) throws SQLException;

}
