package br.inside.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sun.jmx.snmp.Timestamp;

import br.inside.model.entity.Arquivo;
import br.inside.model.entity.Comentario;
import br.inside.model.entity.Demanda;
import br.inside.model.entity.Funcionario;
import br.inside.model.entity.User;
import br.inside.model.service.ComentarioService;
import br.inside.model.service.DemandaService;
import br.inside.model.service.FuncionarioService;
import br.inside.model.service.ProducaoService;
import br.inside.model.service.RecursoService;

@Controller
public class DemandaController {

	@Autowired
	private DemandaService demandaService;
	
	@Autowired
	private FuncionarioService funcionarioService;
	
	@Autowired 
	private ComentarioService comentarioService;
	
	@Autowired 
	private RecursoService recursoService;

	@Autowired
	private ProducaoService producaoService;
	
	@RequestMapping("/demandas")
	public String demandasView(Model model, HttpSession session, String chave) throws IOException {
		
		List<Demanda> lista;
		
		if (chave != null && chave.length() > 0) {
			lista = demandaService.listarDemandas(chave);
		} else {
			User u = (User) session.getAttribute("usuario");
			Funcionario f = funcionarioService.buscarFuncionario(u);
			lista = demandaService.listarDemandasPorAnalista(f);
		}
		
		session.setAttribute("lista", lista);
		return "Demandas";
	}
	
	@RequestMapping("/novaDemanda")
	public String novoDemandaForm(Model model, HttpSession session, int idProjeto) {			
		try {
			List<Funcionario> analistas = funcionarioService.listarFuncionarios();
			session.setAttribute("idProjeto", idProjeto);
			System.out.println(analistas.toString());
			model.addAttribute("analistas", analistas);
			return "CadastroDemanda";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "CadastroDemanda";
		}		
	}
	
	@RequestMapping("/addDemanda")
	public String addDemanda(@Valid Demanda demanda, Model model, HttpSession session) {		
		System.out.println(demanda.toString());
		try {			
			
			Funcionario funcionario = new Funcionario();
			funcionario.setIdFuncionario(demanda.getFuncionario().getIdFuncionario());
			funcionario = funcionarioService.buscarFuncionario(funcionario.getIdFuncionario());
			demanda.setFuncionario(funcionario);
			
			demanda = demandaService.criar(demanda);
			model.addAttribute("projeto", demanda);
			
			return "redirect: projetos";
		} catch (Exception e) {
			e.printStackTrace();
			return "CadastroDemanda";
		}	
	}
	
	@RequestMapping("/atualizarDemanda")
	public String atualizarProjeto(@Valid Demanda demanda, Model model, HttpSession session) {
		demanda = demandaService.atualizar(demanda);
		model.addAttribute("demanda", demanda);
		
		return "DetalheDemanda";
	}
	
	@RequestMapping("/iniciarTarefa")
	public String atualizarProjeto(Model model, HttpSession session, int idDemanda) {
		Demanda demanda = demandaService.iniciarTarefa(idDemanda,producaoService);
		model.addAttribute("demanda", demanda);
		
		return "redirect: detalheDemanda?idDemanda=" + idDemanda;
		//return "DetalheDemanda";
	}
	
	@RequestMapping("/pausarTarefa")
	public String pausarTarefa(Model model, HttpSession session, int idDemanda) {
		Demanda demanda = demandaService.pausarTarefa(idDemanda, producaoService);
		model.addAttribute("demanda", demanda);
		
		return "redirect: detalheDemanda?idDemanda=" + idDemanda;
		//return "DetalheDemanda";
	}
	
	@RequestMapping("/finalizarTarefa")
	public String finalizarTarefa(Model model, HttpSession session, int idDemanda) {
		Demanda demanda = demandaService.finalizarTarefa(idDemanda, producaoService);
		model.addAttribute("demanda", demanda);
		
		return "redirect: detalheDemanda?idDemanda=" + idDemanda;
		//return "DetalheDemanda";
	}
	
	@RequestMapping("/detalheDemanda")
	public String detalheDemanda(Model model, HttpSession session, int idDemanda) {
		Demanda demanda = demandaService.buscarDemanda(idDemanda);		
		model.addAttribute("demanda", demanda);

		System.out.println(demanda.toString());
		return "DetalheDemanda";
	}
	
	
	@RequestMapping("/addComentario")
	public String addComentario(@Valid Comentario comentario, Model model, HttpSession session) {
		
		User usuario = (User) session.getAttribute("usuario");
		int idDemanda = comentario.getRecurso().getDemanda().getId();
		Date date = new Date();		
		comentario.setDtComentario(date);
		
		Demanda demanda = demandaService.buscarDemanda(idDemanda);

		comentario = recursoService.criarRecurso(demanda, usuario, comentario);
		
		demanda = demandaService.buscarDemanda(idDemanda);
		model.addAttribute("demanda", demanda);
		System.out.println(demanda.toString());
		return "DetalheDemanda";
	}
	
	@RequestMapping("/upload")
	public String upload(HttpServletRequest request, Model model, HttpSession session, String idDemanda) {
		try {
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile multipartFile = multipartRequest.getFile("file");
			
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			
			System.out.println(Arrays.toString(multipartFile.getOriginalFilename().split(".")));
			System.out.println( multipartFile.getOriginalFilename());
			//String fileName = timestamp.hashCode() + "." + multipartFile.getOriginalFilename();
			String fileName = multipartFile.getOriginalFilename();
			Arquivo arquivo = new Arquivo();
			
			String filePath = "C:/inside";
			File fileToSave = new File(filePath+"/"+fileName);
			
			File file = new File("C:\\inside");

	        if (!file.exists()) {
	            if (file.mkdir()) {
	            	System.out.println("Directory created!");
	            } else {
	                System.out.println("Failed to create directory!");
	            }
	        }
	        
	        arquivo.setDiretorio("C:\\inside\\" + fileName);
			multipartFile.transferTo(fileToSave);
			
			User usuario = (User) session.getAttribute("usuario");
			
			Demanda demanda = demandaService.buscarDemanda(Integer.parseInt(idDemanda));
			
			arquivo = recursoService.criarRecurso(demanda, usuario, arquivo);
			
			demanda = demandaService.buscarDemanda(Integer.parseInt(idDemanda));
			model.addAttribute("demanda", demanda);
			
			
			System.out.println(multipartFile.getContentType());
			System.out.println(multipartFile.getName());
			System.out.println(demanda.toString());
			
			System.out.println(multipartFile.getContentType());
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "DetalheDemanda";
	}
	
	@RequestMapping("/cronograma")
	public String Cronograma() {
		
		return "Cronograma";
	}
}