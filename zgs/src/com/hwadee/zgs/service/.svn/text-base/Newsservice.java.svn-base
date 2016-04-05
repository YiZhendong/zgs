//Source file: C:\\DesignModel\\zgs\\src\\com\\hwadee\\zgs\\service\\Jueceservice.java

package com.hwadee.zgs.service;

import java.util.ArrayList;

import com.hwadee.zgs.dao.Newsdao;
import com.hwadee.zgs.pojo.News;
import com.hwadee.zgs.pojo.Pagination;

public class Newsservice 
{
   
   private Newsdao dao = new Newsdao();
   
   public void add(News n){
	   dao.add(n);
   }
   public void del(int id) {
	   dao.del(id);
   }
   public void mod(News n) {
	   dao.mod(n);
   }
   public ArrayList<News> findAllGeneral(Pagination page){
	   return dao.findAllGeneral(page);
   }
   public ArrayList<News> findSpecial(Pagination page){
	   return dao.findSpecial(page);
   }
   public News findById(int id){
	   return dao.findById(id);
   }
   public News findByTitle(String title){
	   return dao.findByTitle(title);
   }
}
