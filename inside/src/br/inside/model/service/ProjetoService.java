package br.inside.model.service;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.inside.model.dao.ProjetoDAO;
import br.inside.model.entity.Projeto;

@Service
public class ProjetoService {
	
	@Autowired
	private ProjetoDAO dao;
	
	@Transactional
	public Projeto criar(Projeto projeto) {		
		return dao.criar(projeto);
	}
	
	@Transactional
	public Projeto atualizarProjeto(Projeto projeto) {
		return dao.atualizar(projeto);
	}
	
	public Projeto buscarProjeto(int id) {
		return dao.buscarProjeto(id);
	}
	
	public List<Projeto> listarProjetos(){
		return dao.listarProjetos();
	}
	
	public List<Projeto> listarProjetos(String chave){
		return dao.listarProjetos(chave);
	}
	
	public List<Long> quantidadeAnalistas(){
		return dao.quantidadeAnalistas();
	}
	
	public Long tarefasRealizadas(int id_projeto) {
		return dao.tarefasRealizadas(id_projeto);
	}
	
	/*public int funcionarioPorProjeto(int id_projeto) {
		return dao.funcionarioPorProjeto(id_projeto);
	}*/
}
