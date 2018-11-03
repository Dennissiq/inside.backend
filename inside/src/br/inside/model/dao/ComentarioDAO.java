package br.inside.model.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.inside.model.entity.Comentario;
import br.inside.model.entity.Demanda;
import br.inside.model.entity.Projeto;

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
	
	@SuppressWarnings("unchecked")
	public List<Comentario> listarComentarios(Demanda demanda){
		String jpql = "select d from tb_comentario d where d.demanda = :demanda";
		
		Query query = manager.createQuery(jpql);
		query.setParameter("demanda", demanda);

		List<Comentario> result = query.getResultList();
		return result;
	}
	
}
