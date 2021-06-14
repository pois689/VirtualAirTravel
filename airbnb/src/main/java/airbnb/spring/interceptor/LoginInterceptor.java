package airbnb.spring.interceptor;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import airbnb.spring.dto.User;
import airbnb.spring.service.LoginService;
import lombok.extern.log4j.Log4j;



@Log4j
public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	LoginService service;
	
	/**
	 * 컨트롤러 실행전에 실행(화면 불러오기전에)
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		return true;
		
	}
	/**
	 * 컨트롤러 실행후(컨트롤러 실행후) 로그인 처리
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");//object를 user로 형변환 내가 정해준 이름"user"
		System.out.println("\nuser\n\n\n\n\n\n\n"+user);
		System.out.println("\nrequest.getAttribute(\"useCookie\")\n\n\n\n\n\n\n"+request.getParameter("useCookie"));
		if(user != null 
				&& request.getParameter("useCookie") != null) { //useCookie 체크박스에 체크되있다면
			 user.setSessionkey(session.getId()); 
			 service.updateSessionKey(user);
			 Cookie loginCookie = new Cookie("loginCookie", session.getId());
			 loginCookie.setMaxAge(60*60*24*7); //7일
			 loginCookie.setPath("/");
			 response.addCookie(loginCookie);
			 String tmpUri = (String)session.getAttribute("tmlUri");
			 if(!StringUtils.isEmpty(tmpUri)) {
				 response.sendRedirect(tmpUri);
			 }
		}
		
		
		
	}
	

}
