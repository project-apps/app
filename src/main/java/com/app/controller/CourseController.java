package com.app.controller;

import java.io.IOException;
import java.net.URI;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestClientException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

@RestController
@RequestMapping(path = {"/course"})
public class CourseController extends RestTemplateURIExchange{
	@RequestMapping("/{course}")
	public ModelAndView home(@PathVariable(required = true) String course, HttpServletRequest request) {
		ModelAndView mv = new  ModelAndView("course.page");
		try {
			URI targetUri= UriComponentsBuilder.fromUriString(getPropValue(API_GATEWAY_HOST))
					.path("cms/file")
					.queryParam("path", course+"/home.html").build().toUri();
			String courseContent = exchange(targetUri);
			mv.addObject("courseContent", courseContent);
			request.setAttribute("course", course);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;		
	}
	@RequestMapping(path = {"/index/{course}"},produces = {MediaType.APPLICATION_JSON_VALUE} )
	public String index(@PathVariable String course) {
		String indexes= new String();
		try {
			URI targetUri = UriComponentsBuilder.fromUriString(getPropValue(API_GATEWAY_HOST))
					.path("cms/index").queryParam("path", course).build().toUri();
			indexes = exchange(targetUri);
		} catch (IOException | RestClientException e) {
			e.printStackTrace();
		}
		return indexes;
	}
	@RequestMapping("/{course}/{page}")
	public ModelAndView coursePage(@PathVariable(required = true) String course, @PathVariable String page, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("course.page");
		try {
			URI targetUri= UriComponentsBuilder.fromUriString(getPropValue(API_GATEWAY_HOST))
					.path("cms/file").queryParam("path", course+"/"+page.replaceAll("-", "/").concat(".html")).build().toUri();
			String courseContent = exchange(targetUri);
			mv.addObject(courseContent);
			mv.addObject("courseContent", courseContent);
			request.setAttribute("course", course);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mv;
	}
}
