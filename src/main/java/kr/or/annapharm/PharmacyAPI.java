package kr.or.annapharm;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.xml.sax.Attributes;
import org.xml.sax.helpers.DefaultHandler;

import kr.or.annapharm.service.SalesAnalysisService;

public class PharmacyAPI {

	private SalesAnalysisService salesAnalysisService;

	public void setSalesAnalysisService(SalesAnalysisService salesAnalysisService) {
		this.salesAnalysisService = salesAnalysisService;
	}


	// 약국별 full data 내려받기
	public static void main(String[] args) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyFullDown"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=tlkJ0%2BGNSZ3tibJ5IV7jCZpghwMWXWuwQEhsKGlp3singPDLV2bHnBgFLekiuWzPyBRMliAB2S%2BzLodvSyfAqw%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        URL url = new URL(urlBuilder.toString());
        System.out.println(url);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            new PharmacyAPI().saxRead(conn.getInputStream());
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        rd.close();
        conn.disconnect();
    }


	public void saxRead(InputStream ins) {
		SAXParserFactory factory = SAXParserFactory.newInstance();

		try {
			SAXParser parser = factory.newSAXParser();
			PharmacySaxHandler handler = new PharmacySaxHandler();
			parser.parse(ins, handler);

			List<PharmacyAPIVO> list = handler.getPersonList();
			System.out.println("크기 : " + list.size());

			for (PharmacyAPIVO p : list) {
				salesAnalysisService.test(p);
			}


		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	//이벤트 핸들러 클래스 설계
	class PharmacySaxHandler extends DefaultHandler{
		//파싱한 객체를 넣을 리스트
		private List<PharmacyAPIVO> pmvList;

		//파싱한 객체
		private PharmacyAPIVO pmv;

		//character 메서드에서 저장할 문자열 변수
		private String str;

		public PharmacySaxHandler() {
			pmvList = new ArrayList<>();
		}

		public void startElement(String uri, String localName, String name, Attributes att) {
			//시작 태그를 만났을 때 발생하는 이벤트
			if(name.equals("item")) {
				pmv = new PharmacyAPIVO();
				pmvList.add(pmv);
			}
		}
		public void endElement(String uri, String localName, String name) {
			//끝 태그를 만났을 때,
			if(name.equals("dutyAddr")) {
				pmv.setPiDutyaddr(str);
			}else if(name.equals("dutyName")) {
				pmv.setPiDutyname(str);
			}else if(name.equals("dutyTel1")) {
				pmv.setPiDutytel1(str);
			}else if(name.equals("dutyTime1c")) {
				pmv.setPiDutytime1c(str);
			}else if(name.equals("dutyTime1s")) {
				pmv.setPiDutytime1s(str);
			}else if(name.equals("dutyTime2c")) {
				pmv.setPiDutytime2c(str);
			}else if(name.equals("dutyTime2s")) {
				pmv.setPiDutytime2s(str);
			}else if(name.equals("dutyTime3c")) {
				pmv.setPiDutytime3c(str);
			}else if(name.equals("dutyTime3s")) {
				pmv.setPiDutytime3s(str);
			}else if(name.equals("dutyTime4c")) {
				pmv.setPiDutytime4c(str);
			}else if(name.equals("dutyTime4s")) {
				pmv.setPiDutytime4s(str);
			}else if(name.equals("dutyTime5c")) {
				pmv.setPiDutytime5c(str);
			}else if(name.equals("dutyTime5s")) {
				pmv.setPiDutytime5s(str);
			}else if(name.equals("dutyTime6c")) {
				pmv.setPiDutytime6c(str);
			}else if(name.equals("dutyTime6s")) {
				pmv.setPiDutytime6s(str);
			}else if(name.equals("dutyTime7c")) {
				pmv.setPiDutytime7c(str);
			}else if(name.equals("dutyTime7s")) {
				pmv.setPiDutytime7s(str);
			}else if(name.equals("dutyTime8c")) {
				pmv.setPiDutytime8c(str);
			}else if(name.equals("dutyTime8s")) {
				pmv.setPiDutytime8s(str);
			}else if(name.equals("hpid")) {
				pmv.setPiHpid(str);
			}else if(name.equals("postCdn1")) {
				pmv.setPiPostcdn1(str);
			}else if(name.equals("postCdn2")) {
				pmv.setPiPostcdn2(str);
			}else if(name.equals("rnum")) {
				pmv.setPiRnum(str);
			}else if(name.equals("wgs84Lat")) {
				pmv.setPiWgs84lat(str);
			}else if(name.equals("wgs84Lon")) {
				pmv.setPiWgs84lon(str);
			}
		}
		public void characters(char[] ch, int start, int length) {
			//태그와 태그 사이의 내용을 처리
			str = new String(ch,start,length);
		}
	    public List<PharmacyAPIVO> getPersonList(){
			return pmvList;
		}
		public void setPersonList(List<PharmacyAPIVO> personList) {
			this.pmvList=personList;
		}

	}


}


