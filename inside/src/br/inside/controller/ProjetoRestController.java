package br.inside.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import br.inside.model.entity.Demanda;
import br.inside.model.entity.Funcionario;
import br.inside.model.entity.Projeto;
import br.inside.model.service.DemandaService;
import br.inside.model.service.FuncionarioService;
import br.inside.model.service.ProjetoService;

@RestController
public class ProjetoRestController {

	@Autowired
	private DemandaService demandaService;
	
	@Autowired
	private ProjetoService projetoService;	
	
	@Autowired
	private FuncionarioService funcionarioService;
	
/*	@RequestMapping(method = RequestMethod.GET, value ="rest/demandas")
	public @ResponseBody List<Demanda> projetosView(@RequestParam String id) {
		List<Demanda> lista;
		
		try {						
			Funcionario f = funcionarioService.buscarFuncionario(Integer.parseInt(id));
			lista = demandaService.listarDemandasAtivasPorAnalista(f);
			return lista;
			
		} catch (Exception e) {
			// TODO: handle exception
			return new ArrayList<Demanda>();
		}		
	}*/
	
/*	@RequestMapping(method = RequestMethod.GET, value ="rest/allFuncionarios/{idProjeto}")
	public @ResponseBody List<Projeto> projetosView(@PathVariable("idProjeto") int idProjeto) {
		List<Projeto> lista;
		
		try {			
			Projeto projeto = projetoService.buscarProjeto(idProjeto);
			lista = projetoService.listarProjetos();
			return lista;
			
		} catch (Exception e) {
			// TODO: handle exception
			return new ArrayList<Projeto>();
		}		
	}*/
}