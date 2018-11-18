package br.inside.model.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.inside.model.entity.Projeto;

@Repository
public class ProjetoDAO {

	@PersistenceContext
	EntityManager manager;
	
	public Projeto criar(Projeto projeto) {
		manager.persist(projeto);
		return projeto;
	}
	
	public Projeto atualizar(Projeto projeto) {
		return manager.merge(projeto);
	}
	
	public Projeto buscarProjeto(int id) {
		return manager.find(Projeto.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Projeto> listarProjetos(){
		return manager.createQuery("select p from tb_projeto p").getResultList();
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Projeto> listarProjetos(String chave){
		String jpql = "select p from tb_projeto p where p.nome like :chave";
		
		Query query = manager.createQuery(jpql);
		query.setParameter("chave", "%"+chave+"%");

		List<Projeto> result = query.getResultList();
		return result;
	}
	
	public int tarefasRealizadas(int id_projeto) {
		String jpql = "select count(d) from tb_demanda d where d.status = 'finalizado' AND d.projeto.id = :id_projeto";
		
		Query query = manager.createQuery(jpql);
		query.setParameter("id_projeto", "%"+id_projeto+"%");
		
		int result = query.getFirstResult();
		
		System.out.println(result);
		return result;
	}
	
	/*public Projeto funcionarioPorProjeto(int id_projeto) {
		String jpql = "select count(distinct id_funcionario) from tb_demanda group by :id_projeto";
		
		Query query = manager.createQuery(jpql);
		query.setParameter("id_projeto", "%"+id_projeto+"%");
		
		Projeto result = (Projeto) query.getSingleResult();
		return result;
	}*/
}