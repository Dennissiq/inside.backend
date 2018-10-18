package br.inside.model.service;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.inside.model.dao.ClienteDAO;
import br.inside.model.entity.Cliente;
import br.inside.model.entity.User;

@Service
public class ClienteService {
	private ClienteDAO dao;
	
	@Autowired
	public ClienteService(ClienteDAO cdao) {
		dao = cdao;
	}
	
	public Cliente buscarCliente(int id) throws IOException{
		return dao.buscarCliente(id);
	}
	
	public Cliente buscarCliente(User login) throws IOException{
		return dao.buscarCliente(login);
	}
	
	@Transactional
	public Cliente inserirCliente(Cliente cliente) throws IOException{
		int id = dao.inserirCliente(cliente);
		cliente.setId(id);
		return cliente;
	}
	
	@Transactional
	public void removerCliente(Cliente cliente) throws IOException{
		dao.removerCliente(cliente);
	}
	
	@Transactional
	public void atualizarCliente(Cliente cliente) throws IOException{
		dao.atualizarCliente(cliente);
	}
	
	public List<Cliente> listarClientes() throws IOException{
		return dao.listarClientes();
	}
	
}
