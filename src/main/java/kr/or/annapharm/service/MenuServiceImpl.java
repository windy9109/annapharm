package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.List;


import kr.or.annapharm.dao.MenuDAO;
import kr.or.annapharm.dto.MenuVO;

public class MenuServiceImpl implements MenuService {
	
	private MenuDAO menuDAO;// = new MenuDAOImpl();
	public void setMenuDAO(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}
	
	@Override
	public List<MenuVO> getUserMenuList() throws SQLException {
		List<MenuVO> menuList = null;
		menuList = menuDAO.selectUserMenu();
		return menuList;
	}
	@Override
	public List<MenuVO> getDoctorMenuList() throws SQLException {
		List<MenuVO> menuList = null;
		menuList = menuDAO.selectDoctorMenu();
		return menuList;
	}
	@Override
	public List<MenuVO> getChemistMenuList() throws SQLException {
		List<MenuVO> menuList = null;
		menuList = menuDAO.selectChemistMenu();
		return menuList;
	}

	@Override
	public MenuVO getMenuByMcode(String mCode) throws SQLException {
		MenuVO menu = null;
		menu = menuDAO.selectMenuByMcode(mCode);
		return menu;
	}

	@Override
	public MenuVO getMenuByMname(String mName) throws SQLException {
		MenuVO menu = null;
		menu = menuDAO.selectMenuByMname(mName);
		return menu;
	}

	@Override
	public List<MenuVO> getSubMenuList(String mCode) throws SQLException {
		List<MenuVO> menuList = null;
		menuList = menuDAO.selectSubMenu(mCode);
		return menuList;
	}

	@Override
	public List<MenuVO> selectMainMenu( String Mcode ) throws SQLException {
		List<MenuVO> menuList = null;
		menuList = menuDAO.selectMainMenu(Mcode);
		return menuList;
	}

	@Override
	public List<MenuVO> selectSubMenu2() throws SQLException {
		List<MenuVO> menuList = null;
		menuList = menuDAO.selectSubMenu2();
		return menuList;
	}

}
