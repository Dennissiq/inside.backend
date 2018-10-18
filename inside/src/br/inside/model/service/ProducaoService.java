package br.inside.model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.inside.model.dao.ProducaoDAO;
import br.inside.model.entity.Demanda;
import br.inside.model.entity.Producao;
import br.inside.model.entity.Projeto;

@Service
public class ProducaoService {
	@Autowired
	private ProducaoDAO dao;
	
	@Transactional
	public Producao criar(Producao producao) {		
		return dao.criar(producao);
	}
	
	@Transactional
	public Producao atualizar(Producao producao) {
		return dao.atualizar(producao);
	}
	
	public Producao buscarProducao(int id) {
		return dao.buscarProducao(id);
	}
	
	public Producao buscarProducao(Demanda demanda) {
		return dao.buscarProducao(demanda);
	}
	
	public List<Producao> listarProducoes(){
		return dao.listarProducoes();
	}
	
	public List<Producao> listarProducoes(String chave){
		return dao.listarProducoes(chave);
	}
	
	public List<Producao> listarProducoes(Projeto projeto){
		return dao.listarProducoes(projeto);
	}
}
