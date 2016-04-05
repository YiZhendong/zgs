package com.hwadee.zgs.action;

import com.hwadee.zgs.pojo.Addlist;
import com.hwadee.zgs.service.Addlistservice;

public class Addlistaction {
    public Addlist addlist=new Addlist();
    private Addlistservice service=new Addlistservice();
    
    public String add(){
 	   service.add(addlist);
 	   return "index";
    }
      public String del() {
   	   service.del(addlist.getAddlist_id());
   	   return "index";
      }
    
      public String mod() {
   	   service.mod(addlist);
   	   return "index";
      }
      public String findByName(){
   	   addlist=service.findByName(addlist.getUserName());
   	   return "update";
      }
}
