package main.support;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import annotation.CheckAuth;
import annotation.NoCheckLogin;
import annotation.CheckAuth.auth;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)	throws Exception {
		
		/*Annotation이 Controller에 존재하는지 판별하기 위한 정의*/
		NoCheckLogin noCheckLogin = ((HandlerMethod)handler).getMethodAnnotation(NoCheckLogin.class);
		CheckAuth checkAuth = ((HandlerMethod)handler).getMethodAnnotation(CheckAuth.class);

		/* NoLoginCheck가 존재하면 실행 안함 */
		if(noCheckLogin != null){
			return true;
		}
		
		boolean result = true;
		int permission = Integer.parseInt(request.getSession().getAttribute("sessionPermission").toString());
		
		// checkAuth 어노테이션이 존재하고, value값에 따라 인증절차 진행
		if (checkAuth != null && checkAuth.value() == auth.ADMIN) {
			/* 퍼미션이 0(관리자)가 아니면 로그인 페이지로 이동 */
			if (permission != 0) {
				/* 권한이 없을 때 사용 하는 페이지로 이동 
				 * 관리자 계정의 권한이 없을 시 
				 * */
				/*PrintWriter printwriter = response.getWriter();
				printwriter.print("<script>alert('관리자 권한이 없습니다.');</script>");
				printwriter.flush();
				printwriter.close();*/
				/*response.sendRedirect("http://localhost:9090/teatime/storyBoard.list");*/
				response.sendRedirect(request.getContextPath() + "/AuthFail?result=notAdmin");
				result = false;
			}

		} // checkAuth admin - end
		else if (checkAuth != null && checkAuth.value() == auth.USER) {
			if (permission != 1 && permission != 0) {
				/* 권한이 없을 때 사용 하는 페이지로 이동 
				 * 유저 권한이 없을 시 (정지되면)
				 * */
				response.sendRedirect(request.getContextPath() + "/AuthFail?result=suspend");
				result = false;
			}
		} // checkAuth user - end
		else if (checkAuth != null && checkAuth.value() == auth.ALL) {
			if (permission != 1 && permission != 0 && permission != 2) {
				/* 권한이 없을 때 사용 하는 페이지로 이동 
				 * 모든 권한 검사 (앵간해선 안빠져나감;)
				 * */
				response.sendRedirect(request.getContextPath() + "/AuthFail?result=common");
				result = false;
			}
		} // checkAuth all - end
		
		
		return result;
	}

}
