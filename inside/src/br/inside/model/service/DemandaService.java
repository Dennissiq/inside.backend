package br.inside.model.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.inside.model.dao.DemandaDAO;
import br.inside.model.entity.Demanda;
import br.inside.model.entity.Funcionario;
import br.inside.model.entity.Producao;
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
	public Demanda iniciarTarefa(int idDemanda, ProducaoService ps) {
		Producao producao = new Producao();		
		Demanda d = dao.buscarDemanda(idDemanda);
		if(d.getStatus().equals("aberto") || d.getStatus().equals("pausado") ) {
			producao.setData(new Date());
			producao.setDemanda(dao.buscarDemanda(idDemanda));
			producao.setHoraInicio(new Timestamp(new Date().getTime()));			
			ps.criar(producao);
		}
		
		return dao.iniciarTarefa(idDemanda);
	}
	
	@Transactional
	public Demanda pausarTarefa(int idDemanda, ProducaoService ps) {
		Demanda demanda = dao.buscarDemanda(idDemanda);
		Producao producao = ps.buscarProducao(demanda);
		producao.setHoraFim(new Timestamp(new Date().getTime()));			
		ps.atualizar(producao);
		
		return dao.pausarTarefa(idDemanda);
	}
	
	@Transactional
	public Demanda finalizarTarefa(int idDemanda, ProducaoService ps) {
		return dao.finalizarTarefa(idDemanda);
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
