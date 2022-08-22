package kr.or.annapharm.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jsp.controller.MakeFileName;
import com.jsp.dto.AttachVO;
import com.jsp.dto.NoticeVO;
import com.jsp.dto.PdsVO;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.BoardVO;
import kr.or.annapharm.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	//공지사항 목록 페이지
	@RequestMapping("/list")
	public ModelAndView list(SearchCriteria cri, ModelAndView mnv) throws SQLException{
		String url = "board/list";

		Map<String, Object> dataMap = boardService.getBoardList(cri);

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}

	//공지사항 등록 페이지로 이동
	@RequestMapping("/registForm")
	public String registForm() {
		String url = "board/regist";
		return url;
	}

	//공지사항 등록
	@RequestMapping("/regist")
	public String regist(BoardVO board,HttpServletRequest request,RedirectAttributes rttr) throws Exception{
		String url = "redirect:/board/list";

		board.setBoardTitle((String)request.getAttribute("XSStitle")); //제목  설정

		board.setMemIdManager("admin"); //글쓴이 설정

		boardService.regist(board); //bno 설정

		rttr.addFlashAttribute("from","regist");

		return url;
	}

	//공지사항 상세
	@RequestMapping("/detail")
	public String detail(BoardVO board,HttpServletRequest request,RedirectAttributes rttr) throws Exception{
		String url="board/detail";
		int boardCode = Integer.parseInt(request.getParameter("boardCode"));


		String from = request.getParameter("from");
		if(from!=null && from.equals("list")) {
			board = boardService.read(boardCode);

		}else {
			board = boardService.getBoard(boardCode);
		}

		return url;

	}




}
