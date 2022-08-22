package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.record.common.PhRun;

import kr.or.annapharm.command.Criteria;
import kr.or.annapharm.command.PageMaker;
import kr.or.annapharm.command.PageMakerSort;
import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dao.BusinessDAO;
import kr.or.annapharm.dto.CompareMedicineVO;
import kr.or.annapharm.dto.FindPharmacyCommandVO;
import kr.or.annapharm.dto.LongPrescriptionCommandVO;
import kr.or.annapharm.dto.LongPrescriptionDetailVO;
import kr.or.annapharm.dto.LongPrescriptionVO;
import kr.or.annapharm.dto.MedicineDetailTableVO;
import kr.or.annapharm.dto.PharmacyInfoMapVO;
import kr.or.annapharm.dto.PreferMedicineVO;
import kr.or.annapharm.dto.ProductVO;
import kr.or.annapharm.dto.SalesByAgeVO;
import kr.or.annapharm.dto.SearchMedicineVO;
import kr.or.annapharm.dto.SelectListVO;

public class BusinessServiceImpl implements BusinessService {

	private BusinessDAO businessDAO;
	public void setBusinessDAO(BusinessDAO businessDAO) {
		this.businessDAO = businessDAO;
	}
	
	@Override
	public Map<String, Object> getSalesByAgeList(SearchCriteria cri) throws SQLException {
		SearchCriteria searchCri = (SearchCriteria)cri;
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<SalesByAgeVO> salesByAgeList = businessDAO.salesByAgeList(searchCri);
		
		int totalCount = 18;
		cri.setPerPageNum(5);
		
		PageMakerSort pageMaker = new PageMakerSort();
		pageMaker.setCri(searchCri);
		pageMaker.setTotalCount(totalCount);
		pageMaker.setDisplayPageNum(5);
		pageMaker.setSortTarget(cri.getSearchType());
		pageMaker.setSortType(cri.getSearchType2());
		
		dataMap.put("salesByAgeList", salesByAgeList);
		dataMap.put("pageMaker",pageMaker);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> getPreferMedicineList(PreferMedicineVO preferMedicineVO) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<PreferMedicineVO> preferMedicineList = businessDAO.preferMedicineList(preferMedicineVO);
		
		int totalCount = businessDAO.preferMedicineCount(preferMedicineVO);
		preferMedicineVO.setPerPageNum(5);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(preferMedicineVO);
		pageMaker.setTotalCount(totalCount);
		pageMaker.setDisplayPageNum(5);
		
		dataMap.put("preferMedicineList",preferMedicineList);
		dataMap.put("pageMaker",pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> searchMedicineList(Criteria cri) throws SQLException {
		SearchCriteria searchCri = (SearchCriteria)cri;

		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<SearchMedicineVO> searchMedicineList = businessDAO.selectSearchMedicine(cri);

		int totalCount = businessDAO.selectSearchMedicineCount(searchCri.getKeyword());

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("searchMedicineList", searchMedicineList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> searchBasisList(Criteria cri) throws SQLException {
		SearchCriteria searchCri = (SearchCriteria)cri;
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<SearchMedicineVO> searchBasisList = businessDAO.selectSearchBasis(cri);
		
		int totalCount = businessDAO.selectSearchBasisCount(searchCri.getKeyword());
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("searchBasisList", searchBasisList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public List<CompareMedicineVO> getCompareList(String miMaincode) throws SQLException {
		List<CompareMedicineVO> compareList = null;
		
		compareList = businessDAO.selectCompareMedicine(miMaincode);
		
		return compareList;
	}

	@Override
	public void selectListAddDel(SelectListVO selectListVO) throws SQLException {
		
		if(selectListVO.getSelectMd().equals("far fa-plus-square")) {
			businessDAO.insertSelectList(selectListVO);
		}else {
			businessDAO.deleteSelectList(selectListVO);
		}
	}

	@Override
	public List<SelectListVO> getSelectList(String chemistCode) throws SQLException {
		List<SelectListVO> selectList = null;
		
		selectList = businessDAO.selectList(chemistCode);
		
		return selectList;
	}

	@Override
	public Map<String, Object> getLongPrescriptionList(LongPrescriptionCommandVO commandVO) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<LongPrescriptionDetailVO> longDetailList = null;
		String psCode = null;
		List<LongPrescriptionVO> longList = businessDAO.longPrescription(commandVO);
		int totalCount = businessDAO.longPrescriptionCount(commandVO);
		
//		List<String> psCodeList = longList.stream().map(e -> e.getPsCode()).collect(Collectors.toCollection(ArrayList::new));

		for(LongPrescriptionVO vo : longList) {
			psCode = vo.getPsCode();
			longDetailList = businessDAO.longPrescriptionDetail(psCode);
			for(LongPrescriptionDetailVO longDetail : longDetailList) {
				if(longDetail.getOwnNumCheck().equals("부족")) {
					vo.setOwnNumCheck("부족");
					break;
				}
			}
		}
		
		commandVO.setPerPageNum(5);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(commandVO);
		pageMaker.setTotalCount(totalCount);
		pageMaker.setDisplayPageNum(5);
		
		dataMap.put("longList", longList);
		dataMap.put("pageMaker",pageMaker);
		
		
		for(LongPrescriptionVO vo : longList) {
			System.out.println(vo);			
		}
		
		System.out.println(totalCount);
		
		return dataMap;
	}

	@Override
	public List<LongPrescriptionDetailVO> getLongPrescriptionDetailList(String psCode) throws SQLException {
		return businessDAO.longPrescriptionDetail(psCode);
	}

	@Override
	public List<MedicineDetailTableVO> getMedicineDetailTableList(List<Integer> mdNoList) throws Exception {
		
		List<MedicineDetailTableVO> list = new ArrayList<MedicineDetailTableVO>();
		
		MedicineDetailTableVO vo = null;
		
		for(int mdNo : mdNoList) {
			vo = businessDAO.medicineDetailTable(mdNo);
			list.add(vo);
		}
		
		return list;
	}

	@Override
	public List<PharmacyInfoMapVO> getPharmacyInfoList(List<FindPharmacyCommandVO> commandList) throws SQLException {
		
		List<PharmacyInfoMapVO> pharmacyInfoList = new ArrayList<PharmacyInfoMapVO>();
		
		PharmacyInfoMapVO pharmacyInfoMapVO = null;
		
		for(FindPharmacyCommandVO commandVO : commandList) {
			pharmacyInfoMapVO = businessDAO.pharmacyInfo(commandVO);
			if(pharmacyInfoMapVO != null) {
				pharmacyInfoMapVO.setX(commandVO.getX());
				pharmacyInfoMapVO.setY(commandVO.getY());
				pharmacyInfoMapVO.setDistance(Integer.parseInt(commandVO.getDistance()));
				pharmacyInfoMapVO.setToDayTime("hi");
//				vo.setToDayTime("성공입니다.");
				Calendar cal = Calendar.getInstance();
				int toDayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
				
				System.out.println("toDayOfWeek : " + toDayOfWeek);
				switch (toDayOfWeek) {
				case 2: 
					pharmacyInfoMapVO.setToDayTime(pharmacyInfoMapVO.getPiDutytime1s() + "," + pharmacyInfoMapVO.getPiDutytime1c()); 
					break;
				case 3: 
					pharmacyInfoMapVO.setToDayTime(pharmacyInfoMapVO.getPiDutytime2s() + "," + pharmacyInfoMapVO.getPiDutytime2c()); 
					break;
				case 4: 
					pharmacyInfoMapVO.setToDayTime(pharmacyInfoMapVO.getPiDutytime3s() + "," + pharmacyInfoMapVO.getPiDutytime3c()); 
					break;
				case 5: 
					pharmacyInfoMapVO.setToDayTime(pharmacyInfoMapVO.getPiDutytime4s() + "," + pharmacyInfoMapVO.getPiDutytime4c()); 
					break;
				case 6: 
					pharmacyInfoMapVO.setToDayTime(pharmacyInfoMapVO.getPiDutytime5s() + "," + pharmacyInfoMapVO.getPiDutytime5c()); 
					break;
				case 7: 
					pharmacyInfoMapVO.setToDayTime(pharmacyInfoMapVO.getPiDutytime6s() + "," + pharmacyInfoMapVO.getPiDutytime6c()); 
					break;
				default:
					pharmacyInfoMapVO.setToDayTime("영업준비중");
					break;
				}
				pharmacyInfoList.add(pharmacyInfoMapVO);
				System.out.println(pharmacyInfoMapVO);
			}
		}
		
		Collections.sort(pharmacyInfoList);
		
		return pharmacyInfoList;
	}

	@Override
	public PharmacyInfoMapVO getPharmacyInfoDetail(String piHpid) throws SQLException {
		
		PharmacyInfoMapVO vo = businessDAO.selectPharmacyInfoDetail(piHpid);
		
		List<ProductVO> list = businessDAO.selectPharmacyProductInfo(piHpid);
		
		vo.setPharmacyProductInfo(list);
		
		return vo;
	}

	@Override
	public List<ProductVO> getPharmacyProductInfo(String piHpid) throws SQLException {
		return businessDAO.selectPharmacyProductInfo(piHpid);
	}

	@Override
	public List<PharmacyInfoMapVO> getSearchPharmacy(String keyword) throws SQLException {
		return businessDAO.searchPharmacy(keyword);
	}

	@Override
	public PharmacyInfoMapVO getGoPharmacy(String piHpid) throws SQLException {
		return businessDAO.goPharmacy(piHpid);
	}
}





