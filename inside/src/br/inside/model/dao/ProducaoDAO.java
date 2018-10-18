package br.inside.model.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.inside.model.entity.Demanda;
import br.inside.model.entity.Funcionario;
import br.inside.model.entity.Producao;
import br.inside.model.entity.Projeto;

@Repository
public class ProducaoDAO {

	@PersistenceContext
	EntityManager manager;
	
	public Producao criar(Producao producao) {
		manager.persist(producao);
		return producao;
	}
	
	public Producao atualizar(Producao producao) {
		return manager.merge(producao);
	}
	
	public Producao buscarProducao(int id) {
		return manager.find(Producao.class, id);
	}
	
	public Producao buscarProducao(Demanda demanda) {
		String jpql = "select p from tb_producao p where p.demanda = :demanda";
		
		Query query = manager.createQuery(jpql);
		query.setParameter("demanda", demanda);

		List<Producao> result = query.getResultList();
		return result.get(result.size()-1);
	}
	
	@SuppressWarnings("unchecked")
	public List<Producao> listarProducoes(){
		return manager.createQuery("select p from tb_producao p").getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Producao> listarProducoes(String chave){
		String jpql = "select p from tb_producao p where p.nome like :chave";
		
		Query query = manager.createQuery(jpql);
		query.setParameter("chave", "%"+chave+"%");

		List<Producao> result = query.getResultList();
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<Producao> listarProducoes(Projeto projeto){
		String jpql = "select d from tb_producao d where d.projeto = :projeto";
		
		Query query = manager.createQuery(jpql);
		query.setParameter("projeto", projeto);

		List<Producao> result = query.getResultList();
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<Producao> listarProducoesPorAnalista(Funcionario f){
		String jpql = "select d from tb_producao d where d.funcionario = :funcionario";
		
		Query query = manager.createQuery(jpql);
		query.setParameter("funcionario", f);

		List<Producao> result = query.getResultList();
		
		System.out.println(result.toString());
		return result;
	}

}