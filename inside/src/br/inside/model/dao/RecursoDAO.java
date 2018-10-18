package br.inside.model.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.inside.model.entity.Demanda;
import br.inside.model.entity.Recurso;
import br.inside.model.entity.User;

@Repository
public class RecursoDAO {

	@PersistenceContext
	EntityManager manager;
	
	public Recurso criarRecurso(Demanda demanda, User usuario) {
		Recurso recurso = new Recurso();
		recurso.setDemanda(demanda);
		recurso.setUsuario(usuario);
		
		manager.persist(recurso);
		
		return recurso;
	}
	
	public void removerRecurso(Recurso recurso) {
		manager.remove(recurso);
	}
	
}