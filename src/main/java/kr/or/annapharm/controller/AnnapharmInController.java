package kr.or.annapharm.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.AnnapharmInVO;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.ReplyVO;
import kr.or.annapharm.service.AnnapharmInService;
import kr.or.annapharm.service.BoardService;
import kr.or.annapharm.service.ReplyService;

@Controller
@RequestMapping("/annapharmIn")
public class AnnapharmInController {

	@Resource(name="annapharmInService")
	private AnnapharmInService service;

	@Autowired
	private ReplyService replyService;


	@RequestMapping("/list")
	public ModelAndView list(SearchCriteria cri, ModelAndView mnv) throws SQLException{
		String url = "main/annapharmIn/list";

		cri.setPerPageNum(6);

		Map<String, Object> dataMap = service.getAnnapharmInList(cri);

		AnnapharmInVO AnnapharmIn_main01 = service.selectAnnapharmIn_main01();
		AnnapharmInVO AnnapharmIn_main02 = service.selectAnnapharmIn_main02();
		AnnapharmInVO AnnapharmIn_main03 = service.selectAnnapharmIn_main03();
		AnnapharmInVO AnnapharmIn_main04 = service.selectAnnapharmIn_main04();


		mnv.addObject("dataMap", dataMap);
		mnv.addObject("AnnapharmIn_main01", AnnapharmIn_main01);
		mnv.addObject("AnnapharmIn_main02", AnnapharmIn_main02);
		mnv.addObject("AnnapharmIn_main03", AnnapharmIn_main03);
		mnv.addObject("AnnapharmIn_main04", AnnapharmIn_main04);
		mnv.setViewName(url);

		return mnv;
	}

	//약사인 리스트 마이페이지 일반
	@RequestMapping("/listMypageN")
	public ModelAndView list_mypage_n(SearchCriteria cri, ModelAndView mnv) throws SQLException{
		String url = "main/annapharmIn/listMypageN";

		Map<String, Object> dataMap = service.getAnnapharmInList(cri);

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}


	//약사인 메인 search
	@RequestMapping("/listSearch")
	public ModelAndView list_search(SearchCriteria cri, ModelAndView mnv) throws SQLException{
		String url = "main/annapharmIn/list_search";

		Map<String, Object> dataMap = service.getAnnapharmInList(cri);

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}



	//약사인 리스트 마이페이지 약사
	@RequestMapping("/listMypageP")
	public ModelAndView list_mypage_p(SearchCriteria cri, ModelAndView mnv) throws SQLException{
		String url = "main/annapharmIn/listMypageP";

		Map<String, Object> dataMap = service.getAnnapharmInList_myList_p(cri);

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}




	@RequestMapping("/registForm")
	public String registForm(){
		String url="main/annapharmIn/regist";
		return url;
	}

	@RequestMapping("/regist")
	public String regist(AnnapharmInVO annapharmIn, HttpSession request, //BoardVO board,
						 RedirectAttributes rttr)throws Exception{
		MemberVO mavo = (MemberVO)request.getAttribute("loginUser");



		//annapharmIn.setChemistInTitle((String)request.getAttribute("XSSchemistInTitle"));

		//annapharmIn.setChemistInTitle((String)request.getAttribute("XSSchemistInTitle"));
		//annapharmIn.setChemistInContent((String)request.getAttribute("XSSchemistInContent"));
		
		System.out.println(mavo.getPatientCode()+"아아아악!!!!");
		System.out.println(mavo.getMemId()+"아아아악!!!!2");

		System.out.println(mavo+"야호!");

//		System.out.println(annapharmIn+"아아악!!~~~~~~~~~~~~~~~~!!!!");
//		System.out.println(annapharmIn.get());
//		System.out.println(annapharmIn.getChemistInTitle());
//		System.out.println(annapharmIn.getChemistInTitle());
//		System.out.println(annapharmIn.getChemistInTitle());
//		System.out.println(annapharmIn.getChemistInTitle());

		AnnapharmInVO An = service.regist(annapharmIn, mavo);

		String url="redirect:/annapharmIn/detail.do?chemistInCode="+An.getChemistInCode()+"&chemistInReplyCnt="+An.getChemistInReplyCnt();

		rttr.addFlashAttribute("from","regist");

		return url;
	}


	@RequestMapping("/detail")
	public ModelAndView detail(int chemistInCode, int chemistInReplyCnt, String from, ModelAndView mnv )throws SQLException{
		String url="main/annapharmIn/detail";

		AnnapharmInVO annapharmIn =null;
		if(from!=null && from.equals("list")) {
			annapharmIn=service.getAnnapharmIn(chemistInCode);
			url="redirect:/annapharmIn/detail.do?chemistInCode="+chemistInCode+"&chemistInReplyCnt="+chemistInReplyCnt;
		}else {
			annapharmIn=service.getAnnapharmInForModify(chemistInCode);
		}

		mnv.addObject("annapharmIn",annapharmIn);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(int chemistInCode, int chemistInReplyCnt, ModelAndView mnv)throws SQLException{
		String url="main/annapharmIn/modifyForm";

		AnnapharmInVO annapharmIn = service.getAnnapharmInForModify(chemistInCode);

		mnv.addObject("annapharmIn",annapharmIn);
		mnv.addObject("chemistInReplyCnt",chemistInReplyCnt);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modifyPost(AnnapharmInVO annapharmIn, int chemistInReplyCnt, HttpServletRequest request, //BoardModifyCommand modifyReq,
							 RedirectAttributes rttr) throws Exception{



		String url = "redirect:/annapharmIn/detail.do?chemistInCode="+annapharmIn.getChemistInCode()+"&chemistInReplyCnt="+chemistInReplyCnt;


		//annapharmIn.setChemistInTitle((String)request.getAttribute("XSSchemistInTitle"));
		//annapharmIn.setChemistInContent((String)request.getAttribute("XSSchemistInContent"));
		

		service.modify(annapharmIn);

		rttr.addFlashAttribute("from","modify");
		rttr.addAttribute("chemistInCode",annapharmIn.getChemistInCode());


		return url;
	}

	@RequestMapping(value="/remove",method=RequestMethod.POST)
	public String remove(int chemistInCode, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/annapharmIn/list.do";
		service.remove(chemistInCode);

		rttr.addAttribute("chemistInCode", chemistInCode);
		rttr.addFlashAttribute("from","remove");
		return url;
	}



	//약사인 채택
	@RequestMapping(value="/selection",method=RequestMethod.POST)
	public String selection(ReplyVO cheInAns, int chemistInCode, int chemistInReplyCnt, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/annapharmIn/detail.do?chemistInCode="+chemistInCode+"&chemistInReplyCnt="+chemistInReplyCnt;
		service.selection(cheInAns);
		service.selection2(cheInAns);


		rttr.addFlashAttribute("from","selection");
		rttr.addAttribute("chemistInCode",cheInAns.getChemistInCode());
		rttr.addAttribute("chemistInReplyCnt",chemistInReplyCnt);

		return url;
	}



//	@RequestMapping("/list")
//	public ModelAndView selectAnnapharmIn_main01(ModelAndView mnv) throws SQLException{
//		String url = "main/annapharmIn/list";
//
//		AnnapharmInVO dataMap = service.selectAnnapharmIn_main01();
//
//		mnv.addObject("dataMap", dataMap);
//		mnv.setViewName(url);
//
//		return mnv;
//	}

//	//약사인 좋아요
//	@RequestMapping(value="/chemistAnsLike",method=RequestMethod.POST)
//	public String selection(ReplyVO cheInAns, RedirectAttributes rttr, ModelAndView mnv) throws Exception{
//		String url = "main/annapharmIn/reply_js";
//
//		int chemistAnsLike = replyService.selectCheInRecom(cheInAns);
//
//		/*
//		 * if(CheckCheInRecom == 0) { replyService.insertCheInRecom(cheInAns); }else
//		 * if(CheckCheInRecom > 0) { replyService.deleteCheInRecom(cheInAns); }
//		 *
//		 * CheckCheInRecom = replyService.CheckCheInRecom(cheInAns);
//		 */
//
//		//rttr.addFlashAttribute("from","chemistAnsLike");
//		//rttr.addAttribute("chemistInCode",cheInAns.getChemistInCode());
//
//		System.out.println(chemistAnsLike+"으아악!!!!!!!!!!!!!!!!--------------");
//
//		mnv.addObject("chemistAnsLike", chemistAnsLike);
//		mnv.setViewName(url);
//
//		return url;
//	}


}



