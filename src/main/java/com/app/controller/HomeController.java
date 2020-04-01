package com.app.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(path="/")
public class HomeController extends AbstractGenericController {

	@GetMapping(path = { "/", "/home"})
	public ModelAndView home(HttpSession session) {
		ModelAndView mv = new ModelAndView("home"); 
		return mv;
	}
	@GetMapping(path= {"/error"})
	public ModelAndView error() {
		ModelAndView mv = new ModelAndView("error"); 
		return mv;
	}
	
	
}
