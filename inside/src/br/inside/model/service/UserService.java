package br.inside.model.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.inside.model.dao.UserDAO;
import br.inside.model.entity.User;

@Service
public class UserService {

	private UserDAO dao;
	
	@Autowired
	public UserService(UserDAO dao) {
		this.dao = dao;
	}

	public boolean login(User user) {		
		if(dao.login(user))
			return true;
		else
			return false;		
	}
}
