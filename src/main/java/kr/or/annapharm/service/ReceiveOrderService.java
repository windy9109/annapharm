package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionException;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.OrderCartVO;
import kr.or.annapharm.dto.ProductCommandVO;
import kr.or.annapharm.dto.ReceiveCartVO;
import kr.or.annapharm.dto.ReceiveOrderCartVO;

public interface ReceiveOrderService {
	
	public Map<String, Object> getReceiveList(SearchCriteria cri)throws SQLException; // 입고장 목록 가져오기
	
	public Map<String, Object> getOrderList(SearchCriteria cri)throws SQLException;  // 발주서 목록 가져오기
	
	public List<ReceiveOrderCartVO> getReceiveCartList(int no)throws SQLException; // 입고품 목록 가져오기
	
	public List<ReceiveOrderCartVO> getReceiveDemoCartList() throws SQLException; // 임시저장 입고품 목록 가져오기
 	
	public List<ReceiveOrderCartVO> getOrderCartList(int no)throws SQLException;  // 발주품 목록 가져오기
	
	public List<ReceiveOrderCartVO> getOrderDemoCartList() throws SQLException; // 임시저장 발주품 목록 가져오기
	
	public void insertReceive(ProductCommandVO vo) throws SQLException;  // 입고장 저장
	
	public void insertDemoReceive(ProductCommandVO vo) throws SQLException;  // 입고장 임시저장
	
	public void insertOrder(ProductCommandVO vo) throws SQLException; // 발주서 저장
	
	public void insertDemoOrder(ProductCommandVO vo) throws SQLException;  // 발주서 임시저장
	
	public void deleteReceive(String receiveNo) throws SQLException;  // 입고장 삭제
	
	public void deleteDemoReceive() throws SQLException;  // 임시저장 입고장 삭제
		
	public void deleteDemoReceiveCart() throws SQLException;  // 임시저장된 입고장 입고품 삭제
	
	public void deleteOrder(String orderNo) throws SQLException; // 발주서 삭제
	
	public void deleteDemoOrder() throws SQLException; // 임시저장된 발주서 삭제
	
	public void deleteDemoOrderCart() throws SQLException;	// 임시저장된 발주서의 발주품 삭제
	
	public void deleteReceiveCart(String receiveNo) throws SQLException;
	
	public void deleteOrderCart(String orderNo) throws SQLException;
	
	public int getMaxReceiveNo() throws SQLException;

	public int getMaxOrderNo() throws SQLException;
	
	public List<ProductCommandVO> insertReceiveCart(ProductCommandVO procVO) throws SQLException; 
	
	public List<ProductCommandVO> insertOrderCart(ProductCommandVO procVO) throws SQLException; 
}



