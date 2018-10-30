package br.inside.model.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.inside.model.entity.Arquivo;

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
}
