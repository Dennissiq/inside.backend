package br.inside.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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
public class DemandaRestController {

	@Autowired
	private DemandaService demandaService;
	
	@Autowired
	private ProjetoService projetoService;	
	
	@Autowired
	private FuncionarioService funcionarioService;
	
	@RequestMapping(method = RequestMethod.GET, value ="rest/demandas")
	public @ResponseBody List<Demanda> demandasView(@RequestParam String id) {
		List<Demanda> lista;
		
		try {						
			Funcionario f = funcionarioService.buscarFuncionario(Integer.parseInt(id));
			lista = demandaService.listarDemandasAtivasPorAnalista(f);
			return lista;
			
		} catch (Exception e) {
			// TODO: handle exception
			return new ArrayList<Demanda>();
		}		
	}
	
	@RequestMapping(method = RequestMethod.GET, value ="rest/allDemandas/{idProjeto}")
	public @ResponseBody List<Demanda> demandasView(@PathVariable("idProjeto") int idProjeto) {
		List<Demanda> lista;
		
		try {			
			Projeto projeto = projetoService.buscarProjeto(idProjeto);
			lista = demandaService.listarDemandas(projeto);
			return lista;
			
		} catch (Exception e) {
			// TODO: handle exception
			return new ArrayList<Demanda>();
		}		
	}
	
	
	@RequestMapping(method = RequestMethod.PUT, value = "rest/demanda")
	public ResponseEntity<Demanda> editarDemanda(@RequestParam int id) {		
		System.out.println(id);
		//System.out.println(dtInicio);
		//System.out.println(dtFim);
		
		try {
			Demanda demanda = demandaService.buscarDemanda(id);
			//demanda.setDtInicio(dtInicio);
			//demanda.setDtFim(dtFim);
			//demanda = demandaService.atualizar(demanda);
			return new ResponseEntity<Demanda>(demanda, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.toString());
			return new ResponseEntity<Demanda>(new Demanda(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
