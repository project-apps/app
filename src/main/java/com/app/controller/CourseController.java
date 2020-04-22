package com.app.controller;

import java.io.IOException;
import java.net.URI;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

@RestController
@RequestMapping(path = {"/course"})
public class CourseController extends RestTemplateURIExchange{
	@RequestMapping("/{courseName}")
	public ModelAndView home(@PathVariable(required = true) String courseName) {
		ModelAndView mv = new  ModelAndView("course.page");
		try {
			URI targetUri= UriComponentsBuilder.fromUriString(getPropValue(API_GATEWAY_HOST))
					.path("cms/file")
					.queryParam("path", courseName+"/home.html").build().toUri();
			String courseContent = exchange(targetUri);
			mv.addObject(courseContent);
			mv.addObject("courseContent", courseContent);
			URI menuUri= UriComponentsBuilder.fromUriString(getPropValue(API_GATEWAY_HOST))
					.path("cms/index").queryParam("path", courseName).build().toUri();
			mv.addObject("menu", courseName);
			mv.addObject("menuUri", menuUri);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;		
	}
	@RequestMapping("/{courseName}/{page}")
	public ModelAndView coursePage(@PathVariable(required = true) String courseName, @PathVariable String page) {
		ModelAndView mv = new ModelAndView("course.page");
		try {
			URI targetUri= UriComponentsBuilder.fromUriString(getPropValue(API_GATEWAY_HOST))
					.path("cms/file").queryParam("path", courseName+"/"+page.replaceAll("-", "/").concat(".html")).build().toUri();
			logger.debug("Getting page feom url: "+targetUri);;
			String courseContent = exchange(targetUri);
			mv.addObject(courseContent);
			mv.addObject("courseContent", courseContent);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mv;
	}
}
