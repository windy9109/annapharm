package kr.or.annapharm.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import kr.or.annapharm.PharmacyAPIVO;
import kr.or.annapharm.command.SalesAnalysisCommand;
import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dao.MedicienBillDAO;
import kr.or.annapharm.dao.PrescriptionDAO;
import kr.or.annapharm.dao.SalesAnalysisDAO;
import kr.or.annapharm.dto.MedicienBillVO;
import kr.or.annapharm.dto.MedicienCalculatVO;
import kr.or.annapharm.dto.PrescriptionCompleteVO;
import kr.or.annapharm.dto.PrescriptionSaveLogVO;
import kr.or.annapharm.dto.RegistBillVO;
import kr.or.annapharm.dto.SalesAnalysisDetailVO;
import kr.or.annapharm.dto.SalesAnalysisVO;
import kr.or.annapharm.dto.SalesDashboardResultVO;
import kr.or.annapharm.dto.SavelogPrescriptionVO;
import kr.or.annapharm.dto.UpdatePrescriptionVO;

public class SalesAnalysisServiceImpl implements SalesAnalysisService {

	private SalesAnalysisDAO salesAnalysisDAO;
	public void setSalesAnalysisDAO(SalesAnalysisDAO salesAnalysisDAO) {
		this.salesAnalysisDAO = salesAnalysisDAO;
	}
	private MedicienBillDAO medicienBillDAO;
	public void setMedicienBillDAO(MedicienBillDAO medicienBillDAO) {
		this.medicienBillDAO = medicienBillDAO;
	}

	// 개요 : 로그인한 유저와 같은 약국에 등록되어있는 약사들의 목록을 가져오는 메서드
	// 작성자 : 이병진
	@Override
	public List<RegistBillVO> getChemistsName(String loginUserPharmacyCode) throws Exception {
		return salesAnalysisDAO.selectChemistsName(loginUserPharmacyCode);
	}

	// 개요 : 약사/기간 조건에 따라 매출 목록의 데이터를 출력하기 위한 메서드
	// 작성자 : 이병진
	@Override
	public List<SalesAnalysisCommand> getSearchAnalysisList(SearchCriteria cri) throws Exception {
		// 조제수가의 정보를 가져오는 vo
		MedicienBillVO billVO = medicienBillDAO.getMedicienBill();
		int bill1 = billVO.getManageBill(); // 약국관리료
		int bill2 = billVO.getMedicineBasicBill(); // 조제기본료
		int bill3 = billVO.getTakingMedicineBill(); // 복약지도료
		int bill4 = billVO.getMedicineBill(); // 처방조제료
		int bill5 = billVO.getMedicalManageBill(); // 의약품 관리료
		int bill6 = billVO.getMedicalManageDrugBill(); // 의약품관리료(마약류)
		// 사용자가 지정한 기간/약사 조건에 따라 처방전의 정보를 가져오는 list
		List<SalesAnalysisVO> prescriptionList = salesAnalysisDAO.selectSearchAnalysisList(cri);
		// 처방전별 약품의 데이터를 담을 list
		List<MedicienCalculatVO> medicienList = null;
		// 목록을 출력할 command객체
		List<SalesAnalysisCommand> sacList = new ArrayList<SalesAnalysisCommand>();
		double total; // 약제비 총액
		double medicienTotal; // 약값 전체
		double medicineSum; // 조제료 합
		double patientFee; // 본인부담금
		int prescriptionDay; // 처방일
		String drug = null; // 마약류 확인

		for(SalesAnalysisVO vo : prescriptionList ) {
			SalesAnalysisCommand sac = new SalesAnalysisCommand();
			total = 0;
			medicienTotal = 0;
			prescriptionDay = 0;
			medicienList = salesAnalysisDAO.selectSearchAnalysisListMedicienData(vo.getPsCode());

			// 약값 구하기
			for(MedicienCalculatVO vo2 : medicienList) {
				prescriptionDay = vo2.getPreDrugDay();
				drug = vo2.getMdDrug();

				// 약가 총합
				double medicienPrice = vo2.getPreDrugNum() * vo2.getMiPrice();
				medicienTotal += medicienPrice;
			}

			// 조제료 구하기
			{
				double medicineBill = bill4; // 처방조제료
				int medicalManageBill = bill5; // 의약품관리료
				// 처방 조제료 계산(하루마다 1.1%씩 증가)
				for(int i = 1; i < prescriptionDay; i++) {
					medicineBill = Math.round(medicineBill * 1.1);
				}
				// 마약류이면 가격 변경
				if(drug != null && !drug.equals("-")) {
					medicalManageBill = bill6;
				}
				// 조제료 : 약국관리료 + 조제기본료 + 복약지도료 + 의약품관리료 + 처방조제료(원 미만 반올림)
				medicineSum = Math.round(bill1 + bill2 + bill3 + medicineBill + medicalManageBill);
			}

			// 약제비 총액 : 10원 미만 절사
			total = Math.floor((medicienTotal + medicineSum)/10) * 10;
			// 본인부담금 : 100원 미만 절사
			patientFee = Math.floor((total * 20/100)/100) * 100;

			vo.setTotalMedicienBill(total); // 총 약제비
			vo.setCharge(total - patientFee); // 청구액
			vo.setPatientCharge(patientFee); // 본인부담금
			vo.setDeposit(patientFee); // 입금액
			vo.setCompoundingFee(medicineSum); // 조제료
			vo.setMedicienBill(medicienTotal); // 약가 합산

			sac = vo.toSalesAnalysisCommand();
			sacList.add(sac);
		}

		return sacList;
	}

	// 개요 : 처방전 코드를 받아 해당 처방전의 약품을 검색하는 메서드
	// 작성자 : 이병진
	@Override
	public List<SalesAnalysisDetailVO> getSalesAnalyssisDetail(String psCode) throws Exception {

		List<SalesAnalysisDetailVO> voList = salesAnalysisDAO.selectSalesAnalyssisDetail(psCode);
		int count = 0; // 총액을 계산하기 위한 변수

		for(SalesAnalysisDetailVO vo : voList) {
			count += vo.getCount();
		}
		// 리스트 첫번째 변수에 총액 저장
		voList.get(0).setPrescriptTotalFee(count);

		return voList;
	}

	@Override
	public void test(PharmacyAPIVO vo) throws Exception {
		salesAnalysisDAO.test(vo);
	}

	// 개요 : 사용자 ID를 통해 사용자의 정보와 약국 코드를 가져오는 메서드
	// 작성자 : 이병진
	@Override
	public RegistBillVO getloginUserpharmacyCode(String memId) throws Exception {
		return salesAnalysisDAO.loginUserpharmacyCode(memId);
	}

	// 개요 : 약국코드를 통해 약국의 세부 정보를 가져오는 메서드
	// 작성자 : 이병진
	@Override
	public RegistBillVO getPharmacyInfo(String memId) throws Exception {
		RegistBillVO rbvo = salesAnalysisDAO.loginUserpharmacyCode(memId);

		RegistBillVO resvo = salesAnalysisDAO.selectPharmacyInfo(rbvo);
		resvo.setMemName(rbvo.getMemName());
		resvo.setMemRegnum(rbvo.getMemRegnum());
		resvo.setPiHpid(rbvo.getPiHpid());

		return resvo;
	}

	// 개요 : 매출 현황 테이블에서 임시저장을 눌렀을 때 실행되는 메서드
	// 작성자  : 이병진
	@Override
	public void temporarilySave(PrescriptionSaveLogVO psvo, List<String> preCode) throws Exception {
		// 시퀀스로 pslogNum을 가져오기
		int pslogNum = salesAnalysisDAO.saveSEQnumFind();
		psvo.setPslogNum(pslogNum);

		// prescription_savelog 테이블 임시로 insert
		salesAnalysisDAO.prescriptionSavelogTemporarilySaveInsert(psvo);

		System.out.println("psvoService : " + psvo);

		for(String str : preCode) {
			psvo.setSpPscode(str);
			// savelog_prescription 테이블 insert
			salesAnalysisDAO.savelogPrescriptionSaveInsert(psvo);

			// prescription 테이블 처방전 상태 g -> u로 바꿔주기
			salesAnalysisDAO.prescriptionSaveupdate(str);
		}
	}

	// 개요 : 요양급여신청서에서 저장 버튼을 눌렀을 때 실행되는 메서드
	// 작성자 : 이병진
	@Override
	public void printSave(PrescriptionSaveLogVO psvo, List<String> preCode) throws Exception {
		// 시퀀스로 pslogNum을 가져오기
		int pslogNum = salesAnalysisDAO.saveSEQnumFind();
		psvo.setPslogNum(pslogNum);

		// prescription_savelog 테이블 출력으로 insert
		salesAnalysisDAO.prescriptionSavelogPrintSaveinsert(psvo);

		System.out.println("psvoService : " + psvo);

		for(String str : preCode) {
			psvo.setSpPscode(str);
			// savelog_prescription 테이블 insert
			salesAnalysisDAO.savelogPrescriptionSaveInsert(psvo);

			// prescription 테이블 처방전 상태 g -> u로 바꿔주기
			salesAnalysisDAO.prescriptionSaveupdate(str);
		}
	}

	// 개요 : 매출현황 화면에서 삭제 버튼을 눌렀을 때 처방전 코드의 save타입을 변경하고 prescriptionSavelog와 savelogPrescription을 삭제 하는 메서드
	// 작성자 : 이병진
	@Override
	public void saveDelete(int pslogNum) throws Exception {
		// 사용자가 선택한 행에 따라 처방전의 정보를 가져오는 list
		List<SalesAnalysisVO> prescriptionList = salesAnalysisDAO.selectSaveAndPrintDetailList(pslogNum);

		// savelogPrescription 정보 지우기
		salesAnalysisDAO.savelogPrescriptionDelete(pslogNum);
		// prescriptionSavelog 정보 지우기
		salesAnalysisDAO.prescriptionSavelogDelete(pslogNum);

		for(SalesAnalysisVO vo : prescriptionList) {
			// prescription 테이블 처방전 상태 u -> g로 바꿔주기
			salesAnalysisDAO.prescriptionDeleteupdate(vo.getPsCode());
		}
	}

	// 개요 : 저장/출력 내역에 들어갈 리스트를 가져오는 메서드
	// 작성자 : 이병진
	@Override
	public List<PrescriptionSaveLogVO> getSavePringList(String pharmacyCode) throws Exception {
		Date startday = null; // 시작일
		Date endday = null;	// 종료일
		int pslogNum = 0; // PRESCRIPTION_SAVELOG 테이블의 PK를 담을 변수
		// 해당하는 약국에 저장된 SavePringList 전부 가져오기
		List<PrescriptionSaveLogVO> pslvo = salesAnalysisDAO.selectPrintSaveTableList(pharmacyCode);

		// pslogNum을 꺼내서 시작일/종료일을 꺼내 데이터에 넣기
		for(PrescriptionSaveLogVO vo : pslvo) {
			pslogNum = vo.getPslogNum();
			// 조제완료일 꺼내기
			List<SavelogPrescriptionVO> spvo = salesAnalysisDAO.selectsavelogPrescriptionList(pslogNum);

			if(spvo != null && !spvo.isEmpty()) {
				// 종료일 넣기
				endday = spvo.get(0).getPsCompleteDate();
				// 시작일 넣기
				startday = spvo.get(spvo.size()-1).getPsCompleteDate();
			}

			vo.setPsCompleteDateStrart(startday);
			vo.setPsCompleteDateEnd(endday);
		}

		return pslvo;
	}

	// 개요 : 저장/출력 내역에서 선택한 행의 매출 목록을 가져오는 메서드
	// 작성자 : 이병진
	@Override
	public List<SalesAnalysisCommand> getSaveAndPrintDetailList(int pslogNum) throws Exception {
		// 조제수가의 정보를 가져오는 vo
		MedicienBillVO billVO = medicienBillDAO.getMedicienBill();
		int bill1 = billVO.getManageBill(); // 약국관리료
		int bill2 = billVO.getMedicineBasicBill(); // 조제기본료
		int bill3 = billVO.getTakingMedicineBill(); // 복약지도료
		int bill4 = billVO.getMedicineBill(); // 처방조제료
		int bill5 = billVO.getMedicalManageBill(); // 의약품 관리료
		int bill6 = billVO.getMedicalManageDrugBill(); // 의약품관리료(마약류)
		// 사용자가 선택한 행에 따라 처방전의 정보를 가져오는 list
		List<SalesAnalysisVO> prescriptionList = salesAnalysisDAO.selectSaveAndPrintDetailList(pslogNum);
		// 처방전별 약품의 데이터를 담을 list
		List<MedicienCalculatVO> medicienList = null;
		// 목록을 출력할 command객체
		List<SalesAnalysisCommand> sacList = new ArrayList<SalesAnalysisCommand>();
		double total; // 약제비 총액
		double medicienTotal; // 약값 전체
		double medicineSum; // 조제료 합
		double patientFee; // 본인부담금
		int prescriptionDay; // 처방일
		String drug = null; // 마약류 확인

		for(SalesAnalysisVO vo : prescriptionList ) {
			SalesAnalysisCommand sac = new SalesAnalysisCommand();
			total = 0;
			medicienTotal = 0;
			prescriptionDay = 0;
			medicienList = salesAnalysisDAO.selectSearchAnalysisListMedicienData(vo.getPsCode());

			// 약값 구하기
			for(MedicienCalculatVO vo2 : medicienList) {
				prescriptionDay = vo2.getPreDrugDay();
				drug = vo2.getMdDrug();

				// 약가 총합
				double medicienPrice = vo2.getPreDrugNum() * vo2.getMiPrice();
				medicienTotal += medicienPrice;
			}

			// 조제료 구하기
			{
				double medicineBill = bill4; // 처방조제료
				int medicalManageBill = bill5; // 의약품관리료
				// 처방 조제료 계산(하루마다 1.1%씩 증가)
				for(int i = 1; i < prescriptionDay; i++) {
					medicineBill = Math.round(medicineBill * 1.1);
				}
				// 마약류이면 가격 변경
				if(drug != null && !drug.equals("-")) {
					medicalManageBill = bill6;
				}
				// 조제료 : 약국관리료 + 조제기본료 + 복약지도료 + 의약품관리료 + 처방조제료(원 미만 반올림)
				medicineSum = Math.round(bill1 + bill2 + bill3 + medicineBill + medicalManageBill);
			}

			// 약제비 총액 : 10원 미만 절사
			total = Math.floor((medicienTotal + medicineSum)/10) * 10;
			// 본인부담금 : 100원 미만 절사
			patientFee = Math.floor((total * 20/100)/100) * 100;

			vo.setTotalMedicienBill(total); // 총 약제비
			vo.setCharge(total - patientFee); // 청구액
			vo.setPatientCharge(patientFee); // 본인부담금
			vo.setDeposit(patientFee); // 입금액
			vo.setCompoundingFee(medicineSum); // 조제료
			vo.setMedicienBill(medicienTotal); // 약가 합산

			sac = vo.toSalesAnalysisCommand();
			sacList.add(sac);
		}

		return sacList;
	}

	private List<SalesAnalysisVO> DashboardCalculator(List<SalesAnalysisVO> prescriptionList) throws Exception{
		// 조제수가의 정보를 가져오는 vo
		MedicienBillVO billVO = medicienBillDAO.getMedicienBill();
		int bill1 = billVO.getManageBill(); // 약국관리료
		int bill2 = billVO.getMedicineBasicBill(); // 조제기본료
		int bill3 = billVO.getTakingMedicineBill(); // 복약지도료
		int bill4 = billVO.getMedicineBill(); // 처방조제료
		int bill5 = billVO.getMedicalManageBill(); // 의약품 관리료
		int bill6 = billVO.getMedicalManageDrugBill(); // 의약품관리료(마약류)
		// 처방전별 약품의 데이터를 담을 list
		List<MedicienCalculatVO> medicienList = null;
		// 목록을 출력할 command객체
		List<SalesAnalysisVO> sacList = new ArrayList<SalesAnalysisVO>();
		double total; // 약제비 총액
		double medicienTotal; // 약값 전체
		double medicineSum; // 조제료 합
		double patientFee; // 본인부담금
		int prescriptionDay; // 처방일
		String drug = null; // 마약류 확인

		for(SalesAnalysisVO vo : prescriptionList ) {
			SalesAnalysisCommand sac = new SalesAnalysisCommand();
			total = 0;
			medicienTotal = 0;
			prescriptionDay = 0;
			medicienList = salesAnalysisDAO.selectSearchAnalysisListMedicienData(vo.getPsCode());

			// 약값 구하기
			for(MedicienCalculatVO vo2 : medicienList) {
				prescriptionDay = vo2.getPreDrugDay();
				drug = vo2.getMdDrug();

				// 약가 총합
				double medicienPrice = vo2.getPreDrugNum() * vo2.getMiPrice();
				medicienTotal += medicienPrice;
			}

			// 조제료 구하기
			{
				double medicineBill = bill4; // 처방조제료
				int medicalManageBill = bill5; // 의약품관리료
				// 처방 조제료 계산(하루마다 1.1%씩 증가)
				for(int i = 1; i < prescriptionDay; i++) {
					medicineBill = Math.round(medicineBill * 1.1);
				}
				// 마약류이면 가격 변경
				if(drug != null && !drug.equals("-")) {
					medicalManageBill = bill6;
				}
				// 조제료 : 약국관리료 + 조제기본료 + 복약지도료 + 의약품관리료 + 처방조제료(원 미만 반올림)
				medicineSum = Math.round(bill1 + bill2 + bill3 + medicineBill + medicalManageBill);
			}

			// 약제비 총액 : 10원 미만 절사
			total = Math.floor((medicienTotal + medicineSum)/10) * 10;

			vo.setTotalMedicienBill(total); // 총 약제비

			sacList.add(vo);
		}
		return sacList;
	}

	private SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");

	// 개요 : 매출 대쉬보드에 들어갈 값을 계산하는 서비스 메서드(일주일)
	// 작성자 : 이병진
	@Override
	public SalesDashboardResultVO getWeekSalesListforDashboard(String pharmacyCode) throws Exception {

		// 캘린더 객체 생성
		Calendar cal = Calendar.getInstance();
		// 오늘 요일 뽑기(1 = 일요일, 2 = 월요일,.... , 7 = 토요일)
		int today = cal.get(Calendar.DAY_OF_WEEK);
		int sunday = today - 1;

		// 일주일 동안의 처방전 데이터를 뽑아오는 리스트
		List<SalesAnalysisVO> prescriptionList = salesAnalysisDAO.weekPrescriptionList(pharmacyCode);
		System.out.println("prescriptionList :" + prescriptionList.size());

		// 가격 계산을 진행한 리스트(총 약제비)
		List<SalesAnalysisVO> weekList = DashboardCalculator(prescriptionList);

		System.out.println("weekList :" + weekList.size());

		// 일 ~ 토 가격을 저장할 VO
		SalesDashboardResultVO sdrVO = new SalesDashboardResultVO();

		for(int i = today-1; i > -1; i-- ) {

			double total = 0;
			Calendar cal2 = Calendar.getInstance();
			// 날짜를 비교하도록 String 형태로 변환
			cal2.add(cal2.DATE, -i);
			String dateCal = format.format(cal2.getTime());

			System.out.println("날짜뽑기 : " + dateCal);

			for(SalesAnalysisVO vo : weekList) {
					if(dateCal.equals(format.format(vo.getPsCompleteDate()))) {
						total += vo.getTotalMedicienBill();
					}
			}

			if(sunday == i) sdrVO.setSun(total);
			else if(sunday-1 == i) sdrVO.setMon(total);
			else if(sunday-2 == i) sdrVO.setTue(total);
			else if(sunday-3 == i) sdrVO.setWed(total);
			else if(sunday-4 == i) sdrVO.setThur(total);
			else if(sunday-5 == i) sdrVO.setFri(total);
			else if(sunday-6 == i) sdrVO.setSat(total);

		}
		System.out.println("sdrVO : " + sdrVO);
		return sdrVO;
	}

	// 개요 : 매출 대쉬보드에 들어갈 값을 계산하는 서비스 메서드(한달)
	// 작성자 : 이병진
	@Override
	public SalesDashboardResultVO getMonthSalesListforDashboard(String pharmacyCode) throws Exception {

		// 오늘 날짜 뽑기
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		int month = now.getMonthValue();
		int dayofMonth = now.getDayOfMonth();

		String monthString = null;
		if(month < 10) monthString = 0 + "" + month;
		else monthString = month + "";

		String day7 = year + monthString + 7;
		String day14 = year + monthString + 14;
		String day21 = year + monthString + 21;
		String day28 = year + monthString + 28;

		Date date7 = format.parse(day7);
		Date date14 = format.parse(day14);
		Date date21 = format.parse(day21);

		double total7 = 0;
		double total14 = 0;
		double total21 = 0;
		double total28 = 0;

		// 한달간의 처방전 데이터를 뽑아오는 리스트
		List<SalesAnalysisVO> prescriptionList = salesAnalysisDAO.monthPrescriptionList(pharmacyCode);
		// 가격 계산을 진행한 리스트(총 약제비)
		List<SalesAnalysisVO> monthList = DashboardCalculator(prescriptionList);
		// 한달 차트에 들어갈 가격을 저장할 VO
		SalesDashboardResultVO sdrVO = new SalesDashboardResultVO();

		for(SalesAnalysisVO vo : monthList) {
			if(vo.getPsCompleteDate().before(date7)) {
				// 7일보다 작을 때
				total7 += vo.getTotalMedicienBill();
			}else if(vo.getPsCompleteDate().before(date14)) {
				// 14일보다 작을 때
				total14 += vo.getTotalMedicienBill();
			}else if(vo.getPsCompleteDate().before(date21)) {
				// 21일보다 작을 때
				total21 += vo.getTotalMedicienBill();
			}else {
				total28 += vo.getTotalMedicienBill();
			}
		}

		sdrVO.setDay7(total7);
		sdrVO.setDay14(total14);
		sdrVO.setDay21(total21);
		sdrVO.setDay28(total28);

		System.out.println("sdrVO : " + sdrVO);

		return sdrVO;
	}

	// 개요 : 매출 대쉬보드에 들어갈 값을 계산하는 서비스 메서드(1년)
	// 작성자 : 이병진
	@Override
	public SalesDashboardResultVO getYearSalesListforDashboard(String pharmacyCode) throws Exception {

		// 월 날짜 뽑기
		LocalDate now = LocalDate.now();
		int year = now.getYear();


		// 각 월별 1일이 될 변수 형태 만들기
		String month2 = year + "02" + 1;
		String month3 = year + "03" + 1;
		String month4 = year + "04" + 1;
		String month5 = year + "05" + 1;
		String month6 = year + "06" + 1;
		String month7 = year + "07" + 1;
		String month8 = year + "08" + 1;
		String month9 = year + "09" + 1;
		String month10 = year + "10" + 1;
		String month11 = year + "11" + 1;
		String month12 = year + "12" + 1;

		// 각 월별 1일이 될 date 타입 만들기
		Date dateMonth2  = format.parse(month2);
		Date dateMonth3  = format.parse(month3);
		Date dateMonth4  = format.parse(month4);
		Date dateMonth5  = format.parse(month5);
		Date dateMonth6  = format.parse(month6);
		Date dateMonth7  = format.parse(month7);
		Date dateMonth8  = format.parse(month8);
		Date dateMonth9  = format.parse(month9);
		Date dateMonth10 = format.parse(month10);
		Date dateMonth11 = format.parse(month11);
		Date dateMonth12 = format.parse(month12);


		double total1 = 0;
		double total2 = 0;
		double total3 = 0;
		double total4 = 0;
		double total5 = 0;
		double total6 = 0;
		double total7 = 0;
		double total8 = 0;
		double total9 = 0;
		double total10= 0;
		double total11= 0;
		double total12= 0;

		// 일년 동안의 처방전 데이터를 뽑아오는 리스트
		List<SalesAnalysisVO> prescriptionList = salesAnalysisDAO.yearPrescriptionList(pharmacyCode);

		// 가격 계산을 진행한 리스트(총 약제비)
		List<SalesAnalysisVO> yearList = DashboardCalculator(prescriptionList);

		// 월별로 가격을 저장할 VO
		SalesDashboardResultVO sdrVO = new SalesDashboardResultVO();

		for(SalesAnalysisVO vo : yearList) {
			if(vo.getPsCompleteDate().before(dateMonth2)) total1 += vo.getTotalMedicienBill();
			else if(vo.getPsCompleteDate().before(dateMonth3)) total2 += vo.getTotalMedicienBill();
			else if(vo.getPsCompleteDate().before(dateMonth4)) total3 += vo.getTotalMedicienBill();
			else if(vo.getPsCompleteDate().before(dateMonth5)) total4 += vo.getTotalMedicienBill();
			else if(vo.getPsCompleteDate().before(dateMonth6)) total5 += vo.getTotalMedicienBill();
			else if(vo.getPsCompleteDate().before(dateMonth7)) total6 += vo.getTotalMedicienBill();
			else if(vo.getPsCompleteDate().before(dateMonth8)) total7 += vo.getTotalMedicienBill();
			else if(vo.getPsCompleteDate().before(dateMonth9)) total8 += vo.getTotalMedicienBill();
			else if(vo.getPsCompleteDate().before(dateMonth10)) total9 += vo.getTotalMedicienBill();
			else if(vo.getPsCompleteDate().before(dateMonth11)) total10 += vo.getTotalMedicienBill();
			else if(vo.getPsCompleteDate().before(dateMonth12)) total11 += vo.getTotalMedicienBill();
			else total12 += vo.getTotalMedicienBill();
		}

		sdrVO.setMonth1(total1);
		sdrVO.setMonth2(total2);
		sdrVO.setMonth3(total3);
		sdrVO.setMonth4(total4);
		sdrVO.setMonth5(total5);
		sdrVO.setMonth6(total6);
		sdrVO.setMonth7(total7);
		sdrVO.setMonth8(total8);
		sdrVO.setMonth9(total9);
		sdrVO.setMonth10(total10);
		sdrVO.setMonth11(total11);
		sdrVO.setMonth12(total12);

		return sdrVO;
	}

	// 헤지 : 조제완료 후 sale, sale_cart테이블에 데이터 insert
	@Override
	public String insertSalePrescription(PrescriptionCompleteVO vo) throws Exception {
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formatedNow = now.format(formatter);
		salesAnalysisDAO.selectSaleNumSeq();
//		System.out.println("판매번호 : " + salesAnalysisDAO.selectSaleNumSeq());

		String saleNo = "SA" + formatedNow + salesAnalysisDAO.selectSaleNumSeq();

//		System.out.println("판매번호 -> " + saleNo);

		vo.setSaleNo(saleNo);

		salesAnalysisDAO.insertSalePrescription(vo);

		return saleNo;
	}

	@Override
	public void insertSaleCartMedicine(List<PrescriptionCompleteVO> voList) throws Exception {
		for(PrescriptionCompleteVO vo : voList) {
			salesAnalysisDAO.insertSaleCartMedicine(vo);
		}
	}
}
