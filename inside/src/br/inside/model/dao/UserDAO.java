package br.inside.model.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.inside.model.entity.User;

@Repository
public class UserDAO {
	
	@PersistenceContext //Injeção de dependencia do EntityManager
	EntityManager manager;
	
	public boolean login(User user) {
		if(manager.find(User.class, user.getLogin()) != null)
			return true;
		else
			return false;
	}
}
