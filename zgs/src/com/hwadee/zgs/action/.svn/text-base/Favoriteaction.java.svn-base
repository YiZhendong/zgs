package com.hwadee.zgs.action;

import com.hwadee.zgs.pojo.Favorite;
import com.hwadee.zgs.service.Favoriteservice;

public class Favoriteaction {
    public Favorite favorite=new Favorite();
    private Favoriteservice service=new Favoriteservice();
    public String add(){
   	   service.add(favorite);
   	   return "index";
      }
    public String add1(){
    	   service.add(favorite);
    	   return "mod";
       }
      public String del() {
   	   service.del(favorite.getFavorite_id());
   	   return "index";
      }
      public String mod() {
   	   service.mod(favorite);
   	   return "index";
      }
      public String query(){
   	   favorite=service.query(favorite.getUser_id());
   	   return "update";
      }
}
