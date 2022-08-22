package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.command.InsertRetrieveCommand;
import kr.or.annapharm.command.RetrieveCommand;
import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.ProductVO;
import kr.or.annapharm.dto.RetrieveListVO;

public class RetrieveDAOImpl implements RetrieveDAO{

private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<ProductVO> selectRetrieveProductList(SearchCriteria cri) throws SQLException {
		return session.selectList("Retrieve-Mapper.selectRetrieveProductList", cri);
	}

	@Override
	public int selectSearchRetrieveProductListCount(SearchCriteria cri) throws SQLException {
		return session.selectOne("Retrieve-Mapper.selectSearchRetrieveProductListCount", cri);
	}

	@Override
	public int selectRetrieveNo() throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Retrieve-Mapper.selectRetrieveNo");
	}

	@Override
	public int insertRetrieve(InsertRetrieveCommand insertRetrieveCommand) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("Retrieve-Mapper.insertRetrieve",insertRetrieveCommand);
	}

	@Override
	public int insertRetrieveList(InsertRetrieveCommand insertRetrieveCommand) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("Retrieve-Mapper.insertRetrieveList",insertRetrieveCommand);
	}

	@Override
	public int updateProductNum(InsertRetrieveCommand insertRetrieveCommand) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("Retrieve-Mapper.updateProductNum",insertRetrieveCommand);
	}

	@Override
	public int selectMaxRetrieveNo() throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Retrieve-Mapper.selectMaxRetrieveNo");
	}

	@Override
	public int zeroProductDelete(InsertRetrieveCommand insertRetrieveCommand) throws SQLException{
		// TODO Auto-generated method stub
		return session.selectOne("Retrieve-Mapper.zeroProductDelete",insertRetrieveCommand);
	}

	@Override
	public List<RetrieveCommand> selectRetrieveList(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds row = new RowBounds(offset, limit);

		System.out.println("크리 다오 : " + cri);

		return session.selectList("Retrieve-Mapper.selectRetrieveList",cri, row);
	}

	@Override
	public int selectSearchRetrieveListCount(SearchCriteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Retrieve-Mapper.selectSearchRetrieveListCount",cri);
	}

	@Override
	public List<RetrieveListVO> selectRetrieveListDetail(String retrieveNo) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("Retrieve-Mapper.selectRetrieveListDetail",retrieveNo);
	}



}
