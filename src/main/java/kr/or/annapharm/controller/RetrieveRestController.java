package kr.or.annapharm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.or.annapharm.command.InsertRetrieveCommand;
import kr.or.annapharm.dto.ChemistVO;
import kr.or.annapharm.dto.RetrieveListVO;
import kr.or.annapharm.service.RetrieveService;

@RestController
@RequestMapping("/retrieve")
public class RetrieveRestController {

	@Autowired
	RetrieveService retrieveService;

	@RequestMapping(value = "/registRetrieve", method = RequestMethod.POST)
	public ResponseEntity<String> registRetrieve(@RequestBody InsertRetrieveCommand data, HttpSession session)
			throws Exception {
		// System.out.println("컨트롤러 들어오기 ----------------------------");
		ResponseEntity<String> entity = null;
		// System.out.println("반복문의 i값 : " + data.getFlag());
		int temp = data.getFlag();
		// 세션에서 약사번호, 약국코드 가져오기
		ChemistVO chemist = (ChemistVO) session.getAttribute("loginUser");
		data.setChemistCode(chemist.getChemistCode());
		data.setPharmacyCode(chemist.getPharmacyCode());

		if (temp == 0) {
			// System.out.println("----------0번째 열일 때(i가 0일때)----------");
			int retrieveNo = retrieveService.selectRetrieveNo();
			// System.out.println("시퀀스로 retrieveNo 만들기-----------------"+retrieveNo);
			data.setRetrieveNo(retrieveNo);

			retrieveService.insertRetrieve(data);
			// System.out.println("통과 확인");
		}
		// System.out.println("retrieveNo를 만든 후 가장 큰 retrieveNo 가져오기
		// ------------"+retrieveService.selectMaxRetrieveNo());
		int retrievenum = retrieveService.selectMaxRetrieveNo();
		data.setRetrieveNo(retrievenum);
		retrieveService.insertRetrieveList(data);
		retrieveService.updateProductNum(data);
		retrieveService.zeroProductDelete(data);

		entity = new ResponseEntity<String>(HttpStatus.OK);

		return entity;
	}

	@RequestMapping(value = "/recallrequestDetail", method = RequestMethod.POST)
	public ResponseEntity<List<RetrieveListVO>> recallrequestDetail(String retrieveNo) throws Exception {
		ResponseEntity<List<RetrieveListVO>> entity = null;
		System.out.println("retrieveNo : " + retrieveNo);
		System.out.println("////////////////////"+retrieveNo);
		List<RetrieveListVO> retrieveDetail = retrieveService.getRetriveDetail(retrieveNo);

		entity = new ResponseEntity<List<RetrieveListVO>>(retrieveDetail,HttpStatus.OK);

		return entity;

	}

}
