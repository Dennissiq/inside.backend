package br.inside.model.service;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.inside.model.dao.CargoDAO;
import br.inside.model.entity.Cargo;

@Service
public class CargoService {
	
	@Autowired
	private CargoDAO dao;
	
	public Cargo buscarCargo(int id) throws IOException{
		return dao.buscarCargo(id);
	}
	
	@Transactional
	public Cargo inserirCargo(Cargo cargo) throws IOException{
		int id = dao.inserirCargo(cargo);
		cargo.setId(id);
		return cargo;
	}
	
	@Transactional
	public void removerCargo(Cargo cargo) throws IOException{
		dao.removerCargo(cargo);
	}
	
	@Transactional
	public Cargo atualizarCargo(Cargo cargo) throws IOException{
		dao.atualizarCargo(cargo);
		return cargo;
	}
	
	public List<Cargo> listarCargo() throws IOException{
		return dao.listarCargos();
	}
}
