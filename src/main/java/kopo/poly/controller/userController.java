package kopo.poly.controller;

import kopo.poly.dto.UserDTO;
import kopo.poly.service.IUserService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Slf4j
@Controller
public class userController {

    @Resource(name = "UserService")
    private IUserService userService;

    @GetMapping(value = "/")
    public String start(HttpSession session) {
        session.setAttribute("userInfo", "TEst");
        return "redirect:/login";
    }

    /**
     * @title : 로그인 페이지 이동
     */
    @GetMapping(value = "main/login")
    public String login() {
        return "/user/login";
    }


    /**
     * @param : UserDTO
     * @return : login
     * @title : 로그인 체크
     */
    @PostMapping(value = "/loginCheck")
    @ResponseBody
    public int loginCheck(UserDTO userDTO, HttpSession session) throws Exception {

        log.info("userId :: " + userDTO.getUserId());
        log.info("userPw :: " + userDTO.getUserPw());
        session.setAttribute("userInfo", "test");

        return userService.loginCheck(userDTO);
    }

    /**
     * @param : UserDTO
     * @return : login
     * @title : 로그인
     */
    @PostMapping(value = "/loginProc")
    public String loginProc(HttpServletRequest request, HttpSession session, Model model) throws Exception {
        UserDTO userDTO = new UserDTO();

        userDTO.setUserId(CmmUtil.nvl((String) request.getParameter("userId")));
        userDTO.setUserPw(CmmUtil.nvl((String) request.getParameter("userPw")));

        log.info("userId :: " + userDTO.getUserId());
        log.info("userPw :: " + userDTO.getUserPw());

//        log.debug("############################################################");
//        log.debug("loginCheck >> " + userService.loginCheck(userDTO));
//        log.debug("loginProc >> " + userService.loginProc(userDTO));
//        log.debug("############################################################");
        log.info("Service : ");
        UserDTO user = new UserDTO();
        user = userService.loginProc(userDTO);
        log.info("Service End : ");

        // 로그인 성공 시

        if (user == null) {
            model.addAttribute("msg", "오류");
            model.addAttribute("url", "/login");
        } else {
            session.setAttribute("userInfo", user.getUserName());
            model.addAttribute("msg", "성공");
            model.addAttribute("url", "/main");
        }

        return "/red";
    }

    /**
     * @param : UserDTO
     * @return :
     * @title : 회원가입 페이지
     */
    @RequestMapping(value = "/userReg")
    public String userReg() throws Exception {
        return "user/reg";
    }


    /**
     * @param : UserDTO
     * @return :
     * @title : 회원가입
     */
    @PostMapping(value = "/signUp")
    @ResponseBody // ajax사용하기 위한 어노테이션
    public int signUp(UserDTO userDTO, Model model) throws Exception {
        log.info("userId :: " + userDTO.getUserId());
        log.info("userPw :: " + userDTO.getUserPw());

        return userService.signUp(userDTO);
    }

    //비밀번호 변경
    @RequestMapping(value = "/updatePw")
    public String userUpdate() throws Exception {
        return "/user/updatePw";
    }


    //회원 정보 수정
    @RequestMapping(value = "/memberModify")
    public String memberModify(UserDTO userDTO) throws Exception {

        return "/user/memberModify";
    }

    /*@RequestMapping(value = "/mypage")
    public String mypage(Model model, UserDTO userDTO, HttpServletRequest request) throws Exception {
        String userId = request.getSession().getAttributeNames("userInfo").userId;
        userDTO.setUserId(userId);
        UserDTO userInfo = userService.userInfo(userDTO);
        model.addAttribute("userInfo", userInfo);
        return "/user/mypage";
    }*/

   /* @RequestMapping(value = "/userInfo")
    public String userInfo(Model model, UserDTO userDTO) throws Exception {
        return "user/mypage";
        *//*userService.memberModify(userDTO);*//*
        log.debug("### userService.memberModify Controller : {}", userDTO.getUserEmail());
        model.addAttribute(userDTO);
        return "user/mypage";
    }*/

}