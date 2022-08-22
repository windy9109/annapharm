package kr.or.annapharm.security;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import kr.or.annapharm.dto.ChemistVO;
import kr.or.annapharm.dto.DoctorVO;
import kr.or.annapharm.dto.MemberVO;
import kr.or.annapharm.service.MemberService;



public class LoginSuccessHandler  extends SavedRequestAwareAuthenticationSuccessHandler{


	private String savePath="c:\\log";;
	private String saveFileName = "login_user_log.csv";

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	private MemberService memberService;

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {

		String chemistTargetUrl = "/expert/main.do";
		String doctorTargetUrl = "/patient/main.do";
		String managerTargetUrl = "/manager/main.do";
		User user = (User)authentication.getDetails();
		HttpSession session = request.getSession();

		MemberVO loginUser = user.getMemberVO();

		System.out.println(user);

		if(user.getAuthoritiesString().equals("일반")) {
			System.out.println("어디니? : 일반");
			MemberVO nomalUser = null;
			try {
				nomalUser = memberService.selectPatientInfo(loginUser.getMemId());
				System.out.println("노말 : " + nomalUser);
				System.out.println(loginUser.getMemId());
				session.setAttribute("loginUser", nomalUser);
				System.out.println("멤버 : " + nomalUser);
				super.onAuthenticationSuccess(request, response, authentication);
				// log 작성
				loginUserlogFile(nomalUser, request);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(user.getAuthoritiesString().equals("약사")) {
			System.out.println("어디니? : 약사");
			ChemistVO chemistUser = null;
			try {
				chemistUser = memberService.selectChemistInfo(loginUser.getMemId());
				System.out.println("chemistUser :" + chemistUser);
				session.setAttribute("loginUser", chemistUser);
				getRedirectStrategy().sendRedirect(request, response, chemistTargetUrl);
				// log 작성
				loginUserlogFile(chemistUser, request);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(user.getAuthoritiesString().equals("의사")) {
			System.out.println("어디니? : 의사");
			DoctorVO doctorUser = null;
			try {
				doctorUser = memberService.selectDoctorInfo(loginUser.getMemId());
				session.setAttribute("loginUser", doctorUser);
				getRedirectStrategy().sendRedirect(request, response, doctorTargetUrl);
				// log 작성
				loginUserlogFile(doctorUser, request);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(user.getAuthoritiesString().equals("관리자")) {
			System.out.println("어디니? : 관리자");
			MemberVO nomalUser = user.getMemberVO();
			session.setAttribute("loginUser", nomalUser);
			getRedirectStrategy().sendRedirect(request, response, managerTargetUrl);
			// log 작성
			loginUserlogFile(nomalUser, request);
		}

		session.setMaxInactiveInterval(60*60);
	}

	private void loginUserlogFile(MemberVO loginUser,
								HttpServletRequest request) throws IOException{
		//로그인 정보를 스트링으로 저장.
		String tag ="[login:user]";
		String log =tag
					+loginUser.getMemId()+","
					+loginUser.getMemTel()+","
					+loginUser.getMemEmail()+","
					+request.getRemoteAddr()+","
					+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

		File file=new File(savePath);
		file.mkdirs();

		String logFilePath=savePath+File.separator+saveFileName;
		BufferedWriter out=new BufferedWriter(new FileWriter(logFilePath,true));


		//로그를 기록
		out.write(log);
		out.newLine();

		out.close();
	}

}












