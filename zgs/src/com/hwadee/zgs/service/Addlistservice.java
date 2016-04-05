//Source file: C:\\DesignModel\\zgs\\src\\com\\hwadee\\zgs\\service\\Jueceservice.java

package com.hwadee.zgs.service;

import java.util.ArrayList;

import com.hwadee.zgs.dao.Addlistdao;
import com.hwadee.zgs.pojo.Addlist;
import com.hwadee.zgs.pojo.Pagination;

public class Addlistservice 
{
   
   private Addlistdao dao = new Addlistdao();
   
   public void add(Addlist a){
	   dao.add(a);
   }
   public void del(int id){
	   dao.del(id);
   }
   public void mod(Addlist a) {
	   dao.mod(a);
   }
   public Addlist findByName(String userName){
	   return dao.findByName(userName);
   }
   public ArrayList<Addlist> findAll(Pagination page,int user_list_id){
	   return dao.findAll(page, user_list_id);
   }
}
