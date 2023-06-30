package kr.co.tjoeun.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {
  
  @ExceptionHandler(NullPointerException.class)
  public String nullPointerException() {
	return "globale_null_pointer_exception";
  }
}
