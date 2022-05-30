package kopo.poly.service;

import kopo.poly.dto.UserDTO;

public interface IUserService {


    public int loginCheck(UserDTO userDTO) throws Exception;

    public int signUp(UserDTO userDTO) throws Exception;

    /*로그인*/
    public int main(UserDTO userDTO) throws Exception;

    public UserDTO memberChange(UserDTO userDTO) throws Exception;


    public String test() throws Exception;

    // 로그인 처리
    public UserDTO loginProc(UserDTO userDTO) throws Exception;

    // 회원정보 가져오기
    public UserDTO userInfo(UserDTO userDTO) throws Exception;

    // 아이디, 비밀번호 찾기용 회원정보 조회
    public UserDTO findUser(UserDTO userDTO) throws Exception;

    // 비밀번호 신규발급
    public int updateUserPw(UserDTO userDTO) throws Exception;
}