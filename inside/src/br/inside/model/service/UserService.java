package br.inside.model.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.inside.model.dao.UserDAO;
import br.inside.model.entity.User;

@Service
public class UserService {
	
	private UserDAO dao;
	
	@Autowired
	public UserService(UserDAO udao) {
		this.dao = udao;
	}

	public User login(User user) throws IOException {		
		User userLogged = dao.login(user);
		if(userLogged != null)
			return userLogged;
		else
			return null;		
	}
}
