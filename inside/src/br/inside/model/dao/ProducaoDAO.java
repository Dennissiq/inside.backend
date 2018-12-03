package br.inside.model.dao;

import java.sql.Time;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.inside.model.entity.Demanda;
import br.inside.model.entity.Funcionario;
import br.inside.model.entity.Producao;
import br.inside.model.entity.Projeto;

@Repository
public class ProducaoDAO {
	
	static final int HOUR = 1;
	
	@PersistenceContext
	EntityManager manager;
	
	public Producao criar(Producao producao) {
		manager.persist(producao);
		return producao;
	}
	
	public Producao atualizar(Producao producao) {
		return manager.merge(producao);
	}
	
	public Producao buscarProducao(int id) {
		return manager.find(Producao.class, id);
	}
	
	public Producao buscarProducao(Demanda demanda) {
		String jpql = "select p from tb_producao p where p.demanda = :demanda";
		
		Query query = manager.createQuery(jpql);
		query.setParameter("demanda", demanda);

		List<Producao> result = query.getResultList();
		return result.get(result.size()-1);
	}
	
	@SuppressWarnings("unchecked")
	public List<Producao> listarProducoes(){
		return manager.createQuery("select p from tb_producao p").getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Producao> listarProducoes(String chave){
		String jpql = "select p from tb_producao p where p.nome like :chave";
		
		Query query = manager.createQuery(jpql);
		query.setParameter("chave", "%"+chave+"%");

		List<Producao> result = query.getResultList();
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<Producao> listarProducoes(Projeto projeto){
		String jpql = "select d from tb_producao d where d.projeto = :projeto";
		
		Query query = manager.createQuery(jpql);
		query.setParameter("projeto", projeto);

		List<Producao> result = query.getResultList();
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<Producao> listarProducoesPorAnalista(Funcionario f){
		String jpql = "select d from tb_producao d where d.funcionario = :funcionario";
		
		Query query = manager.createQuery(jpql);
		query.setParameter("funcionario", f);

		List<Producao> result = query.getResultList();
		
		System.out.println(result.toString());
		return result;
	}
	
	public static long getDateDiff(Date date1, Date date2, TimeUnit timeUnit) {
	    long diffInMillies = date2.getTime() - date1.getTime();
	    return timeUnit.convert(diffInMillies,TimeUnit.MILLISECONDS);
	}
	
	@SuppressWarnings("deprecation")
	public Time calcularDuracao(Demanda demanda) {
		String jpql = "select p from tb_producao p where p.demanda = :demanda";
		
		Query query = manager.createQuery(jpql);
		query.setParameter("demanda", demanda);
		
		@SuppressWarnings("unchecked")
		List<Producao> producoes = query.getResultList();
				
		Time time = new Time(0);
		DateFormat df = new SimpleDateFormat("HH:mm:ss");
		
		System.out.println(producoes.size());
		
		for (Producao producao : producoes) {
			long diffTime = producao.getHoraFim().getTime() - producao.getHoraInicio().getTime();		
			long sum = time.getTime() + diffTime;
				
			long totalSecs = sum/1000;
	        int hours = (int)(totalSecs / 3600);
	        int minutes = (int)(totalSecs / 60) % 60;
	        int seconds = (int)totalSecs % 60;				       
	        	
	        System.out.println("hours: " + (totalSecs / 3600));
	        
	        if((totalSecs / 3600) >= 0) {   
	        	time.setHours(hours);
	        }else{
	        	time.setHours(HOUR);
	        }
	        
	        System.out.println("time.hours: " + time.getHours());
	        
			time.setMinutes(minutes);
			time.setSeconds(seconds);
			
			String _time = df.format(time);
			
			System.out.println(_time);
		}
		
		return time;
	}
}