package kr.or.annapharm.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.jxls.common.Context;
import org.jxls.util.JxlsHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.annapharm.command.SalesAnalysisCommand;
import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.PrescriptionSaveLogVO;
import kr.or.annapharm.dto.RegistBillVO;
import kr.or.annapharm.dto.SalesAnalysisDetailVO;
import kr.or.annapharm.dto.SalesAnalysisExcelVO;
import kr.or.annapharm.service.SalesAnalysisService;

@RestController
@RequestMapping("/sales_analysis")
public class SalesAnalysisRestController {

	@Autowired
	private SalesAnalysisService salesAnalysisService;

	@RequestMapping("/read")
	public ResponseEntity<List<SalesAnalysisDetailVO>> readPrescription(String psCode) throws Exception{
		ResponseEntity<List<SalesAnalysisDetailVO>> entity = null;

		List<SalesAnalysisDetailVO> voList = salesAnalysisService.getSalesAnalyssisDetail(psCode);

		entity = new ResponseEntity<List<SalesAnalysisDetailVO>>(voList, HttpStatus.OK);

		return entity;
	}

	@RequestMapping("/readLoginPharmacy")
	public ResponseEntity<RegistBillVO> readLoginPharmacy(String loginId) throws Exception{
		ResponseEntity<RegistBillVO> entity = null;

		RegistBillVO vo = salesAnalysisService.getPharmacyInfo(loginId);

		System.out.println("vo : " +vo);

		entity = new ResponseEntity<RegistBillVO>(vo, HttpStatus.OK);

		return entity;
	}

	// 개요 : excel 저장시 사용되는 controller
	// 작성자 : 이병진
	@RequestMapping(value="/excel")
	public void excel(HttpServletResponse response, SearchCriteria cri ) throws Exception {
		//, @RequestBody SearchCriteria cri
		// 데이터를 넣을 객체
		List<SalesAnalysisCommand> salesAnalysisList = salesAnalysisService.getSearchAnalysisList(cri);
		String fileName = "요양급여신청내역_"; // 파일 이름
		String title = "요양급여 신청내역"; // 제목 셀 이름
		Date day = new Date();
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy.MM.dd");
		String today2 = format2.format(day); // 오늘 날짜 생성

		ClassPathResource classPathResource = new ClassPathResource("/kr/or/annapharm/excel/salesAnalysis2.xls");

		System.out.println("salesAnalysisList" + salesAnalysisList);

		try (InputStream is = new BufferedInputStream(classPathResource.getInputStream())){
			response.setHeader("Content-Disposition","attachment; filename=" + URLEncoder.encode(fileName, "UTF-8") + today2 +".xlsx");
			OutputStream os = response.getOutputStream();

			Context context = new Context();
			context.putVar("salesAnalysisList", salesAnalysisList);
			context.putVar("test", title);
			context.putVar("date", today2);

			JxlsHelper.getInstance().processTemplate(is, os, context);
			os.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 개요 : 임시저장 버튼을 눌렀을 때 사용되는 controller
	// 작성자 : 이병진
	@RequestMapping(value="/temporarilyPrintAndSave", method = RequestMethod.POST)
	public void temporarilyprintAndSave(@RequestParam(value="prescriptArr[]")List<String> prescriptArr, String chemistName, String pharmacyCode, int count) throws Exception {
		System.out.println("prescriptArr : " + prescriptArr);
		System.out.println("chemistName : " + chemistName);
		System.out.println("pharmacyCode : " + pharmacyCode);
		System.out.println("count : " + count);

		PrescriptionSaveLogVO psvo = new PrescriptionSaveLogVO();
		psvo.setPslogChname(chemistName);
		psvo.setPslogPharmacycode(pharmacyCode);
		psvo.setPslogCount(count);

		System.out.println("psvoCon :" + psvo);

		salesAnalysisService.temporarilySave(psvo, prescriptArr);
	}

	// 개요 : 요양급여신청서에서 저장 버튼을 눌렀을 때 실행되는 controller
	// 작성자 : 이병진
	@RequestMapping(value="/printAndSave", method = RequestMethod.POST)
	public void printAndSave(@RequestParam(value="prescriptArr[]")List<String> prescriptArr, String chemistName, String pharmacyCode, int count) throws Exception{
		System.out.println("prescriptArr : " + prescriptArr);
		System.out.println("chemistName : " + chemistName);
		System.out.println("pharmacyCode : " + pharmacyCode);
		System.out.println("count : " + count);

		PrescriptionSaveLogVO psvo = new PrescriptionSaveLogVO();
		psvo.setPslogChname(chemistName);
		psvo.setPslogPharmacycode(pharmacyCode);
		psvo.setPslogCount(count);

		System.out.println("psvoCon :" + psvo);

		salesAnalysisService.printSave(psvo, prescriptArr);
	}

	// 개요 : 저장/출력 내역의 행을 눌렀을 때 실행되는 controller
	// 작성자 : 이병진
	@RequestMapping("/printAndSaveRead")
	public ResponseEntity<List<SalesAnalysisCommand>> printAndSaveRead(int pslogNum) throws Exception{
		ResponseEntity<List<SalesAnalysisCommand>> entity = null;

		System.out.println("pslogNum : " + pslogNum);

		List<SalesAnalysisCommand> sc = salesAnalysisService.getSaveAndPrintDetailList(pslogNum);

		entity = new ResponseEntity<List<SalesAnalysisCommand>>(sc, HttpStatus.OK);

		return entity;
	}

	// 개요 : 저장/출력 내역의 행에 있는 삭제 버튼을 눌렀을 때 실행되는 controller
	// 작성자 : 이병진
	@RequestMapping("/printAndSaveDelete")
	public void printAndSaveDelete(int pslogNum) throws Exception{
		salesAnalysisService.saveDelete(pslogNum);
	}

}
