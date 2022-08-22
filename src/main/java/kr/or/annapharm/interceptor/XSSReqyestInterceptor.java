package kr.or.annapharm.interceptor;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.w3c.dom.html.HTMLInputElement;

import com.josephoconnell.html.HTMLInputFilter;



public class XSSReqyestInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Enumeration<String> crossParamNames = request.getParameterNames();
		
		while(crossParamNames.hasMoreElements()) {
			String paramName = crossParamNames.nextElement(); //키값
			String paramValue = request.getParameter(paramName); //value 값
			
			request.setAttribute("XSS"+paramName, HTMLInputFilter.htmlSpecialChars(paramValue));
			
		}
		
		return false;
	}
	
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		// TODO Auto-generated method stub
//
//	}
//
//	@Override
//	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
//			throws Exception {
//		// TODO Auto-generated method stub
//
//	}


}
