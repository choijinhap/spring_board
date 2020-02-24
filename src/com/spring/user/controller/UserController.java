package com.spring.user.controller;

import java.io.IOException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.swing.text.View;

import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComcodeVo;
import com.spring.board.vo.PageVo;
import com.spring.common.CommonUtil;
import com.spring.user.service.UserService;
import com.spring.user.vo.UserVo;
import com.spring.common.CommonUtil;
@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	@Autowired
	boardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/user/userJoin.do", method = RequestMethod.GET)
	public String userJoin(Locale locale, Model model) throws Exception{
		
		List<ComcodeVo> comcodeList = new ArrayList<ComcodeVo>();
		String boardType="phone";
		comcodeList = boardService.selectComcodeList(boardType);
		model.addAttribute("comcodeList", comcodeList);
		
		return "/user/userJoin";
	}
	
	@RequestMapping(value = "/user/userJoinAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String userJoinAction(Locale locale, UserVo userVo) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = userService.userInsert(userVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/user/userIdCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String userIdCheck(Locale locale, UserVo userVo) throws Exception{
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		String userId=userVo.getUserId();
		
		int resultCnt = userService.userIdCheck(userId);
		
		result.put("duplicated", (resultCnt > 0)?"0":"1");
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/user/userPwCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String userPwCheck(Locale locale, UserVo userVo) throws Exception{
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = userService.userPwCheck(userVo);
		
		result.put("success", (resultCnt > 0)?"1":"0");
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/user/userLogin.do", method = RequestMethod.GET)
	public String userLogin(Locale locale, Model model) throws Exception{
		
		return "/user/userLogin";
	}
	
	@RequestMapping(value="/user/loginCheck.do" ,method = RequestMethod.POST)
	public String loginCheck(UserVo userVo,HttpSession session,Model model)throws Exception {
		boolean result=userService.loginCheck(userVo,session);
		if(result==true) {
			model.addAttribute("msg","success");
			return "redirect:/board/boardList.do";
		}else {
			model.addAttribute("msg","failure");
			return "user/userLogin";
		}
	}
	
	@RequestMapping(value="/user/logout.do")
	public String logout(HttpSession session,Model model) throws Exception {
		userService.logout(session);
		model.addAttribute("msg","logout");
		return "redirect:/board/boardList.do";
	}
	
	
}
