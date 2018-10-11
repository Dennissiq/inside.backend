package br.inside.model.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.inside.model.entity.Demanda;
import br.inside.model.entity.Projeto;

@Repository
public class DemandaDAO {
	
	@PersistenceContext
	EntityManager manager;
	
	public Demanda criar(Demanda demanda) {
		manager.persist(demanda);
		return demanda;
	}
	
	public Demanda atualizar(Demanda demanda) {
		return manager.merge(demanda);
	}
	
	public Demanda buscarDemanda(int id) {
		return manager.find(Demanda.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Demanda> listarDemandas(){
		return manager.createQuery("select p from tb_demanda p").getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Demanda> listarDemandas(String chave){
		String jpql = "select p from tb_demanda p where p.nome like :chave";
		
		Query query = manager.createQuery(jpql);
		query.setParameter("chave", "%"+chave+"%");

		List<Demanda> result = query.getResultList();
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<Demanda> listarDemandas(Projeto projeto){
		String jpql = "select d from tb_demanda d where d.projeto = :projeto";
		
		Query query = manager.createQuery(jpql);
		query.setParameter("projeto", projeto);

		List<Demanda> result = query.getResultList();
		return result;
	}

}