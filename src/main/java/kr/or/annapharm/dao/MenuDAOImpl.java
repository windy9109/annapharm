package kr.or.annapharm.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.annapharm.dto.MenuVO;


public class MenuDAOImpl implements MenuDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}


	@Override
	public List<MenuVO> selectUserMenu() throws SQLException {
		return session.selectList("Menu-Mapper.selectUserMenu");
	}

	@Override
	public List<MenuVO> selectDoctorMenu() throws SQLException {
		return session.selectList("Menu-Mapper.selectDoctorMenu");
	}

	@Override
	public List<MenuVO> selectChemistMenu() throws SQLException {
		return session.selectList("Menu-Mapper.selectChemistMenu");
	}

	@Override
	public List<MenuVO> selectSubMenu(String mCode) throws SQLException {
		return session.selectList("Menu-Mapper.selectSubMenu",mCode);
	}

	@Override
	public MenuVO selectMenuByMcode(String mCode) throws SQLException {
		return session.selectOne("Menu-Mapper.selectMenuByMcode", mCode);
	}

	@Override
	public MenuVO selectMenuByMname(String mName) throws SQLException {
		return session.selectOne("Menu-Mapper.selectMenuByMname", mName);
	}


	@Override
	public List<MenuVO> selectMainMenu(String Mcode) throws SQLException {
		System.out.println("뭐니 Mcode" + Mcode);
		return session.selectList("Menu-Mapper.selectMainMenu", Mcode);
	}


	@Override
	public List<MenuVO> selectSubMenu2( ) throws SQLException {
		return session.selectList("Menu-Mapper.selectSubMenu2");
	}

}
