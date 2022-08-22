package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.OrderCartVO;
import kr.or.annapharm.dto.OrderVO;
import kr.or.annapharm.dto.ProductCommandVO;
import kr.or.annapharm.dto.ReceiveCartVO;
import kr.or.annapharm.dto.ReceiveOrderCartVO;
import kr.or.annapharm.dto.ReceiveVO;

public interface ReceiveOrderDAO {
	/**
	 * 입고장 목록을 출력하기 위한 메서드
	 * @author 김기웅
	 * @param cri - 검색조건을 부여하기위한 SearchCriteria 파라미터
	 * @return DB에 있는 입고장 목록
	 * @throws SQLException
	 */
	public List<ReceiveVO> selectReceiveCriteria(SearchCriteria cri) throws SQLException;
	
	/**
	 * 발주서 목록을 출력하기 위한 메서드
	 * @author 김기웅
	 * @param cri - 검색조건을 부여하기위한 SearchiCriteria 파라미터
	 * @return DB에있는 발주서 목록
	 * @throws SQLException
	 */
	public List<OrderVO> selectOrderCriteria(SearchCriteria cri) throws SQLException;
	
	/**
	 * 입고장에 작성된 입고품의 목록을 가져오는 메서드
	 * @author 김기웅
	 * @param no - 입고장의 번호
	 * @return 입고장에 작성된 입고품의 목록
	 * @throws SQLException
	 */
	public List<ReceiveOrderCartVO> selectReceiveCartList(int no) throws SQLException;
	
	/**
	 * 임시저장한 입고장의 입고품 목록을 가져오는 메서드
	 * @author 김기웅
	 * @return 임시저장한 입고장의 입고품 목록
	 * @throws SQLException
	 */
	public List<ReceiveOrderCartVO> selectReceiveDemoCartList() throws SQLException;
	
	public List<ReceiveOrderCartVO> selectOrderCartList(int no) throws SQLException;
	
	public List<ReceiveOrderCartVO> selectOrderDemoCartList() throws SQLException;
	
	public int getMaxReceiveNo() throws SQLException;
	
	public int getMaxOrderNo() throws SQLException;
	
	public void insertReceive(ProductCommandVO vo) throws SQLException;
	
	public void insertDemoReceive(ProductCommandVO vo) throws SQLException;
	
	public void insertOrder(ProductCommandVO vo) throws SQLException;
	
	public void insertDemoOrder(ProductCommandVO vo) throws SQLException;
	
	public void deleteReceive(String receiveNo) throws SQLException;
	
	public void deleteDemoReceive() throws SQLException;
	
	public void deleteDemoReceiveCart() throws SQLException;
	
	public void deleteOrder(String orderNo) throws SQLException;
	
	public void deleteDemoOrder() throws SQLException;
	
	public void deleteDemoOrderCart() throws SQLException;	
	
	public void deleteReceiveCart(String receiveNo) throws SQLException;
	
	public void deleteOrderCart(String orderNo) throws SQLException;

	public List<ProductCommandVO> insertReceiveCart(ProductCommandVO product)throws SQLException;
	
	public List<ProductCommandVO> insertOrderCart(ProductCommandVO product)throws SQLException;
}
