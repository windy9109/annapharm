package kr.or.annapharm.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.annapharm.PharmacyAPI;
import kr.or.annapharm.PharmacyAPIVO;
import kr.or.annapharm.command.SalesAnalysisCommand;
import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.PrescriptionSaveLogVO;
import kr.or.annapharm.dto.RegistBillVO;
import kr.or.annapharm.service.SalesAnalysisService;

@Controller
@RequestMapping("/sales_analysis")
public class SalesAnalysisController {

	@Autowired
	private SalesAnalysisService salesAnalysisService;

	@RequestMapping("/main")
	public ModelAndView main(ModelAndView mnv, HttpServletRequest request) throws Exception {
		String url = "expert/business_management/sales_analysis";
		String loginUserPharmacyCode = null;
		// 임시 약국 번호
		String pharmacyCode = "C2104147";

		/* 추후 로그인 세션이 생기면 적용
		 *
		 * HttpSession session = request.getSession(); String loginUser =
		 * loginUserPharmacyCode = session.getAttribute("loginUser");
		 */

		List<RegistBillVO> nameList = salesAnalysisService.getChemistsName(pharmacyCode);
		List<PrescriptionSaveLogVO> pslList = salesAnalysisService.getSavePringList(pharmacyCode);

		mnv.addObject("nameList", nameList);
		mnv.addObject("pslList", pslList);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/search")
	public ModelAndView main(ModelAndView mnv, SearchCriteria cri) throws Exception {
		String url = "expert/business_management/sales_analysis";
		String loginUserPharmacyCode = null;
		// 임시 약국 번호
		String pharmacyCode = "C2104147";
		Date today = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar month = Calendar.getInstance();
		month.add(Calendar.MONTH,-1);

		if(cri.getStartDate() == null) {
			// 한달 전 날짜 넣기
			cri.setStartDate(format.format(month.getTime()));
		}
		if(cri.getEndDate() == null) {
			// 오늘 날짜 넣기
			cri.setEndDate(format.format(today));
		}
		if(cri.getSearchType() == null) {
			// 타입 넣기
			cri.setSearchType("A");
		}

		List<RegistBillVO> nameList = salesAnalysisService.getChemistsName(pharmacyCode);
		List<SalesAnalysisCommand> salesAnalysisList = salesAnalysisService.getSearchAnalysisList(cri);
		// 저장 출력 내역을 가져오는 리스트
		List<PrescriptionSaveLogVO> pslList = salesAnalysisService.getSavePringList(pharmacyCode);

		//System.out.println(nameList);

		mnv.addObject("salesAnalysisList", salesAnalysisList);
		mnv.addObject("pslList", pslList);
		mnv.addObject("nameList", nameList);
		mnv.addObject("cri", cri);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/bill")
	public ModelAndView MakeBill(ModelAndView mnv) throws Exception{
		String url = "expert/business_management/bill/sales_analysis_bill";

		mnv.setViewName(url);
		return mnv;
	}


	@Autowired
	private PharmacyAPI pharmacyAPI;

	// API 데이터 insert(약국정보데이터)
	@RequestMapping("/test")
	public ModelAndView test(ModelAndView mnv) throws Exception{

		String url2 = "expert/business_management/bill/sales_analysis_bill";
		int num = 1;

		for(int i = 0; i < 24; i++) {
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyFullDown"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=tlkJ0%2BGNSZ3tibJ5IV7jCZpghwMWXWuwQEhsKGlp3singPDLV2bHnBgFLekiuWzPyBRMliAB2S%2BzLodvSyfAqw%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(num+"", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
	        num++;
	        System.out.println("num 확인 : " + num);
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            pharmacyAPI.saxRead(conn.getInputStream());
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        rd.close();
	        conn.disconnect();
			}
		mnv.setViewName(url2);
		return mnv;
	}


}
