//Source file: C:\\DesignModel\\zgs\\src\\com\\hwadee\\zgs\\service\\Jueceservice.java

package com.hwadee.zgs.service;

import java.util.ArrayList;

import com.hwadee.zgs.dao.Logdao;
import com.hwadee.zgs.pojo.Log;
import com.hwadee.zgs.pojo.Pagination;

public class Logservice 
{
   
   private Logdao dao = new Logdao();
   
   public void add(Log l) {
	   dao.add(l);
   }
   public void del(int id) {
	   dao.del(id);
   }
   public void mod(Log l){
	   dao.mod(l);
   }
   public Log findById(int id){
	   return dao.findById(id);
   }
   public ArrayList<Log> findAllGeneral(Pagination page,int user_id){
	   return dao.findAllGeneral(page,user_id);
   }
}
