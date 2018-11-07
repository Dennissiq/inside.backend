package br.inside.model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.inside.model.dao.ArquivoDAO;
import br.inside.model.entity.Arquivo;
import br.inside.model.entity.Comentario;
import br.inside.model.entity.Demanda;

@Service
public class ArquivoService {

	@Autowired
	private ArquivoDAO dao;
	
	@Transactional
	public Arquivo persistir(Arquivo arquivo) {
		return dao.persistir(arquivo);
	}
	
	@Transactional
	public void remover(Arquivo arquivo) {
		dao.removerArquivo(arquivo);
	}
	
	public List<Arquivo> listarArquivos(Demanda demanda){
		return dao.listarArquivos(demanda);
	}
}
