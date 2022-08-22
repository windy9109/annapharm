package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionException;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.ProductCommandVO;
import kr.or.annapharm.dto.ProductVO;

public interface ProductService {
	
	public Map<String, Object> getProductList(SearchCriteria cri) throws SQLException;
	
	public List<ProductVO> getProductDetail(int mdNo) throws SQLException;
	
	public void updateProductDetail(ProductCommandVO product) throws SQLException;
	
	public void insertProduct(ProductCommandVO product) throws SQLException;
	
	public void deleteProduct(String receiveNo) throws SQLException;
	
	public String selectProductOwnStandardNum(String mdNo) throws SQLException;
	
	public void insertStandardOwnnum(ProductCommandVO product) throws SQLException;

	public void updateStandardOwnnum(ProductCommandVO product) throws SQLException;
	
	public String selectStandardOwnnum(ProductCommandVO product) throws SQLException;
}
