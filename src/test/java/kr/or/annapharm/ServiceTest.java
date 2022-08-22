package kr.or.annapharm;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.or.annapharm.command.PageMaker;
import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.CompareMedicineVO;
import kr.or.annapharm.dto.FindPharmacyCommandVO;
import kr.or.annapharm.dto.LongPrescriptionDetailVO;
import kr.or.annapharm.dto.PharmacyInfoMapVO;
import kr.or.annapharm.dto.PreferMedicineVO;
import kr.or.annapharm.dto.ProductVO;
import kr.or.annapharm.dto.SalesByAgeVO;
import kr.or.annapharm.dto.SearchMedicineVO;
import kr.or.annapharm.service.BusinessService;
import kr.or.annapharm.service.ProductService;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:kr/or/annapharm/context/root-context.xml")
public class ServiceTest {

	@Autowired
	private BusinessService service;
	
	@Autowired
	private ProductService productService; 

	@Test
	public void testBusinessService() throws Exception{
		
		SearchCriteria cri = new SearchCriteria();
		cri.setKeyword("산염");
		cri.setPerPageNum(7);
		
		Map<String, Object> dataMap = service.searchBasisList(cri);
		List<SearchMedicineVO> list = (List<SearchMedicineVO>) dataMap.get("searchBasisList");
		PageMaker pageMaker = (PageMaker)dataMap.get("pageMaker");
		
		Assert.assertNotNull(dataMap);
		Assert.assertEquals(7, list.size());
		Assert.assertEquals(698, pageMaker.getTotalCount());
	
	}
	
	@Test
	public void testCompareMedicineService() throws Exception {
		
		String miMaincode = "240301ATB";
		
		List<CompareMedicineVO> compareList = service.getCompareList(miMaincode);
		
		Assert.assertEquals(28,compareList.size());
	}
	
//	@Test
//	public void testSalesByAgeListService() throws Exception{
//		
//		String startDate = "2022-06-10";
//		String endDate = "2022-07-10";
//		
//		SearchCriteria cri = new SearchCriteria();
//		cri.setEndDate(endDate);
//		cri.setStartDate(startDate);
//		
//		List<SalesByAgeVO> list = (List<SalesByAgeVO>) service.getSalesByAgeList(cri).get("salesByAgeList");
//		
//		for(SalesByAgeVO vo : list) {
//			System.out.println(vo);
//		}
//	}
//	
//	@Test
//	public void testPreferMedicineListService() throws Exception{
//		String startDate = "2022-06-10";
//		String endDate = "2022-07-10";
//		String sex = "남성";
//		int age = 10;
//		
//		PreferMedicineVO preferMedicineVO = new PreferMedicineVO();
//		preferMedicineVO.setStartDate(startDate);
//		preferMedicineVO.setEndDate(endDate);
//		preferMedicineVO.setSex(sex);
//		preferMedicineVO.setAge(age);
//		
//		
//		Map<String, Object>dataMap = service.getPreferMedicineList(preferMedicineVO);
//		PageMaker pageMaker = (PageMaker) dataMap.get("pageMaker");
//		List<PreferMedicineVO> list = (List<PreferMedicineVO>) dataMap.get("preferMedicineList");
//		
//		System.out.println(pageMaker.getCri().getPerPageNum());
//		for(PreferMedicineVO vo : list) {
//			System.out.println(vo);
//		}
//	}
	
	@Test
	public void productServiceTest() throws Exception{
		
		List<ProductVO> list = productService.getProductDetail(201603594);
		
		for(ProductVO vo : list) {
			System.out.println(vo);
		}
		
	}
	
	@Test
	public void test1() throws Exception{
		List<LongPrescriptionDetailVO> list = service.getLongPrescriptionDetailList("2206240001");
	}
	
	@Test
	public void findPharmacy() throws Exception{
		
		List<FindPharmacyCommandVO> list = new ArrayList<FindPharmacyCommandVO>();
		
		FindPharmacyCommandVO command = new FindPharmacyCommandVO();
		command.setPhone("042-222-0666");
		command.setPlaceName("오룡대형약국");
		command.setX("127.406564753256");
		list.add(command);
		
		command.setPhone("042-252-3864");
		command.setPlaceName("세종약국");
		command.setX("127.406564753256");
		list.add(command);
		
		command.setPhone("042-222-0666");
		command.setPlaceName("오룡대형약국");
		command.setX("127.406564753256");
		list.add(command);
		
		
		
//		PharmacyInfoMapVO vo = service.getPharmacyInfoList(commandList)
//		vo.setX(command.getX());
//		
//		System.out.println(vo);
	}
	
	@Test
	public void pharmacyInfo() throws Exception{
		String piHpid = "C2106694";
		
		PharmacyInfoMapVO vo = service.getPharmacyInfoDetail(piHpid);
		
		System.out.println(vo);
		
	}
	
	
	
}
