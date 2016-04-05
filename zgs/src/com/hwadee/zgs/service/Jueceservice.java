//Source file: C:\\DesignModel\\zgs\\src\\com\\hwadee\\zgs\\service\\Jueceservice.java

package com.hwadee.zgs.service;

import java.util.ArrayList;

import com.hwadee.zgs.dao.Juecedao;
import com.hwadee.zgs.pojo.Pagination;
import com.hwadee.zgs.pojo.Project;


public class Jueceservice 
{
   
   private Juecedao dao = new Juecedao();
   
   public void juece(Project p) 
   {
	   dao.juece(p);
   }
   public Project findById(int id){
	   return dao.findById(id);
   }
   public ArrayList<Project> findAllGeneral(Pagination page){
	   return dao.findAllGeneral(page);
   }
}
