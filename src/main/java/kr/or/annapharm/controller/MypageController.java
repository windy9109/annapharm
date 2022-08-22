package kr.or.annapharm.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.annapharm.dto.HospitalVO;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.MenuVO;
import kr.or.annapharm.service.HospitalService;

@Controller
public class MypageController {

	@Autowired
	HospitalService hospitalService;

	//의사 개인정보 수정 페이지 이동 url
	@RequestMapping("/mypageDoctor/modifyDoctorForm")
	public String modifyUserForm(HttpSession session, Model model) throws SQLException {
		String url = "expertAside/info/infoModifyDoctor";

		MemberVO member = (MemberVO) session.getAttribute("loginUser");

		System.out.println("------------------------");
		System.out.println(member);

		List<HospitalVO> hospitalName = hospitalService.getHospitalName();
		model.addAttribute("hospitalName", hospitalName);
		model.addAttribute("member", member);
		return url;
	}

	//의사 개인정보 수정

	//약사 개인정보 수정 페이지 이동 url



	//일반 개인정보 수정 페이지 이동 url





}
