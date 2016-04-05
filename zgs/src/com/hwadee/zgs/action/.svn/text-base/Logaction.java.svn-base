package com.hwadee.zgs.action;

import com.hwadee.zgs.pojo.Log;
import com.hwadee.zgs.service.Logservice;

public class Logaction {
   public Log log=new Log();
   private Logservice service=new Logservice();
   public String add(){
  	   service.add(log);
  	   return "index";
     }
     public String del() {
  	   service.del(log.getLog_id());
  	   return "index";
     }
     public String mod() {
  	   service.mod(log);
  	   return "index";
     }
     public String findById(){
  	   log=service.findById(log.getLog_id());
  	   return "mod";
     }
}
