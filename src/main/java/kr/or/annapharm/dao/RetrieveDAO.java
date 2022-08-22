package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.annapharm.command.InsertRetrieveCommand;
import kr.or.annapharm.command.RetrieveCommand;
import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.ProductVO;
import kr.or.annapharm.dto.RetrieveListVO;

public interface RetrieveDAO {
	public List<ProductVO> selectRetrieveProductList(SearchCriteria cri) throws SQLException;

 	public int selectSearchRetrieveProductListCount(SearchCriteria cri) throws SQLException;

 	public int selectRetrieveNo() throws SQLException;

 	public int insertRetrieve(InsertRetrieveCommand insertRetrieveCommand) throws SQLException;

 	public int insertRetrieveList(InsertRetrieveCommand insertRetrieveCommand) throws SQLException;

 	public int updateProductNum(InsertRetrieveCommand insertRetrieveCommand) throws SQLException;

 	public int selectMaxRetrieveNo() throws SQLException;

 	public int zeroProductDelete(InsertRetrieveCommand insertRetrieveCommand) throws SQLException;

 	public List<RetrieveCommand> selectRetrieveList(SearchCriteria cri) throws SQLException;

 	public int selectSearchRetrieveListCount(SearchCriteria cri) throws SQLException;

 	public List<RetrieveListVO> selectRetrieveListDetail(String retrieveNo) throws SQLException;
}
