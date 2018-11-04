package br.inside.model.dao;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.inside.model.entity.Cargo;

@Repository
public class CargoDAO {
	
	@PersistenceContext
	EntityManager manager;
	
	public int inserirCargo(Cargo cliente) throws IOException{	
		System.out.println(cliente.toString());
		manager.persist(cliente);
		return cliente.getId();
	}
	
	public Cargo buscarCargo(int id) throws IOException{
		return manager.find(Cargo.class, id);
	}
	
	public void atualizarCargo(Cargo cliente) throws IOException{
		manager.merge(cliente);
	}
	
	public void removerCargo(Cargo cliente) throws IOException{
		manager.remove(manager.find(Cargo.class, cliente.getId()));
	}
	
	@SuppressWarnings("unchecked")
	public List<Cargo> listarCargos() throws IOException{
		return manager.createQuery("select f from tb_cargo f").getResultList();
	}
}
