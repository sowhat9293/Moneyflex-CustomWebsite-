package com.sowhat.moneyflex;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sowhat.moneyflex.model.Member;
import com.sowhat.moneyflex.model.Month;
import com.sowhat.moneyflex.model.News;
import com.sowhat.moneyflex.service.IdExistCheckService;
import com.sowhat.moneyflex.service.ListNewsService;
import com.sowhat.moneyflex.service.MemberService;
import com.sowhat.moneyflex.service.MonthService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	

	 @Autowired
	 protected ListNewsService newsService;
	 @Autowired
	 protected MonthService monthService;
	 
	 @Autowired
	 protected IdExistCheckService idExistCheckService;
	 @Autowired
	 protected MemberService memberService;
	 
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Map modelMap, HttpServletRequest req, HttpServletResponse res) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
	
	@RequestMapping(value = "/calender.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<List<String>> calender(Month month)
	{
		//System.out.println("占싼억옙占� 占쌨뤄옙\n" + "占썩도 : " + month.getYear()+ ", 占쏙옙 : " +month.getMonth());
		List<List<String>> list = monthService.getList(month.getYear(), month.getMonth());
		return list;
	}
	
	@RequestMapping(value = "/news.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<List<String>> news(News news)
	{
		//System.out.println("占싼억옙占� 占썰구 占쏙옙占쏙옙占쏙옙 占쏙옙호 : " +news.getPnum());
		List<List<String>> list = newsService.getList(news.getPnum());
		return list;
	}
		
	@RequestMapping(value = "/newsload.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public News news()
	{
		return newsService.getTotalNum();
	}
	
	@RequestMapping(value = "/join_01.do", method = RequestMethod.GET, produces="application/json;charset=UTF-8")
	public String join01()
	{
		return "join_01";
	}
	
	@RequestMapping(value = "/join_02.do", method = RequestMethod.GET, produces="application/json;charset=UTF-8")
	public String join02()
	{
		return "join_02";
	}
	
	@RequestMapping(value = "/join_03.do", method = RequestMethod.GET, produces="application/json;charset=UTF-8")
	public String join03()
	{
		return "join_03";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET, produces="application/json;charset=UTF-8")
	public String login()
	{
		return "login";
	}
	
	@RequestMapping(value = "/checkID.do", method = RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public Boolean checkID(HttpServletRequest req)
	{
		String id = req.getParameter("id");
		return idExistCheckService.isExistId(id);
	}
	
	@RequestMapping(value = "/checkLogin.do", method = RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public Boolean checkLogin(HttpServletRequest req)
	{
		String id = req.getParameter("id");
		String pwd = req.getParameter("password");
		System.out.println(id + "\n"+pwd);
		return memberService.checkIdPwd(id, pwd);
	}
	
	@RequestMapping(value = "/send_new_member_data.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public void newMember(Member member)
	{
		System.out.println(member.getName());
		System.out.println(member.getId());
		System.out.println(member.getPwd());
		System.out.println(member.getbDay());
		System.out.println(member.getGender());
		System.out.println(member.getEmail());
		System.out.println(member.getAddress());
		System.out.println(member.getNum());
		System.out.println(member.getpNum());
		System.out.println(member.getQust_01());
		System.out.println(member.getQust_02());
		System.out.println(member.getQust_03());
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		member.setPwd(passwordEncoder.encode(member.getPwd()));
		memberService.putNewMember(member);
	}
	
	
}
