package br.inside.model.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.inside.model.entity.Demanda;
import br.inside.model.entity.Funcionario;
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
	
	public Demanda iniciarTarefa(int idDemanda) {		
		
		String jpql = "update tb_demanda set status = 'em andamento' WHERE id = :id";
				
		Query query = manager.createQuery(jpql);
		query.setParameter("id", idDemanda);
		query.executeUpdate();
		
		return this.buscarDemanda(idDemanda);
	}	
	
	public Demanda pausarTarefa(int idDemanda) {		
		
		String jpql = "update tb_demanda set status = 'pausado' WHERE id = :id";
				
		Query query = manager.createQuery(jpql);
		query.setParameter("id", idDemanda);
		query.executeUpdate();
		
		return this.buscarDemanda(idDemanda);
	}	
	
	public Demanda finalizarTarefa(int idDemanda) {		
		
		String jpql = "update tb_demanda set status = 'finalizado' WHERE id = :id";
				
		Query query = manager.createQuery(jpql);
		query.setParameter("id", idDemanda);
		query.executeUpdate();
		
		return this.buscarDemanda(idDemanda);
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
	
	@SuppressWarnings("unchecked")
	public List<Demanda> listarDemandasPorAnalista(Funcionario f){
		String jpql = "select d from tb_demanda d where d.funcionario = :funcionario";
		
		Query query = manager.createQuery(jpql);
		query.setParameter("funcionario", f);

		List<Demanda> result = query.getResultList();
		return result;
	}
	
	public List<Demanda> listarDemandasNoPeriodoSolicitado(Demanda demanda){
		String jpql = "select d from tb_demanda d where d.funcionario = :funcionario AND :startDate BETWEEN d.dtInicio AND d.dtFim";
		
		Query query = manager.createQuery(jpql);
		query.setParameter("funcionario", demanda.getFuncionario());
		query.setParameter("startDate", demanda.getDtInicio());

		@SuppressWarnings("unchecked")
		List<Demanda> result = query.getResultList();
			
		return result;
	}
}
