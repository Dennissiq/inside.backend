package br.inside.controller;

import java.util.ArrayList;
import java.util.List;

import javax.swing.plaf.synth.SynthSeparatorUI;

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
	
	@RequestMapping(method = RequestMethod.GET, value ="rest/analistasPorProjeto")
	public @ResponseBody List<Long> demandasView() {
		//List<Integer> lista;
		
		try {			
			/*Projeto projeto = projetoService.buscarProjeto(idProjeto);*/
			List<Long> list = projetoService.quantidadeAnalistas();
			return list;
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
			return new ArrayList<Long>();
		}		
	}
	
	@RequestMapping(method = RequestMethod.GET, value ="rest/tarefasRealizadas/{id}")
	public @ResponseBody Long projetosView(@PathVariable("id") String id) {
		
		Long lista;
		
		try {			
			/*Projeto projeto = projetoService.buscarProjeto(idProjeto);*/
			lista = projetoService.tarefasRealizadas(Integer.parseInt(id));
			System.out.println(lista);
			return lista;
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
			return (long) -1;
		}		
	}
}
