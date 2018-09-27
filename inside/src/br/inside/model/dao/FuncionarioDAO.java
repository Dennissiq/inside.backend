package br.inside.model.dao;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.inside.model.entity.Funcionario;

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
	
	public void atualizarFuncionario(Funcionario funcionario) throws IOException{
		manager.merge(funcionario);
	}
	
	public void removerFuncionario(Funcionario funcionario) throws IOException{
		manager.remove(manager.find(Funcionario.class, funcionario.getIdFuncionario()));
	}
	
	public List<Funcionario> listarFuncionarios() throws IOException{
		return manager.createQuery("select f from tb_funcionario f").getResultList();
	}
}
