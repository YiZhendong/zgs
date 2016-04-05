package com.hwadee.zgs.service;

import com.hwadee.zgs.pojo.User;
import com.hwadee.zgs.dao.Zhucedao;
public class Zhuceservice {
   private Zhucedao dao=new Zhucedao();
   public void add(User u){
        dao.add(u);
   }
}
