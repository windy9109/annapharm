package kr.or.annapharm.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.annapharm.command.Crawling;
import kr.or.annapharm.dao.MedicineDAO;
import kr.or.annapharm.dao.MedicineInfoDAO;
import kr.or.annapharm.dto.MedicineDetailTableVO;
import kr.or.annapharm.dto.MedicineVO;
import kr.or.annapharm.service.BusinessService;

@Controller
public class MedicineDetailController {
   @Autowired
   private MedicineDAO medicineDAO;
   
   @Autowired
   private MedicineInfoDAO medicineInfoDAO;
   
   @Autowired
   private BusinessService businessService;
   
   @RequestMapping("/medicinedetailone")
   public ModelAndView mddetail(int mdNo, ModelAndView mnv) throws Exception {
      
      String url="expert/viewT/medicine_detail";
      
      Map<String, List<String>> detail = Crawling.getAttention(mdNo);
      
      String company = medicineInfoDAO.selectMedicineCompany(mdNo);
      
      List<String> keyList = new ArrayList<String>(detail.keySet());
      Collections.sort(keyList);
      
      keyList.remove("use");
      keyList.remove("effect");
      
      MedicineVO vo = medicineDAO.selectMedicineAll(mdNo);
      
      mnv.addObject("dataMap",detail);
      mnv.addObject("keyList",keyList);
      mnv.addObject("company",company);
      mnv.addObject("vo",vo);
      mnv.setViewName(url);
      
      return mnv;
      
   }
  
   @RequestMapping(value = "/medicinedetail/{mdNo}", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
   @ResponseBody
   public ResponseEntity<Map<String, Object>> mddetail(@PathVariable("mdNo")int mdNo) throws Exception {
	   
	   Map<String, Object> dataMap = new HashMap<String, Object>();
	   
	   Map<String, List<String>> detail = Crawling.getAttention(mdNo);
	   
	   String company = medicineInfoDAO.selectMedicineCompany(mdNo);
	   
	   List<String> keyList = new ArrayList<String>(detail.keySet());
	   Collections.sort(keyList);
	   
	   keyList.remove("use");
	   keyList.remove("effect");
	   
	   MedicineVO vo = medicineDAO.selectMedicineAll(mdNo);
	   
	   dataMap.put("detail",detail);
	   dataMap.put("keyList",keyList);
	   dataMap.put("company",company);
	   dataMap.put("vo",vo);
	   
	   ResponseEntity<Map<String, Object>> entity = null;
		
	   entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
	  
	   return entity;
	   
   }
   
   @RequestMapping("/medicinedetailTable")
	public ModelAndView mddetail(String mdNo, String avgPrice, ModelAndView mnv) throws Exception {
		
		String url="expert/viewT/medicine_detail_table";
		
//		System.out.println(mdNo);
		String[] mdNoString = mdNo.split("i");
		
		List<Integer> mdNoList = new ArrayList<Integer>();
		
		for(String str : mdNoString) {
			mdNoList.add(Integer.parseInt(str));
		}
		
		List<MedicineDetailTableVO> medicineDetailTableList = businessService.getMedicineDetailTableList(mdNoList);
		
		//	System.out.println(Arrays.toString(mdNoList));
	
//		for(String str : mdNoList) {
//			int mdNum = Integer.parseInt(str);
//			dataMap = new HashMap<String, Object>();
//			Map<String, List<String>> detail = Crawling.getAttention(mdNum);
//			
//			String company = medicineInfoDAO.selectMedicineCompany(mdNum);
//			
//			List<String> keyList = new ArrayList<String>(detail.keySet());
//			Collections.sort(keyList);
//			
//			keyList.remove("use");
//			keyList.remove("effect");
//			
//			MedicineVO vo = medicineDAO.selectMedicineAll(mdNum);	
//			dataMap.put("detail",detail);
//			dataMap.put("keyList",keyList);
//			dataMap.put("company",company);
//			dataMap.put("vo",vo);
//			
//			mnv.addObject("frist",dataMap);
//		}	
//		mnv.addObject("mdNoList", mdNoList);
		mnv.addObject("medicineDetailTableList", medicineDetailTableList);
		mnv.setViewName(url);
		mnv.addObject("avgPrice",Integer.parseInt(avgPrice.replace(",", "")));
		
		return mnv;
	}
   
}




