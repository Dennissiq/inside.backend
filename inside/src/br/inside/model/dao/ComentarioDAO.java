package br.inside.model.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.inside.model.entity.Comentario;

@Repository
public class ComentarioDAO {

	@PersistenceContext
	EntityManager manager;
	
	public Comentario criar(Comentario comentario) {
		manager.persist(comentario);
		return comentario;
	}
	
	public void removerComentario(Comentario comentario) {
		manager.remove(comentario);
	}
	
}
