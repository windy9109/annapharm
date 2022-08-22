package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.OrderCartVO;
import kr.or.annapharm.dto.OrderVO;
import kr.or.annapharm.dto.ProductCommandVO;
import kr.or.annapharm.dto.ReceiveCartVO;
import kr.or.annapharm.dto.ReceiveOrderCartVO;
import kr.or.annapharm.dto.ReceiveVO;

public class ReceiveOrderDAOImpl implements ReceiveOrderDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ReceiveVO> selectReceiveCriteria(SearchCriteria cri) throws SQLException {
		return session.selectList("ReceiveOrder-Mapper.selectReceiveList", cri);
	}

	@Override
	public List<OrderVO> selectOrderCriteria(SearchCriteria cri) throws SQLException {
		return session.selectList("ReceiveOrder-Mapper.selectOrderList", cri);
	}

	@Override
	public List<ReceiveOrderCartVO> selectReceiveCartList(int no) throws SQLException {
		return session.selectList("ReceiveOrder-Mapper.selectReceiveCartList", no);
	}

	@Override
	public List<ReceiveOrderCartVO> selectOrderCartList(int no) throws SQLException {
		return session.selectList("ReceiveOrder-Mapper.selectOrderCartList", no);
	}

	@Override
	public void insertReceive(ProductCommandVO vo) throws SQLException {
		session.update("ReceiveOrder-Mapper.insertReceive", vo);
	}

	@Override
	public int getMaxReceiveNo() throws SQLException {
		return session.selectOne("ReceiveOrder-Mapper.getMaxReceiveNo");
	}

	@Override
	public void deleteReceiveCart(String receiveNo) throws SQLException {
		session.update("ReceiveOrder-Mapper.deleteReceiveCart", receiveNo);
	}
	
	@Override
	public List<ProductCommandVO> insertReceiveCart(ProductCommandVO product) throws SQLException {
		return session.selectList("ReceiveOrder-Mapper.insertReceiveCart", product);
	}

	@Override
	public void insertOrder(ProductCommandVO vo) throws SQLException {
		session.update("ReceiveOrder-Mapper.insertOrder", vo);		
	}

	@Override
	public int getMaxOrderNo() throws SQLException {
		return session.selectOne("ReceiveOrder-Mapper.getMaxOrderNo");
	}
	
	@Override
	public void deleteOrderCart(String orderNo) throws SQLException {
		session.update("ReceiveOrder-Mapper.deleteOrderCart", orderNo);
	}

	@Override
	public List<ProductCommandVO> insertOrderCart(ProductCommandVO product) throws SQLException {
		return session.selectList("ReceiveOrder-Mapper.insertOrderCart", product);
	}

	@Override
	public void deleteReceive(String receiveNo) throws SQLException {
		session.update("ReceiveOrder-Mapper.deleteReceive", receiveNo);
	}

	@Override
	public void deleteOrder(String orderNo) throws SQLException {
		session.update("ReceiveOrder-Mapper.deleteOrder", orderNo);
	}

	@Override
	public void insertDemoReceive(ProductCommandVO vo) throws SQLException {
		session.update("ReceiveOrder-Mapper.insertDemoReceive",vo);
		
	}

	@Override
	public void deleteDemoReceive() throws SQLException {
		session.update("ReceiveOrder-Mapper.deleteDemoReceive");
	}

	@Override
	public void deleteDemoReceiveCart() throws SQLException {
		session.update("ReceiveOrder-Mapper.deleteDemoReceiveCart");
	}

	@Override
	public void insertDemoOrder(ProductCommandVO vo) throws SQLException {
		session.update("ReceiveOrder-Mapper.insertDemoOrder", vo);
	}

	@Override
	public void deleteDemoOrder() throws SQLException {
		session.update("ReceiveOrder-Mapper.deleteDemoOrder");
	}

	@Override
	public void deleteDemoOrderCart() throws SQLException {
		session.update("ReceiveOrder-Mapper.deleteDemoOrderCart");
	}

	@Override
	public List<ReceiveOrderCartVO> selectReceiveDemoCartList() throws SQLException {
		return session.selectList("ReceiveOrder-Mapper.selectReceiveDemoCartList");
	}

	@Override
	public List<ReceiveOrderCartVO> selectOrderDemoCartList() throws SQLException {
		return session.selectList("ReceiveOrder-Mapper.selectOrderDemoCartList");
	}

	


}