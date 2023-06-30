package kr.co.tjoeun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
   
   @RequestMapping(value="/", method=RequestMethod.GET)
   public String Home() {
      System.out.println("야임마");
      //return "/WEB-INF/views/index.jsp";
      return "index";
      
      /*
       /WEB-INF/views/index.jsp 에서
       /WEB-INF/views/ 이부분을 prefix로 설정하고
        .jsp 이 부분을 suffix로 설정해서
        return "index"라고만 coding 해도 전체 경로를 인식 하게 함
        ㄴ servlet-context.xml 파일에서 설정함
       */
   }
   
   @RequestMapping(value="/tjoeun", method=RequestMethod.GET)
   public String tjoeun() {
      System.out.println("tjoeun");
      return null;
   }
   
   @RequestMapping(value="/spring", method=RequestMethod.GET)
   public String pring() {
      System.out.println("spring");
      return null;
   }
   
}
