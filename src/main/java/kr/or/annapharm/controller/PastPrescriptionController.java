package kr.or.annapharm.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.formula.ptg.MemErrPtg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.service.PastPrescriptionService;

@Controller
@RequestMapping("/pastPrescription")
public class PastPrescriptionController {

	@Autowired
	private PastPrescriptionService pastPrescriptionService;

	@RequestMapping("/list")
	public ModelAndView pastPrescriptionList(SearchCriteria cri, ModelAndView mnv , HttpSession session) throws SQLException{
		String url = "mainAside/mypage/pastPrescriptionList";

		MemberVO member = (MemberVO)session.getAttribute("loginUser");

		cri.setPatientCode(member.getPatientCode());
		System.out.println("////////////////////"+member.getPatientCode());
		Map<String, Object> dataMap = pastPrescriptionService.getPastPrescriptionList(cri);
		mnv.addObject("dataMap", dataMap);

		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/detail")
	public ModelAndView pastPrescriptionDetail(SearchCriteria cri, ModelAndView mnv , String psCode) throws SQLException{
		String url = "mainAside/mypage/pastPrescriptionListDetail";

		System.out.println("pscode : " + psCode);
		//pscode로 detail가져오기

		Map<String, Object> dataMap = pastPrescriptionService.getPastPrescriptionDetail(cri, psCode);

		System.out.println("컨트롤러 통과1");
		mnv.addObject("dataMap", dataMap);

		mnv.setViewName(url);
		System.out.println("컨트롤러 통과2");
		return mnv;
	}


}
