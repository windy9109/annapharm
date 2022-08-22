package kr.or.annapharm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import kr.or.annapharm.dto.ProductCommandVO;
import kr.or.annapharm.dto.ProductVO;
import kr.or.annapharm.dto.QRVO;
import kr.or.annapharm.dto.ReceiveOrderCartVO;
import kr.or.annapharm.service.ProductService;
import kr.or.annapharm.service.ReceiveOrderService;

@RestController
@RequestMapping("/expert/product")

public class ProductRestController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ReceiveOrderService receiveOrderService;
	
	@RequestMapping(value="/receiveOrderDetail", method = RequestMethod.POST)
	public ResponseEntity<List<ReceiveOrderCartVO>> receiveOrderDetail(int no, String type) throws Exception{
		ResponseEntity<List<ReceiveOrderCartVO>> entity = null;
		
		List<ReceiveOrderCartVO> receiveCart = receiveOrderService.getReceiveCartList(no);
		List<ReceiveOrderCartVO> orderCart = receiveOrderService.getOrderCartList(no);
		if(type.equals("receive")) {
			entity = new ResponseEntity<List<ReceiveOrderCartVO>>(receiveCart,HttpStatus.OK);
		}else {
			entity = new ResponseEntity<List<ReceiveOrderCartVO>>(orderCart,HttpStatus.OK);
		}
		return entity;
	}
	
	 @RequestMapping(value="/productDetail", method = RequestMethod.POST)
	   public ResponseEntity<Map<String, Object>> productDetail(int mdNo) throws Exception{
	      ResponseEntity<Map<String, Object>> entity = null;
	      List<ProductVO> detail = productService.getProductDetail(mdNo);
	      
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("detail", detail);
	      
	      entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	      
	      return entity;
	   }
	 
	 private void insertReceiveData(String medicine, boolean flag, int a) throws Exception { // 입고장 작성 메서드
		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat dateFormatM = new SimpleDateFormat("MM");
			SimpleDateFormat dateFormatD = new SimpleDateFormat("dd");
			ProductCommandVO pro = new ProductCommandVO();
			ObjectMapper objectMapper = new ObjectMapper();
			String pharmacyCode = null;
			int maxRno = receiveOrderService.getMaxReceiveNo();
			pro.setReceiveNo(maxRno + 1); 
			List<String> loginSetting = objectMapper.readValue(medicine, new TypeReference<List>() {}); // 입고장을 먼저 생성할때 사용자 정보 받아 생성
			for(int i = 0; i < loginSetting.size(); i++) {
				Map<String, String> medicineMap = objectMapper.readValue(loginSetting.get(i), new TypeReference<Map<String,String>>() {}); // JSON 데이터를 한번 더 Map에 저장
				String loginMember = (String)medicineMap.get("chemistName");
				pharmacyCode = (String)medicineMap.get("pharmacyCode");
				pro.setPharmacyCode(pharmacyCode);	
				pro.setPiHpid(pharmacyCode);
				pro.setLoginMember(loginMember);
			}
	 
			if(flag == true) {
				receiveOrderService.insertReceive(pro);
			}
		 List<String> medicineList = objectMapper.readValue(medicine, new TypeReference<List>() {});
			for(int i = 0; i < medicineList.size(); i++) {
//				String uuid = UUID.randomUUID().toString();
				Map<String, String> medicineMap = objectMapper.readValue(medicineList.get(i), new TypeReference<Map<String,String>>() {}); // JSON 데이터를 한번 더 Map에 저장
				String receiveDate = (String)medicineMap.get("receiveDate");
//				String receiveDate = "2022.08.01";
				String mdName = (String)medicineMap.get("mdName");
				String miCompany = (String)medicineMap.get("miCompany");
				String miType = (String)medicineMap.get("miType");
				String miPos = (String)medicineMap.get("miPos");
				String miUnit = (String)medicineMap.get("miUnit");
				String mdOwnnum = (String)medicineMap.get("mediNum");
				String mdNo = (String)medicineMap.get("mdNo");
				String mediDate = (String)medicineMap.get("mediDate");
				String miPrice = (String)medicineMap.get("miPrice");
				String mdTerm = (String)medicineMap.get("mdTerm");
				
				
				Date transDate = dateFormat.parse(mediDate); // ajax로 받은 날짜를 date 형식으로 변환
				long mediDateSec = transDate.getTime(); // 제조일 + 제조일로부터 사용날짜를 더하기 위해 date타입을 getTime() 메서드를 사용해 long 형식으로 변환
				
//				mdTerm.substring(mdTerm.length() - 1); // 끝문자 추출
//				mdTerm.substring(0,mdTerm.length() - 1); // 끝문자를 제외한 앞의 숫자 추출
				
				if(mdTerm.substring(mdTerm.length() - 1).equals("M")) { // DB에 'xxM' 으로 저장되어 있는 mdTerm(제조일로부터 ~~M(월))부분 조건문
					Date mType = dateFormatM.parse(mdTerm.substring(0,mdTerm.length() - 1)); // 끝문자의 M을 제거한 숫자를 xx월 Date타입으로 변환
					long mSec = mType.getTime(); // 해당 mdTerm을 getTime() 메서드를 사용해 long형식으로 변환
					long sum = mediDateSec + mSec; // 제조일과 사용기간을 더한 값
					Date sumDate = new Date(sum); // 제조일과 사용기간을 더한 값을 Date 타입으로 다시 변환
					String res = dateFormat.format(sumDate); // 더한 값을 VO에 넣기 위해 'yyyy-MM-dd'형식으로 포맷
					pro.setProductDate(res);
				}else if(mdTerm.substring(mdTerm.length() - 1).equals("D")) { // DB에 'xxD' 으로 저장되어 있는 mdTerm(제조일로부터 ~~M(월))부분 조건문
					Date dType = dateFormatD.parse(mdTerm.substring(0,mdTerm.length() - 1));
					long dSec = dType.getTime();
					long sum = mediDateSec + dSec; 
					Date sumDate = new Date(sum); 
					String res = dateFormat.format(sumDate); 
					pro.setProductDate(res);
				}
				
				pro.setProductQr(pharmacyCode + mdNo + mediDate);
				pro.setMdName(mdName);
				pro.setMiCompany(miCompany);
				pro.setMiType(miType);
				pro.setProductPosition(miPos);
				pro.setProductUnit(miUnit);
				pro.setProductOwnnum(mdOwnnum);
				pro.setMdNo(mdNo);
				pro.setReceiveCartPrice(miPrice);
				pro.setReceiveShelfLife(mediDate);
				pro.setReceiveCartNum(mdOwnnum);
				if(a == 0) {
					pro.setReceiveNo(maxRno + 1);
				}else {
					pro.setReceiveNo(a);
				}
				
				String standardNum = productService.selectStandardOwnnum(pro);
				if(standardNum == null) {
					pro.setProductOwnnumStandard("-1");
				}else {
				pro.setProductOwnnumStandard(standardNum);
				}
					if(productService.selectStandardOwnnum(pro) != null) {
						productService.updateStandardOwnnum(pro);
						pro.setProductOwnnumStandard(productService.selectStandardOwnnum(pro));
						productService.insertProduct(pro);
					}else {
						pro.setProductOwnnumStandard("-1");
						productService.insertStandardOwnnum(pro);
						productService.insertProduct(pro);
					}
				receiveOrderService.insertReceiveCart(pro);
							
				System.out.println("하유.." + receiveDate);
				String yFolder = receiveDate.substring(0,4);
				String dFolder = receiveDate.substring(5,10);
				
				File file = new File("/D:/A_TeachingMaterial/08_Framework/workspace/annapharm/src/main/webapp/QR/"+ yFolder + "/" + dFolder);
				boolean directoryCreated = file.mkdirs();
				
				// QrCode 생성될 파일 경로 및 파일명
				String filePath = file + "/" + pro.getProductQr() +".png";
				System.out.println("파일패쓰"+filePath);
				// 큐알코드 인스턴스 생성
				QRCodeWriter qrCodeWriter = new QRCodeWriter(); // QR 코드
				
				// 생성될 큐알 코드 경로 및 파일명..
				OutputStream out = new FileOutputStream(filePath);
				
				System.out.println("아웃!" + out);
				// 생성될 코드 값에 주입할 데이터
				String qrData = null;
				
				// 한글데이터가 있을 경우  캐릭터셋 설정을 한다.
				qrData = new String(medicineList.get(i).getBytes("UTF-8"), "ISO-8859-1"); 
				BitMatrix bitMatrix = qrCodeWriter.encode(qrData, BarcodeFormat.QR_CODE, 200, 200);
				// zxing에서 스트림에 파일을 뿌릴수있도록 메소드를 지원함.rw
				MatrixToImageWriter.writeToStream(bitMatrix, "png", out);      
			}
	 }
	 
	 private void insertOrderData(String medicine, boolean flag, int a) throws Exception { // 발주서 작성 메서드
			ProductCommandVO pro = new ProductCommandVO();
			ObjectMapper objectMapper = new ObjectMapper();
			int maxOno = receiveOrderService.getMaxOrderNo();
			pro.setOrderNo(maxOno + 1);
			
			List<String> loginSetting = objectMapper.readValue(medicine, new TypeReference<List>() {}); // 입고장을 먼저 생성할때 사용자 정보 받아 생성
			for(int i = 0; i < loginSetting.size(); i++) {
				String uuid = UUID.randomUUID().toString();
				Map<String, String> medicineMap = objectMapper.readValue(loginSetting.get(i), new TypeReference<Map<String,String>>() {}); // JSON 데이터를 한번 더 Map에 저장
				String loginMember = (String)medicineMap.get("chemistName");
				String pharmacyCode = (String)medicineMap.get("pharmacyCode");
				pro.setPharmacyCode(pharmacyCode);	
				pro.setPiHpid(pharmacyCode);
				pro.setLoginMember(loginMember);
			}
			if(flag == true) {
				receiveOrderService.insertOrder(pro);
			}
			
		 List<String> medicineList = objectMapper.readValue(medicine, new TypeReference<List>() {});
		 for(int i = 0; i < medicineList.size(); i++) {
				Map<String, String> medicineMap = objectMapper.readValue(medicineList.get(i), new TypeReference<Map<String,String>>() {}); // JSON 데이터를 한번 더 Map에 저장
				String loginMember = (String)medicineMap.get("chemistName");
				String mdName = (String)medicineMap.get("mdName");
				String miCompany = (String)medicineMap.get("miCompany");
				String miType = (String)medicineMap.get("miType");
				String miUnit = (String)medicineMap.get("miUnit");
				String mdNo = (String)medicineMap.get("mdNo");
				String mdOwnnum = (String)medicineMap.get("mediNum");
				String miPrice = (String)medicineMap.get("miPrice");
				
				pro.setLoginMember(loginMember);
				pro.setMdName(mdName);
				pro.setMiCompany(miCompany);
				pro.setMiType(miType);
				pro.setProductUnit(miUnit);
				pro.setMdNo(mdNo);
				pro.setOrderCartPrice(miPrice);
				pro.setOrderCartNum(mdOwnnum);
				if(a == 0) {
					pro.setOrderNo(maxOno + 1);
				}else {
					pro.setOrderNo(a);
				}
				receiveOrderService.insertOrderCart(pro);
			}
	 }
	 
	@RequestMapping(value="/receiveInsert",method=RequestMethod.POST)
		public String receiveInsert(@RequestBody String medicine) throws Exception{
		if(medicine.equals("[]")) {
			return "fail";
		}
		boolean flag = true;
		int a = 0;
		insertReceiveData(medicine, flag, a);
		return "success";
	}
	
	@RequestMapping(value="/receiveModify",method=RequestMethod.POST)
		public String receiveModify(@RequestBody String medicine) throws Exception{			
			if(medicine.equals("[]")) {
				return "fail";
			}
			ObjectMapper objectMapper = new ObjectMapper();
			boolean flag = false;
			int paramRno = 0;
			 List<String> medicineList = objectMapper.readValue(medicine, new TypeReference<List>() {});
				for(int i = 0; i < medicineList.size(); i++) {
					Map<String, String> medicineMap = objectMapper.readValue(medicineList.get(i), new TypeReference<Map<String,String>>() {}); // JSON 데이터를 한번 더 Map에 저장
					String receiveNo = (String)medicineMap.get("receiveNo");
					paramRno = Integer.parseInt(receiveNo);
					
					productService.deleteProduct(receiveNo); 
					receiveOrderService.deleteReceiveCart(receiveNo);
				}
				insertReceiveData(medicine, flag, paramRno);
			return "success";
	}
	
	@RequestMapping(value="/orderInsert",method=RequestMethod.POST)
		public String OrderInsert(@RequestBody String medicine) throws Exception{
		if(medicine.equals("[]")) {
			return "fail";
		}
		boolean flag = true;
		int a = 0;
		
		insertOrderData(medicine, flag, a);
		return "success";
	}	
	
	@RequestMapping(value="/orderModify",method=RequestMethod.POST)
	public String OrderModify(@RequestBody String medicine) throws Exception{
		if(medicine.equals("[]")) {
			return "fail";
		}
		ObjectMapper objectMapper = new ObjectMapper();
		boolean flag = false;
		 List<String> medicineList = objectMapper.readValue(medicine, new TypeReference<List>() {});
			for(int i = 0; i < medicineList.size(); i++) {
				Map<String, String> medicineMap = objectMapper.readValue(medicineList.get(i), new TypeReference<Map<String,String>>() {}); // JSON 데이터를 한번 더 Map에 저장
				String orderNo = (String)medicineMap.get("orderNo");
				int paramOno = Integer.parseInt(orderNo);
				receiveOrderService.deleteOrderCart(orderNo);
				insertOrderData(medicine, flag, paramOno);
			}
		return "success";
	}
	
	@RequestMapping(value="/receiveDelete", method=RequestMethod.POST)
	public void receiveDelete(@RequestBody String data, HttpServletRequest request) throws Exception{
		String receiveNo = request.getParameter("no");
		productService.deleteProduct(receiveNo);
		receiveOrderService.deleteReceiveCart(receiveNo);
		receiveOrderService.deleteReceive(receiveNo);
	}
	
	@RequestMapping(value="/orderDelete", method=RequestMethod.POST)
	public void orderDelete(@RequestBody String data, HttpServletRequest request) throws Exception{
		String orderNo = request.getParameter("no");
		receiveOrderService.deleteOrderCart(orderNo);
		receiveOrderService.deleteOrder(orderNo);
	}
	
	@RequestMapping(value="/receiveDemoInsert", method=RequestMethod.POST)
	public String receiveDemoSave(@RequestBody String medicine) throws Exception{
		if(medicine.equals("[]")) {
			return "fail";
		}
			ProductCommandVO pro = new ProductCommandVO();
			ObjectMapper objectMapper = new ObjectMapper();
			receiveOrderService.deleteDemoReceiveCart();
			receiveOrderService.deleteDemoReceive();
			int maxRno = receiveOrderService.getMaxReceiveNo();
			pro.setReceiveNo(maxRno + 1); 
			List<String> loginSetting = objectMapper.readValue(medicine, new TypeReference<List>() {}); // 입고장을 먼저 생성할때 사용자 정보 받아 생성
			for(int i = 0; i < loginSetting.size(); i++) {
				Map<String, String> medicineMap = objectMapper.readValue(loginSetting.get(i), new TypeReference<Map<String,String>>() {}); // JSON 데이터를 한번 더 Map에 저장
				String loginMember = (String)medicineMap.get("chemistName");
				String pharmacyCode = (String)medicineMap.get("pharmacyCode");
				pro.setPharmacyCode(pharmacyCode);	
				pro.setPiHpid(pharmacyCode);
				pro.setLoginMember(loginMember);
			}
			receiveOrderService.insertDemoReceive(pro);
			
		 List<String> medicineList = objectMapper.readValue(medicine, new TypeReference<List>() {});
			for(int i = 0; i < medicineList.size(); i++) {
				Map<String, String> medicineMap = objectMapper.readValue(medicineList.get(i), new TypeReference<Map<String,String>>() {}); // JSON 데이터를 한번 더 Map에 저장
				String miPos = (String)medicineMap.get("miPos");
					if(miPos == null) {
						miPos = "";
					}
				String mdOwnnum = (String)medicineMap.get("mediNum");
					if(mdOwnnum == "") {
						mdOwnnum = "0";
					}
				String mdNo = (String)medicineMap.get("mdNo");
				String mediDate = (String)medicineMap.get("mediDate");
					if(mediDate == "") {
						mediDate = "1970-01-01";
					}
				String miPrice = (String)medicineMap.get("miPrice");
				pro.setReceiveCartPosition(miPos);
				pro.setMdNo(mdNo);
				pro.setReceiveCartPrice(miPrice);
				pro.setReceiveShelfLife(mediDate);
				pro.setReceiveCartNum(mdOwnnum);
				pro.setReceiveNo(maxRno + 1);
				receiveOrderService.insertReceiveCart(pro);
			}
		return "success";
	}
	
	@RequestMapping(value="/orderDemoInsert", method=RequestMethod.POST)
	public String OrderDemoSave(@RequestBody String medicine) throws Exception{
		if(medicine.equals("[]")) {
			return "fail";
		}
		ProductCommandVO pro = new ProductCommandVO();
		ObjectMapper objectMapper = new ObjectMapper();
		
		receiveOrderService.deleteDemoOrderCart();
		receiveOrderService.deleteDemoOrder();
		int maxOno = receiveOrderService.getMaxOrderNo();
		pro.setOrderNo(maxOno + 1); 
		List<String> loginSetting = objectMapper.readValue(medicine, new TypeReference<List>() {}); // 입고장을 먼저 생성할때 사용자 정보 받아 생성
		for(int i = 0; i < loginSetting.size(); i++) {
			Map<String, String> medicineMap = objectMapper.readValue(loginSetting.get(i), new TypeReference<Map<String,String>>() {}); // JSON 데이터를 한번 더 Map에 저장
			String loginMember = (String)medicineMap.get("chemistName");
			String pharmacyCode = (String)medicineMap.get("pharmacyCode");
			pro.setPharmacyCode(pharmacyCode);	
			pro.setPiHpid(pharmacyCode);
			pro.setLoginMember(loginMember);
		}
		receiveOrderService.insertDemoOrder(pro);
		
	 List<String> medicineList = objectMapper.readValue(medicine, new TypeReference<List>() {});
	 for(int i = 0; i < medicineList.size(); i++) {
			Map<String, String> medicineMap = objectMapper.readValue(medicineList.get(i), new TypeReference<Map<String,String>>() {}); // JSON 데이터를 한번 더 Map에 저장
			String mdNo = (String)medicineMap.get("mdNo");
			String mdOwnnum = (String)medicineMap.get("mediNum");
			if(mdOwnnum == "") {
				mdOwnnum = "0";
			}
			String miPrice = (String)medicineMap.get("miPrice");
			
			pro.setMdNo(mdNo);
			pro.setOrderCartPrice(miPrice);
			pro.setOrderCartNum(mdOwnnum);
			pro.setOrderNo(maxOno + 1);
			receiveOrderService.insertOrderCart(pro);
		}
		return "success";
	}
	
	@RequestMapping("/deleteReceiveDemo")
	public void DeleteRDemo()throws Exception{
		receiveOrderService.deleteDemoReceiveCart();
		receiveOrderService.deleteDemoReceive();
	}
	
	@RequestMapping("/deleteOrderDemo")
	public void DeleteODemo() throws Exception{
		receiveOrderService.deleteDemoOrderCart();
		receiveOrderService.deleteDemoOrder();
	}
	
	@RequestMapping(value="/finalOpenQR", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<QRVO>> fianlOpenQR(@RequestBody String qrData) throws Exception{
		ResponseEntity<List<QRVO>> entity = null;
		System.out.println("qrData" + qrData);
		ObjectMapper objectMapper = new ObjectMapper();
		List<QRVO> qrList = new ArrayList<QRVO>();
		
		List<String> qrDataList = objectMapper.readValue(qrData, new TypeReference<List>() {});
		for(int i = 0; i < qrDataList.size(); i++) {
			QRVO qr = new QRVO();
			Map<String, String> qrDataMap = objectMapper.readValue(qrDataList.get(i), new TypeReference<Map<String,String>>() {}); // JSON 데이터를 한번 더 Map에 저장
			String mdName = (String)qrDataMap.get("mdName");
			String medi  =(String)qrDataMap.get("medi");
			String mdNum = (String)qrDataMap.get("mdNum");
			String qrName = (String)qrDataMap.get("qrName");
			int intMdNum = Integer.parseInt(mdNum);
			String year = (String)qrDataMap.get("year");
			String date = (String)qrDataMap.get("date");
			
			qr.setMdName(mdName);
			qr.setMedi(medi); 
			qr.setMdNum(intMdNum);
			qr.setQrName(qrName);
			qr.setYear(year);
			qr.setDate(date);
			
			qrList.add(qr);
		}
		
		entity = new ResponseEntity<List<QRVO>>(qrList, HttpStatus.OK);
		return entity;
	}
}

















