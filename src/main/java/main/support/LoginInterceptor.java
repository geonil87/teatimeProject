package main.support;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import annotation.NoCheckLogin;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		/*Annotation이 Controller에 존재하는지 판별하기 위한 정의*/
		NoCheckLogin noCheckLogin = ((HandlerMethod)handler).getMethodAnnotation(NoCheckLogin.class);
		boolean result = true;
		
		/*noCheckLogin 어노테이션이 존재하지 않을때만 인터셉터가 실행됨*/
		if(noCheckLogin == null){
		
			
			/*	로그인이 되어있는지 확인을 위한 세션 체크
			 * 	null	: 로그인을 위해 로그인 페이지 이동
			 *  !null	: 인터셉트 종료				*/
			if(request.getSession().getAttribute("sessionPermission") == null){
				String url = request.getHeader("Referer");
				if(url == null){
					response.sendRedirect(request.getContextPath()+"/member.login");
					return false;
				}
				
				url = url.substring(url.lastIndexOf("/")+1, url.length());
				
				/*이전 페이지 URL 세션에 저장 저장 : - 로그인 페이지에서 로그인 후 이전 페이지로 돌아가기 위한 페이지 저장*/
				request.getSession().setAttribute("prevPage", url);
				response.sendRedirect(request.getContextPath()+"/member.login");
				return false;
			} // 로그인 확인 - end
			
		}else{
			
		}// noCheckLogin if문 - end
		return result;
	}
	
	
	
}
