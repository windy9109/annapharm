package kr.or.annapharm.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.ProductCommandVO;
import kr.or.annapharm.dto.ProductVO;
import kr.or.annapharm.dto.ReceiveOrderCartVO;
import kr.or.annapharm.dto.QRVO;
import kr.or.annapharm.service.ClassficationService;
import kr.or.annapharm.service.ProductService;
import kr.or.annapharm.service.ReceiveOrderService;
@Controller
@RequestMapping("/expert/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ReceiveOrderService receiveOrderService;
	
	@Autowired
	private ClassficationService classficationService;
	
	@RequestMapping("/product") // 재고관리 목록의 재고현황 리스트 출력
	public ModelAndView listForm(SearchCriteria cri, ModelAndView mnv) throws Exception{
		String url = "expert/product/product";
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/receiveOrder") // 입고장, 발주서 목록 출려억
	public ModelAndView receiveOrderlist(SearchCriteria cri, ModelAndView mnv) throws Exception{
		String url = "expert/product/receiveOrder";
		Map<String, Object> receiveOrder = new HashMap<String, Object>();
		String strEndDate = cri.getEndDate(); // 입고장, 발주서 검색목록에서의 끝날짜를 받아옴 -> ex) 2022-07-27
		
		if(strEndDate != null) {
			String realEndDate = strEndDate.replace("-", ""); // 20220727 형태로 변경
//			int intEndDate = Integer.parseInt(realEndDate);
			cri.setEndDate(realEndDate);
		}
		
		
		if(cri.getSearchType() == null) {
			cri.setSearchType("receive");
		}else {
			if(cri.getSearchType().equals("receive")) {
				receiveOrder = receiveOrderService.getReceiveList(cri);
			}else {
				receiveOrder = receiveOrderService.getOrderList(cri);
			}
		}	
		List<ReceiveOrderCartVO> RDemoCartList = receiveOrderService.getReceiveDemoCartList();
		List<ReceiveOrderCartVO> ODemoCartList = receiveOrderService.getOrderDemoCartList();
		mnv.addObject("receiveOrder", receiveOrder);
		mnv.addObject("RDemoCartList",RDemoCartList);
		mnv.addObject("ODemoCartList",ODemoCartList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/ownList") // 재고관리 목록의 재고현황 리스트 출력
	public ModelAndView ownList(SearchCriteria cri, ModelAndView mnv) throws Exception{
		String url = "expert/product/ownList";
		
		Map<String, Object> product = productService.getProductList(cri);
		
		Map<String, Object> productClass = classficationService.getClassficationList(cri);
		
		mnv.addObject("product", product);
		mnv.addObject("productClass", productClass);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/product_detail") // 약 상세정보를 새창을 띄워 보여줌
	public ModelAndView detail(int mdNo, String from, ModelAndView mnv) throws SQLException{
		String url ="expert/product/product_detail";
		
		List<ProductVO> dataMap = null;
		
		dataMap = productService.getProductDetail(mdNo);
		
		mnv.addObject("productDetailList", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}

	@ResponseBody
	@RequestMapping(value="/update",method=RequestMethod.POST) // 약 상세정보를 수정하도록 해줌
	public String modify(@RequestBody String detail) throws Exception{
		String url = "redirect:/expert/product/product_detail.do";
		ProductCommandVO pro = new ProductCommandVO();
		ObjectMapper objectMapper = new ObjectMapper();
		
		List<String> detailList = objectMapper.readValue(detail, new TypeReference<List>() {}); // JSON 데이터를 List에 저장
		for(int i = 0; i< detailList.size(); i++) {
			Map<String,String> detailMap = objectMapper.readValue(detailList.get(i), new TypeReference<Map<String,String>>() {}); // JSON 데이터를 한번 더 Map에 저장
			String pharmacyCode = (String)detailMap.get("pharmacyCode");
			String mdNo = (String)detailMap.get("mdNo");
			String proQr = (String)detailMap.get("productQr"); // String 타입으로 변환해서 넣어주기.
			String proDate = (String)detailMap.get("productDate");
			String proPos = (String)detailMap.get("productPosition");
			String proOs = (String)detailMap.get("productOwnnumStandard");
			
			pro.setPiHpid(pharmacyCode);
			pro.setMdNo(mdNo);
			pro.setProductQr(proQr);
			pro.setProductDate(proDate);
			pro.setProductPosition(proPos);
			pro.setProductOwnnumStandard(proOs);
			
			productService.updateStandardOwnnum(pro);
			productService.updateProductDetail(pro);
		}
		
		return url;
	}
		
	@RequestMapping("/receiveWrite")
	public ModelAndView ReceiveWrite(ModelAndView mnv) throws Exception{
		String url = "expert/product/receiveWrite";
		
		SearchCriteria cri = null;
		Map<String, Object> dataMap = classficationService.getClassficationList(cri);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/orderWrite")
	public ModelAndView OrderWrite(ModelAndView mnv) throws Exception{
		String url = "expert/product/orderWrite";
		
		SearchCriteria cri = null;
		Map<String, Object> dataMap = classficationService.getClassficationList(cri);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/receiveDetail")
	public ModelAndView ReceiveModify(int receiveNo, ModelAndView mnv) throws Exception{
		String url = "expert/product/receiveWrite";
		SearchCriteria cri = null;
		Map<String, Object> dataMap = classficationService.getClassficationList(cri);
		List<ReceiveOrderCartVO> receiveCartList = receiveOrderService.getReceiveCartList(receiveNo);
		mnv.addObject("receiveCartList",receiveCartList);	
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/orderDetail")
	public ModelAndView OrderModify(int orderNo, ModelAndView mnv) throws Exception{
		String url = "expert/product/orderWrite";
		
		SearchCriteria cri = null;
		Map<String, Object> dataMap = classficationService.getClassficationList(cri);
		List<ReceiveOrderCartVO> orderCartList = receiveOrderService.getOrderCartList(orderNo);
		mnv.addObject("orderCartList",orderCartList);	
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/lackProOrderWrite") // 부족품 신청하는 컨트롤러
	public ModelAndView lackProOrderWrite(ModelAndView mnv) throws Exception{
		String url = "expert/product/orderWrite";
		
		SearchCriteria cri = new SearchCriteria();
		Map<String,Object> productMap = productService.getProductList(cri);
		List<ProductVO> productList = (List<ProductVO>)productMap.get("firstProductList");
		List<ProductVO> lackProOrderList = new ArrayList<ProductVO>();
		
		for(int i = 0 ; i < productList.size(); i++) {
			if(productList.get(i).getWarnMark() == "Y") {
				lackProOrderList.add(productList.get(i));
			}
		}
		mnv.addObject("lackProOrderList",lackProOrderList);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/receiveDemoCartList") // 입고장 임시저장 목록을 불러오는 컨트롤러
	public ModelAndView ReceiveDemoCartList(ModelAndView mnv) throws Exception{
		String url = "expert/product/receiveWrite";
		SearchCriteria cri = null;
		
		Map<String, Object> dataMap = classficationService.getClassficationList(cri);
		List<ReceiveOrderCartVO> RDemoCartList = receiveOrderService.getReceiveDemoCartList();
		for(ReceiveOrderCartVO vo : RDemoCartList) {
			if(vo.getReceiveShelfLife().equals("1970-01-01")) {
				vo.setReceiveShelfLifeDemo("");
			}
		}
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("RDemoCartList",RDemoCartList);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/orderDemoCartList") // 입고장 임시저장 목록을 불러오는 컨트롤러
	public ModelAndView OrderDemoCartList(ModelAndView mnv) throws Exception{
		String url = "expert/product/orderWrite";
		SearchCriteria cri = null;
		
		Map<String, Object> dataMap = classficationService.getClassficationList(cri);
		List<ReceiveOrderCartVO> ODemoCartList = receiveOrderService.getOrderDemoCartList();
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("ODemoCartList", ODemoCartList);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/printQR") // QR태그 생성
	public ModelAndView printQR(int receiveNo, ModelAndView mnv) throws Exception{
		String url = "expert/product/printQR";
		List<ReceiveOrderCartVO> receiveCartList = receiveOrderService.getReceiveCartList(receiveNo);
		
		mnv.addObject("receiveCartList",receiveCartList);	
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/finalPrintQR") // QR태그 생성
	public ModelAndView finalPrintQR( ModelAndView mnv) throws Exception{
		String url = "expert/product/finalPrintQR";
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/receiveQR")
	public ModelAndView qrRead(ModelAndView mnv) throws Exception{
		String url = "expert/product/receiveQR";
		mnv.setViewName(url);
		return mnv;
		
	}
}

















