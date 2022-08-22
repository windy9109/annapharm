package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.annapharm.command.PageMaker;
import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dao.MedicineDAO;
import kr.or.annapharm.dao.MedicineInfoDAO;
import kr.or.annapharm.dao.ReceiveOrderDAO;
import kr.or.annapharm.dto.OrderCartVO;
import kr.or.annapharm.dto.OrderVO;
import kr.or.annapharm.dto.ProductCommandVO;
import kr.or.annapharm.dto.ReceiveCartVO;
import kr.or.annapharm.dto.ReceiveOrderCartVO;
import kr.or.annapharm.dto.ReceiveVO;

public class ReceiveOrderServiceImpl implements ReceiveOrderService {

	private ReceiveOrderDAO receiveOrderDAO;
	
	public void setReceiveDAO(ReceiveOrderDAO receiveOrderDAO) {
		this.receiveOrderDAO = receiveOrderDAO;
	}
	
	@Override
	public Map<String, Object> getReceiveList(SearchCriteria cri) throws SQLException {
		Map<String, Object> receiveOrder = new HashMap<String, Object>();
		List<ReceiveVO> receiveList = receiveOrderDAO.selectReceiveCriteria(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		receiveOrder.put("receiveOrderList", receiveList);
		receiveOrder.put("pageMaker", pageMaker);
		
		return receiveOrder;
	}

	@Override
	public Map<String, Object> getOrderList(SearchCriteria cri) throws SQLException {
		Map<String, Object> receiveOrder = new HashMap<String, Object>();
		List<OrderVO> orderList = receiveOrderDAO.selectOrderCriteria(cri); 
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		receiveOrder.put("receiveOrderList", orderList);
		receiveOrder.put("pageMaker", pageMaker);
		
		return receiveOrder;
	}

	@Override
	public List<ReceiveOrderCartVO> getReceiveCartList(int no) throws SQLException {
		return receiveOrderDAO.selectReceiveCartList(no);
	}

	@Override
	public List<ReceiveOrderCartVO> getOrderCartList(int no) throws SQLException {
		return receiveOrderDAO.selectOrderCartList(no);
	}

	@Override
	public void insertReceive(ProductCommandVO vo) throws SQLException {
		receiveOrderDAO.insertReceive(vo);
	}
	
	public int getMaxReceiveNo() throws SQLException{
		return receiveOrderDAO.getMaxReceiveNo();
	}

	@Override
	public List<ProductCommandVO> insertReceiveCart(ProductCommandVO procVO) throws SQLException {
		return receiveOrderDAO.insertReceiveCart(procVO);
	}

	@Override
	public void deleteReceiveCart(String receiveNo) throws SQLException {
		receiveOrderDAO.deleteReceiveCart(receiveNo);
	}

	@Override
	public void insertOrder(ProductCommandVO vo) throws SQLException {
		receiveOrderDAO.insertOrder(vo);
	}

	@Override
	public void deleteOrderCart(String orderNo) throws SQLException {
		receiveOrderDAO.deleteOrderCart(orderNo);
	}

	@Override
	public int getMaxOrderNo() throws SQLException {
		return receiveOrderDAO.getMaxOrderNo();
	}

	@Override
	public List<ProductCommandVO> insertOrderCart(ProductCommandVO procVO) throws SQLException {
		return receiveOrderDAO.insertOrderCart(procVO);
	}

	@Override
	public void deleteReceive(String receiveNo) throws SQLException {
		receiveOrderDAO.deleteReceive(receiveNo);
	}

	@Override
	public void deleteOrder(String orderNo) throws SQLException {
		receiveOrderDAO.deleteOrder(orderNo);
	}

	@Override
	public void insertDemoReceive(ProductCommandVO vo) throws SQLException {
		receiveOrderDAO.insertDemoReceive(vo);
	}

	@Override
	public void deleteDemoReceive() throws SQLException {
		receiveOrderDAO.deleteDemoReceive();
	}

	@Override
	public void deleteDemoReceiveCart() throws SQLException {
		receiveOrderDAO.deleteDemoReceiveCart();
	}

	@Override
	public void insertDemoOrder(ProductCommandVO vo) throws SQLException {
		receiveOrderDAO.insertDemoOrder(vo);
	}

	@Override
	public void deleteDemoOrder() throws SQLException {
		receiveOrderDAO.deleteDemoOrder();
	}

	@Override
	public void deleteDemoOrderCart() throws SQLException {
		receiveOrderDAO.deleteDemoOrderCart();
	}

	@Override
	public List<ReceiveOrderCartVO> getReceiveDemoCartList() throws SQLException {
		return receiveOrderDAO.selectReceiveDemoCartList();
	}

	@Override
	public List<ReceiveOrderCartVO> getOrderDemoCartList() throws SQLException {
		return receiveOrderDAO.selectOrderDemoCartList();
	}
}











