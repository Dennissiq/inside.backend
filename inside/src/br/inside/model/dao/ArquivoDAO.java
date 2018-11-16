package br.inside.model.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.inside.model.entity.Arquivo;
import br.inside.model.entity.Demanda;

@Repository
public class ArquivoDAO {

	@PersistenceContext
	EntityManager manager;
	
	public Arquivo persistir(Arquivo arquivo) {
		manager.persist(arquivo);
		return arquivo;
	}
	
	public void removerArquivo(Arquivo arquivo) {
		manager.remove(arquivo);
	}
	
	@SuppressWarnings("unchecked")
	public List<Arquivo> listarArquivos(Demanda demanda){
		String jpql = "select d from tb_arquivo d where d.demanda = :demanda";
		
		Query query = manager.createQuery(jpql);
		query.setParameter("demanda", demanda);

		List<Arquivo> result = query.getResultList();
		return result;
	}
}
