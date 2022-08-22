package kr.or.annapharm;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dto.AnalysisPrescriptionVO;
import kr.or.annapharm.dto.FindPharmacyCommandVO;
import kr.or.annapharm.dto.LongPrescriptionCommandVO;
import kr.or.annapharm.dto.LongPrescriptionDetailVO;
import kr.or.annapharm.dto.LongPrescriptionVO;
import kr.or.annapharm.dto.PharmacyInfoMapVO;
import kr.or.annapharm.dto.PreferMedicineVO;
import kr.or.annapharm.dto.SelectListVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:kr/or/annapharm/context/root-context.xml")
public class SessionTest {
	
	@Autowired
	private SqlSession session;
	
//	@Before
//	public void init()throws SQLException{
//		medicineDAO = se
//	}
//	
//	@After
//	public void destroy() throws SQLException{
//		conn.close();
//	}
	
//	@Test
//	public void testSQL() throws Exception{
//		MedicineVO vo = medicineDAO.selectMedicineAll(200002787);
//		
//		List<CompareMedicineVO> company = session.selectList("Business-Mapper.selectCompareMedicine","염산염");
//		
//		Assert.assertEquals(10, company.size());
//	}
	
//	@Test
//	public void compareMedicineTest() throws Exception{
//		List<CompareMedicineVO> compareList = session.selectList("Business-Mapper.selectCompareMedicine","240301ATB");
//		
//		Assert.assertEquals(28,compareList.size());
//	}
	
//	@Test
//	public void selectListInsertTest() throws Exception{
//		
//		String chemistCode = "F00001";
//		int mdNo = 201907931;
//		
//		SelectListVO vo = new SelectListVO();
//		vo.setChemistCode(chemistCode);
//		vo.setMdNo(mdNo);
//		
//		
//		int result = session.update("Business-Mapper.insertSelectList",vo);
//		
//		Assert.assertEquals(1, result);
//	}
	
//	@Test
//	public void selectListDeleteTest() throws Exception{
//		String chemistCode = "F00001";
//		int mdNo = 201907931;
//		
//		SelectListVO vo = new SelectListVO();
//		vo.setChemistCode(chemistCode);
//		vo.setMdNo(mdNo);
//		
//		int result = session.delete("Business-Mapper.deleteSelectList",vo);
//		
//		Assert.assertEquals(0, result);
//	}
	
	@Test
	public void selectListTest() throws Exception{
		String chemistCode = "F00001";
		
		List<SelectListVO> list = session.selectList("Business-Mapper.selectSelectList",chemistCode);
		
		Assert.assertEquals(0, list.size());
		
	}
	
//	@Test
//	public void salesByAgeListRealTest() throws Exception{
//		String startDate = "2022-06-10";
//		String endDate = "2022-07-10";
//		
//		SearchCriteria cri = new SearchCriteria();
//		cri.setEndDate(endDate);
//		cri.setStartDate(startDate);
//		
//		List<SalesByAgeVO> list = session.selectList("Business-Mapper.salesByAgeReal",cri);
//		
//		for(SalesByAgeVO vo : list) {
//			System.out.println(vo);
//		}
//		
//	}
	
	@Test
	public void preferMedicineListTest() throws Exception{
		String startDate = "2022-06-10";
		String endDate = "2022-07-10";
		String sex = "남성";
		int age = 10;
		
		PreferMedicineVO vo = new PreferMedicineVO();
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);
		vo.setSex(sex);
		vo.setAge(age);
		
		List<PreferMedicineVO> list = session.selectList("Business-Mapper.preferMedicineList",vo);
		
		int count =session.selectOne("Business-Mapper.preferMedicineCount",vo);
		
		for(PreferMedicineVO vo1 : list) {
			System.out.println(vo1);
		}
		
		Assert.assertEquals(13, count);
	}
	
	@Test
	public void longPrescriptionTest() throws Exception {
		String piHpid = "c2104147";
		int preDrugDay = 2;
		String psCode = "2207120064";
		
		LongPrescriptionCommandVO vo = new LongPrescriptionCommandVO();
		vo.setPiHpid(piHpid);
		vo.setPsCode(psCode);
		vo.setPreDrugDay(preDrugDay);
		
		System.out.println(vo.getPsCode());
		
		List<LongPrescriptionDetailVO> longDetailList = session.selectList("Business-Mapper.longPrescriptionDetail",psCode);
		List<LongPrescriptionVO> longList = session.selectList("Business-Mapper.longPrescription",vo);
		int longCount = session.selectOne("Business-Mapper.longPrescriptionCount",vo);
		
		for(LongPrescriptionDetailVO vo1 : longDetailList) {
			System.out.println(vo1);
		}
		
		for(LongPrescriptionVO vo2 : longList) {
			System.out.println(vo2);
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
		
		List<PreferMedicineVO> list = session.selectList("ExpertDashBoard-Mapper.selectMaximumSalesList", cri);
		
		for(PreferMedicineVO vo : list) {
			System.out.println("test5" + vo);
		}
	}
	
	@Test
	public void dashBaordTest2() throws Exception{
		SearchCriteria cri = new SearchCriteria();
		String startDate = "2022-06-23";
		String endDate = "2022-07-10";
		
		cri.setEndDate(endDate);
		cri.setStartDate(startDate);
		
		List<PreferMedicineVO> list = session.selectList("ExpertDashBoard-Mapper.selectMaximumPxList", cri);
		
		for(PreferMedicineVO vo : list) {
			System.out.println(vo);
		}
	}
	
	@Test
	public void dashBoardTest3() throws Exception{
		SearchCriteria cri = new SearchCriteria();
		String startDate = "2022-06-23";
		String endDate = "2022-07-10";
		
		cri.setEndDate(endDate);
		cri.setStartDate(startDate);
		
		List<AnalysisPrescriptionVO> list = session.selectList("ExpertDashBoard-Mapper.analysisPrescription", cri);
		
		for(AnalysisPrescriptionVO vo : list) {
			System.out.println(vo);
		}
	}
	
//	@Test
//	public void medicineDetailTableTest() throws Exception{
//		int mdNo = 199907156;
//		
//		List<MedicineDetailTableVO> list = session.selectList("Business-Mapper.medicineDetailTable",mdNo);
//		
//		Assert.assertEquals("", list.get(0).getMdName());
//	}
	
	@Test
	public void dashBoardTest5() throws Exception{
		SearchCriteria cri = new SearchCriteria();
		String startDate = "2022-07-02";
		String endDate = "2022-08-02";
		
		cri.setEndDate(endDate);
		cri.setStartDate(startDate);
		
		List<PreferMedicineVO> list = session.selectList("ExpertDashBoard-Mapper.selectMaximumSalesList", cri);
		
		for(PreferMedicineVO vo : list) {
			System.out.println("test5" + vo);
		}
	}
	
	@Test
	public void findPharmacy() throws Exception{
		
		FindPharmacyCommandVO command = new FindPharmacyCommandVO();
		command.setPhone("042-222-0666");
		command.setPlaceName("오룡대형약국");
		
		PharmacyInfoMapVO vo = session.selectOne("Business-Mapper.pharmacyInfo",command);
		vo.setX("1234564");
		
		System.out.println(vo);
	}

}
















































