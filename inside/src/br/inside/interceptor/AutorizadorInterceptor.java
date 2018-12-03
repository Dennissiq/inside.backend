package br.inside.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import br.inside.model.entity.User;

public class AutorizadorInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller)
			throws Exception {
		
		String uri = request.getRequestURI();
		
		System.out.println(uri);
		
		if (request.getSession().getAttribute("usuario") != null) {
			User user = (User) request.getSession().getAttribute("usuario");
			
			if(user.getPerfil().getNome().equals("Analista")) {
				if(uri.contains("projetos") || uri.contains("novoProjeto") || uri.contains("editarProjeto")
					|| uri.contains("editarDemanda") || uri.contains("novaDemanda") || uri.contains("addDemanda")
					|| uri.contains("cliente") 
					|| uri.contains("listar_analistas") || uri.contains("novo_analista")
					|| uri.contains("listar_gestores") || uri.contains("novo_admin")){
					
					response.sendRedirect("index");
					return false;
				}				
			}
			
			return true;
		}
		
		if(uri.endsWith("index") || uri.endsWith("login") || uri.endsWith("logout") ||
			uri.contains("css") || uri.contains("js") ||
			uri.contains("img")){					
			
			return true;		
		}
		response.sendRedirect("index");	
		return false;
	}
}