package br.inside.model.dao;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.inside.model.entity.Cargo;
import br.inside.model.entity.Demanda;
import br.inside.model.entity.Funcionario;
import br.inside.model.entity.User;

@Repository
public class FuncionarioDAO {
	@PersistenceContext
	EntityManager manager;
	
	public int inserirFuncionario(Funcionario funcionario) throws IOException{	
		System.out.println(funcionario.toString());
		manager.persist(funcionario);
		return funcionario.getIdFuncionario();
	}
	
	public Funcionario buscarFuncionario(int idFuncionario) throws IOException{
		return manager.find(Funcionario.class, idFuncionario);
	}
	
	public Funcionario buscarFuncionario(User login) throws IOException{
		String jpql = "select d from tb_funcionario d where d.user = :login";
		
		Query query = manager.createQuery(jpql);
		query.setParameter("login", login);
		
		@SuppressWarnings("unchecked")
		List<Funcionario> result = query.getResultList();	
		
		if(result.size() > 0)
			return result.get(0);
		
		return null;
	}
	
	public Funcionario atualizarFuncionario(Funcionario funcionario) throws IOException{
		return manager.merge(funcionario);
	}
	
	public void removerFuncionario(Funcionario funcionario) throws IOException{
		manager.remove(manager.find(Funcionario.class, funcionario.getIdFuncionario()));
	}
	
/*	@SuppressWarnings("unchecked")
	public List<Funcionario> listarFuncionarios() throws IOException{
		return manager.createQuery("select f from tb_funcionario f").getResultList();
	}*/
	
	@SuppressWarnings("unchecked")
	public List<Funcionario> listarFuncionarios(int idCargo) throws IOException{
		String jpql = "select f from tb_funcionario f where f.cargo.id = :funcionario";
		
		Query query = manager.createQuery(jpql);
		query.setParameter("funcionario", idCargo);

		@SuppressWarnings("unchecked")
		List<Funcionario> result = query.getResultList();
		System.out.println(result);
		System.out.println(idCargo);
		return result;
	}
}
