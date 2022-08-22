package kr.or.annapharm;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dao.BusinessDAO;
import kr.or.annapharm.dao.ExpertDashBoardDAO;
import kr.or.annapharm.dto.CompareMedicineVO;
import kr.or.annapharm.dto.FindPharmacyCommandVO;
import kr.or.annapharm.dto.LongPrescriptionCommandVO;
import kr.or.annapharm.dto.LongPrescriptionDetailVO;
import kr.or.annapharm.dto.LongPrescriptionVO;
import kr.or.annapharm.dto.PharmacyInfoMapVO;
import kr.or.annapharm.dto.PreferMedicineVO;
import kr.or.annapharm.dto.SalesByAgeVO;
import kr.or.annapharm.dto.SearchMedicineVO;
import kr.or.annapharm.dto.SelectListVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:kr/or/annapharm/context/root-context.xml")
public class DAOTest {
	
	@Autowired
	private BusinessDAO businessDAO; 
	
	@Autowired
	private ExpertDashBoardDAO dao;
	
//	@Before
//	public void init()throws SQLException{
//		medicineDAO = se
//	}
//	
//	@After
//	public void destroy() throws SQLException{
//		conn.close();
//	}
	
	@Test
	public void testSQL() throws Exception{
//		MedicineVO vo = medicineDAO.selectMedicineAll(200002787);
		
		SearchCriteria cri = new SearchCriteria();
		cri.setKeyword("염산염");
		
		List<SearchMedicineVO> company = businessDAO.selectSearchBasis(cri);
		
		Assert.assertEquals(11, company.size());
	}
	
	@Test
	public void compareMedicineDAOTest() throws Exception{
		String miMaincode = "240301ATB";
		
		List<CompareMedicineVO> compareList = businessDAO.selectCompareMedicine(miMaincode);
		
		Assert.assertEquals(28,compareList.size());
	}
	
	@Test
	public void selectListDAOTest() throws Exception{
		String chemistCode = "F00001";
		int mdNo = 201907931;
		
		SelectListVO vo = new SelectListVO();
		vo.setChemistCode(chemistCode);
		vo.setMdNo(mdNo);
		
		//businessDAO.insertSelectList(vo);
		businessDAO.deleteSelectList(vo);
	}
	
	@Test
	public void salesByAgeListTest() throws Exception{
		String startDate = "2022-06-10";
		String endDate = "2022-07-10";
		
		SearchCriteria cri = new SearchCriteria();
		cri.setEndDate(endDate);
		cri.setStartDate(startDate);
		
		List<SalesByAgeVO> list = businessDAO.salesByAgeList(cri);
		
		for(SalesByAgeVO vo : list) {
			System.out.println(vo);
		}
	}

	@Test
	public void preferMedicineDAOTest() throws Exception{
		String startDate = "2022-06-10";
		String endDate = "2022-07-10";
		String sex = "남성";
		int age = 10;
		
		PreferMedicineVO preferMedicineVO = new PreferMedicineVO();
		preferMedicineVO.setStartDate(startDate);
		preferMedicineVO.setEndDate(endDate);
		preferMedicineVO.setSex(sex);
		preferMedicineVO.setAge(age);
		
		List<PreferMedicineVO> list = businessDAO.preferMedicineList(preferMedicineVO);
		
		int count = businessDAO.preferMedicineCount(preferMedicineVO);
		
		for(PreferMedicineVO vo1 : list) {
			System.out.println(vo1);
		}
		
		Assert.assertEquals(13, count);
		
	}
	
	@Test
	public void longPrescriptionDAOTest() throws Exception {
		String piHpid = "c2104147";
		int preDrugDay = 2;
		String psCode = "2207120064";
		
		LongPrescriptionCommandVO commandVO = new LongPrescriptionCommandVO();
		commandVO.setPiHpid(piHpid);
		commandVO.setPsCode(psCode);
		commandVO.setPreDrugDay(preDrugDay);
		
		List<LongPrescriptionDetailVO> longDetailList = businessDAO.longPrescriptionDetail(psCode);
		List<LongPrescriptionVO> longList = businessDAO.longPrescription(commandVO);
		int longCount = businessDAO.longPrescriptionCount(commandVO);
		
//		List<String> psCodeList = longList.stream().map(e -> e.getPsCode()).collect(Collectors.toCollection(ArrayList::new));
		
		for(LongPrescriptionDetailVO vo1 : longDetailList) {
			System.out.println(vo1.getPsCode());
		}

		for(LongPrescriptionVO vo2 : longList) {
			psCode = vo2.getPsCode();
			longDetailList = businessDAO.longPrescriptionDetail(psCode);
			for(LongPrescriptionDetailVO longDetail : longDetailList) {
				if(longDetail.getOwnNumCheck().equals("부족")) {
					vo2.setOwnNumCheck("부족");
					break;
				}
			}
		}
		
		for(LongPrescriptionVO vo : longList) {
			System.out.println(vo);			
		}
		
		System.out.println(longCount);
	}
	
	@Test
	public void dashBoardTest() throws Exception{
		SearchCriteria cri = new SearchCriteria();
		String startDate = "2022-07-02";
		String endDate = "2022-08-02";
		
		cri.setEndDate(endDate);
		cri.setStartDate(startDate);
		
		List<PreferMedicineVO> list = dao.selectMaximumSalesList(cri);
		
		for(PreferMedicineVO vo : list) {
			System.out.println("test5" + vo);
		}
	}
	
	
	@Test
	public void findPharmacy() throws Exception{
		
		FindPharmacyCommandVO command = new FindPharmacyCommandVO();
		command.setPhone("042-222-0666");
		command.setPlaceName("오룡대형약국");
		command.setX("127.406564753256");
		
		PharmacyInfoMapVO vo = businessDAO.pharmacyInfo(command);
		vo.setX(command.getX());
		
		System.out.println(vo);
	}
}
