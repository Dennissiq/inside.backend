package br.inside.model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.inside.model.dao.DemandaDAO;
import br.inside.model.entity.Demanda;
import br.inside.model.entity.Funcionario;
import br.inside.model.entity.Projeto;

@Service
public class DemandaService {

	@Autowired
	private DemandaDAO dao;
	
	@Transactional
	public Demanda criar(Demanda demanda) {		
		return dao.criar(demanda);
	}
	
	@Transactional
	public Demanda atualizar(Demanda demanda) {
		return dao.atualizar(demanda);
	}
	
	@Transactional
	public Demanda iniciarTarefa(int idDemanda) {
		return dao.iniciarTarefa(idDemanda);
	}
	
	public Demanda buscarDemanda(int id) {
		return dao.buscarDemanda(id);
	}
	
	public List<Demanda> listarDemandas(){
		return dao.listarDemandas();
	}
	
	public List<Demanda> listarDemandas(String chave){
		return dao.listarDemandas(chave);
	}
	
	public List<Demanda> listarDemandas(Projeto projeto){
		return dao.listarDemandas(projeto);
	}
	
	public List<Demanda> listarDemandasPorAnalista(Funcionario funcionario){
		return dao.listarDemandasPorAnalista(funcionario);
	}
}
