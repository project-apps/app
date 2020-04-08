package com.app.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.parser.Base64Parser;
import org.parser.model.AuthUser;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.app.entity.dto.UserDto;

@RestController
@RequestMapping("/login")
public class LoginController extends AbstractGenericController {
	@GetMapping(path = { "/oauth2/{provider}" })
	public String getLoginURL(@PathVariable(required = true) String provider, @RequestBody(required = false) UserDto user) {
		StringBuffer targetUrl = new StringBuffer();
		try { 
			targetUrl.append(getPropValue(SOCIAL_AUTHSERVICE)).append(provider);
		} catch (IOException e) { logger.error(e.getMessage()); }
		return targetUrl.toString();
	}

	@GetMapping(path = {"/callback/{encUser}"})
	public ModelAndView login(@PathVariable String encUser, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		AuthUser user = Base64Parser.deserialize(encUser, AuthUser.class);
		session.setAttribute("user", user);
		logger.trace("Parsed user: "+user);
		mv.addObject("userName", user.getName());
		mv.setViewName("closeSSOLoginWindow");
		return mv;

	}
}
