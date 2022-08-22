package kr.or.annapharm.controller;

import java.util.Arrays;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.josephoconnell.html.HTMLInputFilter;

import kr.or.annapharm.command.Criteria;
import kr.or.annapharm.command.PageMaker;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.dto.ReplyVO;
import kr.or.annapharm.service.ReplyService;

//	url : /replies

//	chemist_in_code번 게시글의 페이징 처리된 댓글 목록
//	/replies/{chemist_in_code}/{page} 			page list: GET방식
//	/replies 						regist : POST 방식 : 댓글 입력
//	/replies/{chemist_ans_code}					modify : PUT,PATCH방식, chemist_ans_code 댓글의 수정
//	/replies/{chemist_in_code}/{chemist_ans_code}/{page}		remove : DELETE 방식, chemist_ans_code 댓글의 삭제
//	/replie

@RestController
@RequestMapping("/replies")
public class ReplyController {

	@Autowired
	private ReplyService service;

	@RequestMapping(value = "/{chemistInCode}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> replyList(HttpServletRequest request,@PathVariable("chemistInCode")int chemistInCode, @PathVariable("page")int page)throws Exception{

		HttpSession session = request.getSession();
		MemberVO mavo = (MemberVO)session.getAttribute("loginUser");

		ResponseEntity<Map<String, Object>> entity = null;
		Criteria cri = new Criteria();
		cri.setPage(page);

		System.out.println(cri);
		System.out.println(cri.getPage());





		Map<String, Object> dataMap = null;



		 if(mavo == null || mavo.equals("null")) {
			 dataMap = service.getReplyList(chemistInCode, cri);
		 	}
		 else {
				mavo.setChemistInCode(chemistInCode);
			 	dataMap = service.getReplyList(chemistInCode, mavo, cri);
		 }



		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);

		return entity;

	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> register(HttpServletRequest request, @RequestBody ReplyVO reply)
			throws Exception {

		ResponseEntity<Map<String, Object>> entity = null;
		HttpSession session = request.getSession();
		MemberVO mavo = (MemberVO) session.getAttribute("loginUser");

		reply.setChemistInReply(HTMLInputFilter.htmlSpecialChars(reply.getChemistInReply()));

		service.registReply(reply, mavo);
		Criteria cri = new Criteria();


		Map<String, Object> dataMap = service.getReplyList(reply.getChemistInCode(), cri);
		PageMaker pageMaker = (PageMaker) dataMap.get("pageMaker");
		int realEndPage = pageMaker.getRealEndPage();

		entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);

		return entity;

	}

	@RequestMapping(value = "/{chemistAnsCode}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> modify(@PathVariable("chemistAnsCode") int chemistAnsCode, @RequestBody ReplyVO reply)
			throws Exception {

		ResponseEntity<String> entity = null;

		reply.setChemistAnsCode(chemistAnsCode);
		service.modifyReply(reply);
		entity = new ResponseEntity<String>(HttpStatus.OK);

		return entity;

	}

	@RequestMapping(value = "/{chemistAnsCode}/{chemistInCode}/{chemistCode}", method = { RequestMethod.POST })
	public ResponseEntity<String> changeHeart(@PathVariable("chemistAnsCode") int chemistAnsCode,
			@PathVariable("chemistInCode") int chemistInCode, @PathVariable("chemistCode") String chemistCode,
			HttpServletRequest request, @RequestBody ReplyVO reply) throws Exception {

		ResponseEntity<String> entity = null;

		HttpSession session = request.getSession();
		MemberVO mavo = (MemberVO) session.getAttribute("loginUser");

		reply.setChemistAnsCode(chemistAnsCode);
		reply.setChemistInCode(chemistInCode);
		reply.setMemId(mavo.getMemId());
		reply.setChemistCode(chemistCode);

		int chemistAnsLike = service.CheckCheInRecom(reply);

		if (chemistAnsLike == 0) {
			service.insertCheInRecom(reply);
		} else if (chemistAnsLike > 0) {
			service.deleteCheInRecom(reply);
		}

		int selectCheInRecom = service.selectCheInRecom(reply);

		// service.selectCheInRecom(reply);
		entity = new ResponseEntity<String>("" + selectCheInRecom, HttpStatus.OK);

		return entity;

	}

	@RequestMapping(value = "/{chemistInCode}/{chemistAnsCode}/{page}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("chemistAnsCode") int chemistAnsCode,
			@PathVariable("chemistInCode") int chemistInCode, @PathVariable("page") int page) throws Exception {

		ResponseEntity<String> entity = null;

		service.removeReply(chemistAnsCode);

		Criteria cri = new Criteria();

		Map<String, Object> dataMap = service.getReplyList(chemistInCode, cri);
		PageMaker pageMaker = (PageMaker) dataMap.get("pageMaker");

		int nrealEndPage = pageMaker.getEndPage();
		if (page > nrealEndPage) {
			page = nrealEndPage;
		}

		entity = new ResponseEntity<String>("" + page, HttpStatus.OK);

		return entity;

	}

}
