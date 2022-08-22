package kr.or.annapharm.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawling {
	private static String stockList = "https://nedrug.mfds.go.kr/pbp/CCBBB01/getItemDetail?itemSeq=";
	
//	public static void getCrawlingPage(int md_no) {
//
//		Connection conn = Jsoup.connect(stockList+md_no);
//
//		try {
//			Document document = conn.get();
//			Map<String, String> divs = getStockHeader(document); // 칼럼명
//			System.out.println(divs.get("effect"));
//			System.out.println("----------------------------------------");
//			System.out.println(divs.get("use"));
//			System.out.println("----------------------------------------");
//
//////			Map<String, List<String>> map = getAttention(document);
////			List<String> keyList = new ArrayList<String>(map.keySet());
////			Collections.sort(keyList);
////
////			for (String key : keyList) {
////				System.out.println(key);
////				for (String content : map.get(key)) {
////					System.out.println(content);
////				}
////			}
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//
//	}
	
//	public static void main(String[] args) {
//		new Crawling().getAttention(201802717);
//	}

	public static Map<String, List<String>> getAttention(int md_no) {
		Map<String, List<String>> detailMap = new HashMap<String, List<String>>();
		
		Connection conn = Jsoup.connect(stockList+md_no);
		Document document = null;
		try {
			document = conn.get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Elements attDivs = document.select("#scroll_05");
		Elements effectDivs = document.select("#scroll_03");
		Elements useDivs = document.select("#scroll_04");
		
		List<String> effectList = new ArrayList<String>();
		List<String> useList = new ArrayList<String>();
		
		
		if(effectDivs.select(".indent0").size() != 0) {			
			for (Element el : effectDivs.select(".indent0")) {
				effectList.add(el.text());
			}
		} else { 
			for (Element el : effectDivs.select(".title")) {
				effectList.add(el.text());
			}			
		}
		
		if(useDivs.select(".indent0").size() != 0) {			
			for (Element el : useDivs.select(".indent0")) {
				useList.add(el.text());
			}
		} else { 
			for (Element el : useDivs.select(".title")) {
				useList.add(el.text());
			}			
		}

		detailMap.put("effect", effectList);
		detailMap.put("use", useList);

		for (Element el : attDivs.select(".title")) {
			List<String> list = new ArrayList<String>();

			for (Element ele : el.nextElementSibling().select(".indent0")) {
				list.add(ele.text());
			}
			detailMap.put(el.text(), list);
		}

		return detailMap;
	}

//	public static Map<String, String> getStockHeader(Document document) {
//		Map<String, String> detailMap = new HashMap<String, String>();
//
//		/*
//		 * 효능효과: MD_EFFECT List<String> 용법용량: MD_USE List<String> 주의사항: MD_ATTENTION
//		 * Map<String, List<String>>
//		 */
//
//		Elements effectDivs = document.select("#scroll_03");
//		Elements useDivs = document.select("#scroll_04");
//	
//		String effect = "";
//		String use = "";
//
//		for (Element el : effectDivs.select(".indent0")) {
//			effect += el.text() + "\n";
//		}
//
//		detailMap.put("effect", effect);
//
//		for (Element el : useDivs.select(".indent0")) {
//			use += el.text() + "\n";
//		}
//
//		detailMap.put("use", use);
//
//		return detailMap;
//	}

}
