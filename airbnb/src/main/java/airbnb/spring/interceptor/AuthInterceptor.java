package airbnb.spring.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import airbnb.spring.dto.User;
import airbnb.spring.service.LoginService;


public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	LoginService service;
	
	/**
	 * This implementation always returns {@code true}.
	 * 
	 * 
	 * 		권한 확인 , 자동로그인확인
	 * 
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user == null) { //유저가 없고 로그인쿠키가 있으면 자동로그인,로그인쿠키까지없으면 null
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {
				user = service.loginSessionKey(loginCookie.getValue());
				if(user != null) {
					session.setAttribute("user", user);
				}
			}
		}
		if( user != null) {
			if(user.hasRole("ROLE_USER")) { //참이면 true
				return true;		
			}else {
				String tmpUri = request.getRequestURI(); //기존에 요청의 uri페이지 정보
				String query= request.getQueryString(); //기존 요청의 파라메터
				if(query != null) {
					tmpUri += "?" + query;
				}
				//loginprocess?
				session.setAttribute("tmpUri", tmpUri);
				//로그인 안함	
				response.sendRedirect("/login/login");
				return false;
			}
		}else {
			response.sendRedirect("/login/login");
			return false;
		}
	}

	/**
	 * This implementation is empty.
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
	}
}
