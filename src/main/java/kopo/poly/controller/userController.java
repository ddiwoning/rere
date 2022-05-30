package kopo.poly.controller;

import kopo.poly.dto.UserDTO;
import kopo.poly.service.IUserService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
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
        if(!StringUtils.isEmpty(session.getAttribute("userInfo"))){
            try{
                UserDTO userDTO = (UserDTO) session.getAttribute("userInfo");
                if(!StringUtils.isEmpty(userDTO.getUser_id())){
                    return "/index";
                }
            }catch(Exception e){
                return "redirect:/user/login";
            }
        }
        return "redirect:/user/login";
    }

    /**
     * @title : 로그인 페이지 이동
     */
    @GetMapping(value = "/user/login")
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
        int record = userService.loginCheck(userDTO);
        if(record > 0){

            UserDTO userInfo = userService.userInfo(userDTO);
            session.setAttribute("userInfo", userInfo);
        }
        return record;
    }

    /**
     * @param : UserDTO
     * @return : login
     * @title : 로그인
     */
    /*
    @PostMapping(value = "/loginProc")
    public String loginProc(HttpServletRequest request, HttpSession session, Model model) throws Exception {
        UserDTO userDTO = new UserDTO();

        userDTO.setUser_id(CmmUtil.nvl((String) request.getParameter("user_id")));
        userDTO.setUser_pw(CmmUtil.nvl((String) request.getParameter("user_pw")));

        log.info("user_id :: " + userDTO.getUser_id());
        log.info("user_pw :: " + userDTO.getUser_pw());

        log.info("Service : ");
        UserDTO user = new UserDTO();
        user = userService.loginProc(userDTO);
        log.info("Service End : ");

        // 로그인 성공 시

        if (user == null) {
            model.addAttribute("msg", "오류");
            model.addAttribute("url", "/login");
        } else {
            session.setAttribute("userInfo", user.getUser_name());
            model.addAttribute("msg", "성공");
            model.addAttribute("url", "/main");
        }

        return "/red";
    }
    */

    /**
     * @title : 회원가입 페이지
     */
    @RequestMapping(value = "/user/join")
    public String userReg() throws Exception {
        return "/user/join";
    }


    /**
     * @title : 회원가입
     */
    @PostMapping(value = "/signUp")
    @ResponseBody // ajax사용하기 위한 어노테이션
    public int signUp(UserDTO userDTO, Model model) throws Exception {
        return userService.signUp(userDTO);
    }

    //비밀번호 변경
    @RequestMapping(value = "/updatePw")
    public String userUpdate() throws Exception {
        return "/user/updatePw";
    }


    //회원 정보 수정
    @RequestMapping(value = "/memberChange")
    public String memberChange(UserDTO userDTO) throws Exception {

        return "/user/memberChange";
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

    /**
     * @title : 주소찾기 페이지
     */
    @RequestMapping(value = "/user/search/addr")
    public String userSearchAddr() throws Exception {
        return "/user/addr";
    }

    /**
     * 아이디찾기 페이지
     */
    @RequestMapping(value = "/find/id")
    public String findId() throws Exception {
        return "/user/findId";
    }

    /**
     * 아이디찾기 API
     */
    @PostMapping(value = "/api/find/id")
    @ResponseBody // ajax사용하기 위한 어노테이션
    public UserDTO apiFindId(UserDTO userDTO, Model model) throws Exception {
        return userService.findUser(userDTO);
    }

    /**
     * 비밀번호찾기 페이지
     */
    @RequestMapping(value = "/find/pw")
    public String findPw() throws Exception {
        return "/user/findPw";
    }

    /**
     * 비밀번호찾기 API
     */
    @PostMapping(value = "/api/find/pw")
    @ResponseBody // ajax사용하기 위한 어노테이션
    public int apiFindPw(UserDTO userDTO, Model model) throws Exception {
        int record = userService.updateUserPw(userDTO);
        return record;
    }

}