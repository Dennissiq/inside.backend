package br.inside.model.dao;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.inside.model.entity.User;

@Repository
public class UserDAO {
	
	@PersistenceContext //Injeção de dependencia do EntityManager
	EntityManager manager;
	
	public User login(User user) {
		User result = manager.find(User.class, user.getLogin());
		
		if(result == null)
			return null;
					
		if(result.getSenha().equals(user.getSenha()))
			return result;
		
		return null;		
	}
}
