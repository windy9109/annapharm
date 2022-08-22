package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSessionException;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.ProductCommandVO;
import kr.or.annapharm.dto.ProductVO;


public interface ProductDAO {
	
	/**
	 * 재고현황에 재고목록을 출력하기위한 메서드
	 * @author 김기웅
	 * @param cri - 검색조건을 부여하기위한 SearchiCriteria 파라미터
	 * @return - DB에 있는 재고 목록
	 * @throws SQLException
	 */
	public List<ProductVO> selectProductCriteria(SearchCriteria cri) throws SQLException;

	/**
	 * 재고현황의 목록의 pagination기능을 위한 메서드
	 * @author 김기웅
	 * @param cri - 검색조건을 부여하기위한 SearchiCriteria 파라미터
	 * @return - 재고목록의 pagination을 위해 재고의 총 개수
	 * @throws SQLException
	 */
 	public int selectProductCriteriaTotalCount(SearchCriteria cri) throws SQLException;
 	
 	/**
 	 * 특정재고의 상세정보를 출력하기위한 메서드
 	 * @author 김기웅
 	 * @param mdNo - 약번호
 	 * @return 재고의 상세정보
 	 * @throws SQLException
 	 */
 	public List<ProductVO> selectProductOneDetail(int mdNo) throws SQLException;
 	
 	/**
 	 * 특정재고의 약번호를 통해 적정재고수를 가져오는 메서드
 	 * @author 김기웅
 	 * @param mdNo - 약번호
 	 * @return 재고의 적정재고수
 	 * @throws SQLException
 	 */
 	public String selectProductOwnStandardNum(String mdNo) throws SQLException;
 	
 	/**
 	 * 재고의 상세정보 업데이트 메서드
 	 * @author 김기웅
 	 * @param product - 재고의 정보를 담은 VO
 	 * @throws SQLException
 	 */
 	public void updateProductDetail(ProductCommandVO product) throws SQLException;
 	
 	/**
 	 * 재고의 정보를 통해 재고를 추가하는 메서드
 	 * @author 김기웅
 	 * @param product - 재고의 정보를 담은 VO 
 	 * @throws SQLException
 	 */
 	public void insertProduct(ProductCommandVO product) throws SQLException;
 	
 	/**
 	 * 재고를 삭제하는 메서드
 	 * @author 김기웅
 	 * @param receiveNo - 입고장 번호
 	 * @throws SQLException
 	 */
 	public void deleteProduct(String receiveNo) throws SQLException;
 	
 	/**
 	 * 적정재고수를 입력하는 메서드 
 	 * @author 김기웅
 	 * @param product - 재고의 정보를 담은 VO
 	 * @throws SQLException
 	 */
 	public void insertStandardOwnnum(ProductCommandVO product) throws SQLException;
 	
 	/**
 	 * 적정재고수를 업데이트하는 메서드
 	 * @author 김기웅
 	 * @param product - 재고의 정보를 담은 VO
 	 * @throws SQLException
 	 */
 	public void updateStandardOwnnum(ProductCommandVO product) throws SQLException;
 	
 	/**
 	 * 특정 재고의 적정재고수를 가져오는 메서드
 	 * @author 김기웅
 	 * @param product - 재고의 정보를 담은 VO
 	 * @return 특정 재고의 적정재고수
 	 * @throws SQLException
 	 */
 	public String selectStandardOwnnum(ProductCommandVO product) throws SQLException;
}










