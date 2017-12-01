package main.controller;



import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalDefaultExceptionHandler {
	/* @InitBinder
	 public void initBinder(WebDataBinder binder) {
	     System.out.println("controller advice: init binder");
	 }*/
	
	@ExceptionHandler({NoHandlerFoundException.class})
	public String httpError404(HttpServletRequest req, Exception e) throws Exception{
		Date date = new Date();
		if(AnnotationUtils.findAnnotation(e.getClass(), ResponseStatus.class)!=null){
			throw e;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");            
		String fileName = "C:\\teatime_exception_log\\exception_log_"+sdf.format(date)+".txt";
		File file = new File("C:\\teatime_exception_log");
		if(!file.exists()){			
			file.mkdir();			
		}
		try{            
            // BufferedWriter 와 FileWriter를 조합하여 사용 (속도 향상)
            BufferedWriter fw = new BufferedWriter(new FileWriter(fileName, true));            
            sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시mm분ss초");            
            // 파일안에 문자열 쓰기            
            fw.write(e+":"+req.getRequestURI()+":"+sdf.format(date)+"\r\n");
            fw.flush(); 
            // 객체 닫기
            fw.close();             
        }catch(Exception exc){
            exc.printStackTrace();
        }
		return "main/error";
	}
	@ExceptionHandler({Exception.class})
	public ModelAndView defaultErrorHandler(HttpServletRequest req, Exception e) throws Exception{
		ModelAndView mav = new ModelAndView();
		if(AnnotationUtils.findAnnotation(e.getClass(), ResponseStatus.class)!=null){
			throw e;
		}
		mav.addObject("exception",e);
		mav.addObject("url",req.getRequestURL());
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");            
		String fileName = "C:\\teatime_exception_log\\exception_log_"+sdf.format(date)+".txt";
		try{            
            // BufferedWriter 와 FileWriter를 조합하여 사용 (속도 향상)
            BufferedWriter fw = new BufferedWriter(new FileWriter(fileName, true));
            date = new Date();
            sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시mm분ss초");            
            // 파일안에 문자열 쓰기
            fw.write(e+":"+req.getRequestURI()+":"+sdf.format(date)+"\r\n");
            fw.flush(); 
            // 객체 닫기
            fw.close();             
        }catch(Exception exc){
            exc.printStackTrace();
        }		
		mav.setViewName("main/error");
		
		
		return mav;
	}

}
