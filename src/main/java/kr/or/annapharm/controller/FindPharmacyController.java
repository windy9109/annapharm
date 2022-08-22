package kr.or.annapharm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.FindPharmacyCommandVO;
import kr.or.annapharm.dto.PharmacyInfoMapVO;
import kr.or.annapharm.dto.PharmacyInfoVO;
import kr.or.annapharm.dto.ProductVO;
import kr.or.annapharm.service.BusinessService;

@Controller
@RequestMapping("/searchPharmacy")
public class FindPharmacyController {
//	/annapharm/searchPharmacy/main.do
	
	@Autowired
	BusinessService businessService; 
	
	@RequestMapping("/main")
	public String main() throws Exception {
		String url = "/main/find_pharmacy/findpharmacy";
		return url;
	}
	
	@RequestMapping(value = "/getMakerInfo", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<PharmacyInfoMapVO>> getMakerInfo(@RequestBody List<FindPharmacyCommandVO> commandList) throws Exception{
		ResponseEntity<List<PharmacyInfoMapVO>> entity = null;		
		
		for(FindPharmacyCommandVO vo : commandList) {
			System.out.println(vo);
		}
		
		List<PharmacyInfoMapVO> list = businessService.getPharmacyInfoList(commandList);
		
		entity = new ResponseEntity<List<PharmacyInfoMapVO>>(list, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value = "/getMakerInfoDetail", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<PharmacyInfoMapVO> pharmacyInfoDetail(@RequestBody PharmacyInfoVO vo) throws Exception{
		ResponseEntity<PharmacyInfoMapVO> entity = null;		
	
		PharmacyInfoMapVO PIMVO = businessService.getPharmacyInfoDetail(vo.getPiHpid());
		
		entity = new ResponseEntity<PharmacyInfoMapVO>(PIMVO, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/detail")
	public ModelAndView goDetaillInfo(String piHpid, ModelAndView mnv) throws Exception{
		
		String url = "expert/viewT/pharmacyDetail";
		
		PharmacyInfoMapVO pharmacyInfoDetail = businessService.getPharmacyInfoDetail(piHpid);
		
		List<ProductVO> pharmacyProductInfo = businessService.getPharmacyProductInfo(piHpid);
		
		mnv.addObject("pharmacyInfoDetail", pharmacyInfoDetail);
		mnv.addObject("pharmacyProductInfo", pharmacyProductInfo);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "/searchPharmacy", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<PharmacyInfoMapVO>> searchPharmacy(SearchCriteria cri) throws Exception{
		
		ResponseEntity<List<PharmacyInfoMapVO>> entity = null;
		
		List<PharmacyInfoMapVO> list = businessService.getSearchPharmacy(cri.getKeyword());
		
		entity = new ResponseEntity<List<PharmacyInfoMapVO>>(list,HttpStatus.OK);
		
		return entity;	
	}
	
	@RequestMapping(value = "/goPharmacy", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<PharmacyInfoMapVO> goPharmacy(String piHpid) throws Exception{
		
		ResponseEntity<PharmacyInfoMapVO> entity = null;
		
		PharmacyInfoMapVO vo = businessService.getGoPharmacy(piHpid);
		
		entity = new ResponseEntity<PharmacyInfoMapVO>(vo,HttpStatus.OK);
		
		return entity;
	}
}
