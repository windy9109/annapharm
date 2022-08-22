package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.ProductCommandVO;
import kr.or.annapharm.dto.ProductVO;


public class ProductDAOImpl implements ProductDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ProductVO> selectProductCriteria(SearchCriteria cri) throws SQLException {
		return session.selectList("Product-Mapper.selectProductList", cri);
	}
	
	@Override
	public int selectProductCriteriaTotalCount(SearchCriteria cri) throws SQLException {
		return session.selectOne("Product-Mapper.selectSearchProductListCount", cri);
	}

	@Override
	public List<ProductVO> selectProductOneDetail(int mdNo) throws SQLException {
		return session.selectList("Product-Mapper.selectProductOneDetail", mdNo);
	}

	@Override
	public void updateProductDetail(ProductCommandVO product) throws SQLException {
		session.update("Product-Mapper.updateProductDetail", product);
	}

	@Override
	public void insertProduct(ProductCommandVO product) throws SQLException {
		session.update("Product-Mapper.insertProduct",product);
	}

	@Override
	public void deleteProduct(String receiveNo) throws SQLException {
		session.update("Product-Mapper.deleteProduct",receiveNo);
	}
	
	@Override
	public String selectProductOwnStandardNum(String mdNo) throws SQLException {
		return session.selectOne("Product-Mapper.selectProductOwnStandardNum",mdNo);
	}

	@Override
	public void insertStandardOwnnum(ProductCommandVO product) throws SQLException {
		session.update("Product-Mapper.insertStandardOwnnum", product);
	}

	@Override
	public void updateStandardOwnnum(ProductCommandVO product) throws SQLException {
		session.update("Product-Mapper.updateStandardOwnnum", product);
	}

	@Override
	public String selectStandardOwnnum(ProductCommandVO product) throws SQLException {
		return session.selectOne("Product-Mapper.selectStandardOwnnum", product);
	}

}














