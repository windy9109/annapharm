package kr.or.annapharm.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.annapharm.command.InsertRetrieveCommand;
import kr.or.annapharm.command.PageMaker;
import kr.or.annapharm.command.RetrieveCommand;
import kr.or.annapharm.command.SearchCriteria;
import kr.or.annapharm.dao.RetrieveDAO;
import kr.or.annapharm.dto.BoardVO;
import kr.or.annapharm.dto.ChemistVO;
import kr.or.annapharm.dto.ProductVO;
import kr.or.annapharm.dto.RetrieveListVO;
import kr.or.annapharm.dto.RetrieveVO;

public class RetrieveServiceImpl implements RetrieveService {
	private RetrieveDAO retrieveDAO;

	public void setRetrieveDAO(RetrieveDAO retrieveDAO) {
		this.retrieveDAO = retrieveDAO;
	}

	@Override
	public Map<String, Object> getRetrieveProductList(SearchCriteria cri) throws SQLException {
		Date now = new Date();

		Map<String, Object> product = new HashMap<String, Object>();

//		ChemistVO chemist = new ChemistVO();
//		chemist = (ChemistVO) request.getAttribute("loginUser");
//		String pharmacyCode = chemist.getPharmacyCode();

		List<ProductVO> firstProductList = retrieveDAO.selectRetrieveProductList(cri);

		// 유통기한이 지나거나, 적정재고수보다 재고수가 적은 약 컬럼에 경고마크 부여하고, 경고마크가 부여된 컬럼이 먼저 출력되게 해줌.
		List<ProductVO> secondProductList = new ArrayList<ProductVO>();
		// 최종적으로 JSP에 나타내어질 리스트
		List<ProductVO> thridProductList = new ArrayList<ProductVO>();

		for (int i = 0; i < firstProductList.size(); i++) { // 중복된 약의 재고의 수를 합치고, 나타내어지는 리스트 목록은 한개로
			/// for(int j = firstProductList.size() - 1 ; j > i; j--) {
			// if(firstProductList.get(i).getMdNo() == firstProductList.get(j).getMdNo()) {
			/// // 반복문을돌아 약번호가 같다면,
			// 같은 약번호의 재고수를 합친다.
			// firstProductList.get(i).setProductOwnnum(firstProductList.get(i).getProductOwnnum()
			/// + firstProductList.get(j).getProductOwnnum());
			// 같은 약번호가 있는 재고가 있다면 약위치가 다를 수 있기에 상세정보를 클릭해서 해당 약위치를 보이게하고, 재고목록에는 지우려고 없앤다.
			// firstProductList.get(i).setProductPosition("");

			// 만약 재고의 유통기한이 현재 날짜보다 지났다면,
			if (now.compareTo(firstProductList.get(i).getProductDate()) >= 0) {
				firstProductList.get(i).setWarnMark("Y"); // 재고에 경고마크를 "Y"로 준다.
				firstProductList.get(i).setDateOver(1); // 재고가 유통기한이 지났다고 1을 준다.
			}
			// firstProductList.remove(j); // 중복된 재고가 재고목록에 출력되지 않도록 리스트에서 삭제
			// firstProductList.get(i).setDistinctNum(firstProductList.get(i).getDistinctNum()
			// + 1); // 중복된 데이터가 있을시 중복숫자를 +1함
			// }
			// }
			secondProductList.add(firstProductList.get(i)); // 중복된 재고 삭제, 유통기한표시, 경고마크표시, 중복숫자 더한 리스트를
															// secondProductList에 저장
		}

		for (ProductVO pro : secondProductList) { // secondProductList에서 유통기한이 지났거나, 적정재고수보다 재고수가 적으면 경고마크 "Y"
			pro.setDateOver(now.compareTo(pro.getProductDate()));
			if (now.compareTo(pro.getProductDate()) >= 0 || pro.getProductOwnnumStandard() >= pro.getProductOwnnum()) {
				pro.setWarnMark("Y");
			}
		}
		for (ProductVO pro : secondProductList) { // secondProductList에서 경고마크가 있는 항목만 thridProductList에 먼저 출력되도록 먼저 저장
			if (pro.getWarnMark() == "Y") {
				thridProductList.add(pro);
			}
		}

		for (ProductVO pro : secondProductList) { // secondProductList에서 경고마크가 없는 항목을 그 다음 출력되도록 두번째에 저장
			if (pro.getWarnMark() != "Y") {
				thridProductList.add(pro);
			}
		}

		cri.setPerPageNum(10); // 한 페이지에 7개씩 나오도록 perPageNum숫자 설정
		int totalCount = retrieveDAO.selectSearchRetrieveProductListCount(cri);
		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker(); // 페이지메이커 인스턴스 생성 후 데이터 설정
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		List<ProductVO> productPageList = new ArrayList<ProductVO>(); // 최종적으로 출력될 productPageList 리스트 인스턴스 생성.

		for (int i = cri.getStartRowNum(); i < cri.getStartRowNum() + cri.getPerPageNum(); i++) { // 페이지에 따라 출력되는 행의
																									// 번호수를 받기위해 반복문.
			if (thridProductList.size() <= i) {
				break;
			}
			productPageList.add(thridProductList.get(i));
		}

		product.put("productList", productPageList);

		//System.out.println("/////////////////////productPageList" + productPageList.get(0));

		product.put("pageMaker", pageMaker);
		return product;
	}

	@Override
	public int selectRetrieveNo() throws SQLException {
		// TODO Auto-generated method stub
		return retrieveDAO.selectRetrieveNo();
	}

	@Override
	public int insertRetrieve(InsertRetrieveCommand insertRetrieveCommand) throws SQLException {
		// TODO Auto-generated method stub
		return retrieveDAO.insertRetrieve(insertRetrieveCommand);
	}

	@Override
	public int insertRetrieveList(InsertRetrieveCommand insertRetrieveCommand) throws SQLException {
		// TODO Auto-generated method stub
		return retrieveDAO.insertRetrieveList(insertRetrieveCommand);
	}

	@Override
	public int updateProductNum(InsertRetrieveCommand insertRetrieveCommand) throws SQLException {
		// TODO Auto-generated method stub
		return retrieveDAO.updateProductNum(insertRetrieveCommand);
	}

	@Override
	public int selectMaxRetrieveNo() throws SQLException {
		// TODO Auto-generated method stub
		return retrieveDAO.selectMaxRetrieveNo();
	}

	@Override
	public int zeroProductDelete(InsertRetrieveCommand insertRetrieveCommand) throws SQLException {
		// TODO Auto-generated method stub
		return retrieveDAO.zeroProductDelete(insertRetrieveCommand);
	}

	@Override
	public Map<String, Object> getRetrieveList(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		System.out.println("cri page : " + cri.getPage());

		cri.setPerPageNum(9);

		List<RetrieveCommand> retrieveList = retrieveDAO.selectRetrieveList(cri);

		int totalCount = retrieveDAO.selectSearchRetrieveListCount(cri);

		System.out.println("retrieveList :" + retrieveList.size());
		System.out.println("totalCount :" + totalCount);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("retrieveList", retrieveList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public List<RetrieveListVO> getRetriveDetail(String retrieveNo) throws SQLException {
		// TODO Auto-generated method stub
		return retrieveDAO.selectRetrieveListDetail(retrieveNo);
	}


}
