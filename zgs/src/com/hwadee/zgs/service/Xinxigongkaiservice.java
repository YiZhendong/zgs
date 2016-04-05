//Source file: C:\\DesignModel\\zgs\\src\\com\\hwadee\\zgs\\service\\Xinxigongkaiservice.java

package com.hwadee.zgs.service;

import java.util.ArrayList;

import com.hwadee.zgs.dao.Xinxigongkaidao;
import com.hwadee.zgs.pojo.Pagination;
import com.hwadee.zgs.pojo.Project;
public class Xinxigongkaiservice 
{
   private Xinxigongkaidao dao = new Xinxigongkaidao();
   public Project findById(int id){
	   return dao.findById(id);
   }
   public void modById(int id){
	   dao.modById(id);
   }
   public ArrayList<Project> findAll(Pagination page){
	   return dao.findAll(page);
	   
   }
   public ArrayList<Project> findAllGeneral(Pagination page){
	   return dao.findAllGeneral(page);
   }
   public ArrayList<Project> findAllGeneral1(Pagination page){
	   return dao.findAllGeneral(page);
   }
   public int findSum(Project p){
	   return dao.findSum(p);
   }
   public ArrayList<Project> findAllGeneral(Pagination page,Project p){
	   return dao.findAllGeneral(page,p);
   }

   public ArrayList<Project> findAllGeneral(Pagination page,int id){
	   return dao.findAllGeneral1(page,id);
   }
   public ArrayList<Project> findAllGeneral2(Pagination page){
	   return dao.findAllGeneral2(page);
   }

   public ArrayList<Project> findBySome(Pagination pagination,String level,String money,String state){
	   return dao.findBySome(pagination,level, money, state);
   }

}
