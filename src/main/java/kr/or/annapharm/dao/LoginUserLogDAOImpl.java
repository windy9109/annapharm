package kr.or.annapharm.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.jsp.dao.SearchMemberDAO;

import kr.or.annapharm.dto.LoginUserLogVO;



public class LoginUserLogDAOImpl implements LoginUserLogDAO {

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public void insertLoginUserLog(LoginUserLogVO logVO) throws SQLException {
		session.update("LoginUserLog-Mapper.insertLoginUserLog",logVO);

	}

	@Override
	public void deleteLoginUserLog() throws SQLException {
		session.update("LoginUserLog-Mapper.deleteLoginUserLog");


	}

}
