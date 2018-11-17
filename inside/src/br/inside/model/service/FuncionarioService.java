package br.inside.model.service;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.inside.model.dao.FuncionarioDAO;
import br.inside.model.entity.Funcionario;
import br.inside.model.entity.User;

@Service
public class FuncionarioService {
	private FuncionarioDAO dao;
	
	@Autowired
	public FuncionarioService(FuncionarioDAO fdao) {
		dao = fdao;
	}
	
	public Funcionario buscarFuncionario(int idFuncionario) throws IOException{
		return dao.buscarFuncionario(idFuncionario);
	}
	
	public Funcionario buscarFuncionario(User login) throws IOException{
		return dao.buscarFuncionario(login);
	}
	
	@Transactional
	public Funcionario inserirFuncionario(Funcionario funcionario) throws IOException{
		int idFuncionario = dao.inserirFuncionario(funcionario);
		funcionario.setIdFuncionario(idFuncionario);
		return funcionario;
	}
	
	@Transactional
	public void removerFuncionario(Funcionario funcionario) throws IOException{
		dao.removerFuncionario(funcionario);
	}
	
	@Transactional
	public Funcionario atualizarFuncionario(Funcionario funcionario) throws IOException{
		return dao.atualizarFuncionario(funcionario);
	}
	
	public List<Funcionario> listarFuncionarios(int idCargo) throws IOException{
		return dao.listarFuncionarios(idCargo);
	}
	
}
