package br.inside.model.dao;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.inside.model.entity.Cliente;
import br.inside.model.entity.User;

@Repository
public class ClienteDAO {
	@PersistenceContext
	EntityManager manager;
	
	public int inserirCliente(Cliente cliente) throws IOException{	
		System.out.println(cliente.toString());
		manager.persist(cliente);
		return cliente.getId();
	}
	
	public Cliente buscarCliente(int id) throws IOException{
		return manager.find(Cliente.class, id);
	}
	
	public Cliente buscarCliente(User login) throws IOException{
		String jpql = "select d from tb_cliente d where d.user = :login";
		
		Query query = manager.createQuery(jpql);
		query.setParameter("login", login);

		
		@SuppressWarnings("unchecked")
		List<Cliente> result = query.getResultList();	
		
		if(result.size() > 0)
			return result.get(0);
		
		return null;
	}
	
	public void atualizarCliente(Cliente cliente) throws IOException{
		manager.merge(cliente);
	}
	
	public void removerCliente(Cliente cliente) throws IOException{
		manager.remove(manager.find(Cliente.class, cliente.getId()));
	}
	
	@SuppressWarnings("unchecked")
	public List<Cliente> listarClientes() throws IOException{
		return manager.createQuery("select f from tb_cliente f").getResultList();
	}
}
