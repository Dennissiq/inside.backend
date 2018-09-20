package br.inside.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AutorizadorInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller)
			throws Exception {
		
		String uri = request.getRequestURI();
		
		if(uri.endsWith("index") || uri.endsWith("login") || uri.endsWith("logou") ||
			uri.contains("css") || uri.contains("js") ||
			uri.contains("img")){
			
			if (request.getSession().getAttribute("usuario") != null) {
				return true;
			}else {
				response.sendRedirect("index");
			}			
		}
		
		if (request.getSession().getAttribute("usuario") != null) {
			return true;
		}
		
		response.sendRedirect("index");
		
		return false;
	}
}