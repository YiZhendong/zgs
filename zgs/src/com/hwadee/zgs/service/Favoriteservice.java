//Source file: C:\\DesignModel\\zgs\\src\\com\\hwadee\\zgs\\service\\Jueceservice.java

package com.hwadee.zgs.service;

import java.util.ArrayList;

import com.hwadee.zgs.dao.Favoritedao;
import com.hwadee.zgs.pojo.Favorite;
import com.hwadee.zgs.pojo.Project;
import com.hwadee.zgs.pojo.Pagination;

public class Favoriteservice 
{
   
   private Favoritedao dao = new Favoritedao();
   
   public void add(Favorite f){
	   dao.add(f);
   }
   public void add1(Favorite f){
	   dao.add(f);
   }
   public void del(int id) {
	   dao.del(id);
   }
   public void mod(Favorite n){
	   dao.mod(n);
   }
   public Favorite query(int user_id){
	   return dao.query(user_id);
   }
   public ArrayList<Project> findAll(Pagination page,int user_id){
	   return dao.findAll(page,user_id);
   }
}
