package br.inside.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.inside.model.entity.Demanda;
import br.inside.model.entity.Funcionario;
import br.inside.model.service.DemandaService;
import br.inside.model.service.FuncionarioService;

@Controller
public class DemandaController {

	@Autowired
	private DemandaService demandaService;
	
	@Autowired
	private FuncionarioService funcionarioService;

	@RequestMapping("/demandas")
	public String demandasView(Model model, HttpSession session, String chave) {
		
		List<Demanda> lista;
		
		if (chave != null && chave.length() > 0) {
			lista = demandaService.listarDemandas(chave);
		} else {
			lista = demandaService.listarDemandas();
		}
		
		session.setAttribute("lista", lista);
		return "Demandas";
	}
	
	@RequestMapping("/novaDemanda")
	public String novoDemandaForm(Model model, HttpSession session, int idProjeto) {			
		try {
			List<Funcionario> analistas = funcionarioService.listarFuncionarios();
			session.setAttribute("idProjeto", idProjeto);
			session.setAttribute("analistas", analistas);
			return "CadastroDemanda";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "CadastroDemanda";
		}		
	}
	
	@RequestMapping("/addDemanda")
	public String addDemanda(@Valid Demanda demanda, Model model, HttpSession session) {		
		try {
			Funcionario func = new Funcionario();
			func.setIdFuncionario(1);
			demanda.setFuncionario(func);
			demanda = demandaService.criar(demanda);
			model.addAttribute("projeto", demanda);
			
			return "redirect: projetos";
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		return "CadastroDemanda";
	}
	
	@RequestMapping("/atualizarDemanda")
	public String atualizarProjeto(@Valid Demanda demanda, Model model, HttpSession session) {
		demanda = demandaService.atualizar(demanda);
		model.addAttribute("demanda", demanda);
		
		return "DetalheDemanda";
	}
	
	@RequestMapping("/detalheDemanda")
	public String detalheDemanda(@Valid Demanda demanda, Model model) {
		demanda = demandaService.buscarDemanda(demanda.getId());
		model.addAttribute("filme", demanda);
		return "DetalheDemanda";
	}
}