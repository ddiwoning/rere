package kopo.poly.persistance.mapper;

import kopo.poly.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IUserMapper {

    // 회원정보 등록
    int insertUserInfo(UserDTO userDTO) throws Exception;

    // 로그인
    int getUserLoginCheck(UserDTO userDTO) throws Exception;

    // 로그인 체크
    int loginCheck(UserDTO userDTO) throws Exception;

    //회원정보 조회
    UserDTO memberChange(UserDTO userDTO) throws Exception;

    //test
    String test() throws Exception;

    // 로그인
    UserDTO loginProc(UserDTO userDTO) throws Exception;

    // 회원정보 조회
    UserDTO userInfo(UserDTO userDTO) throws Exception;

    // 아이디, 비밀번호 찾기용 회원정보 조회
    UserDTO findUser(UserDTO userDTO) throws Exception;

    // 비밀번호 신규발급
    int updateUserPw(UserDTO userDTO) throws Exception;

}