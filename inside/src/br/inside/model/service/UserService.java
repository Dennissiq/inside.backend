package br.inside.model.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.inside.model.dao.UserDAO;
import br.inside.model.entity.User;

@Service
public class UserService {

	@Autowired
	private UserDAO dao;
	
	public String login(User user, HttpServletRequest request) {		
		if(dao.login(user)) {
			request.getSession().setAttribute("usuario", user);
			if(user.getPerfil().getNome() == "Administrador")
				return "projetos";
			else
				return "demandas";
		}else {
			request.getSession().setAttribute("error", "Login e/ou Senha inválidos.");
			return "index";
		}			
	}
}
