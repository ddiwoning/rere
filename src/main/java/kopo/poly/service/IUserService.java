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
}