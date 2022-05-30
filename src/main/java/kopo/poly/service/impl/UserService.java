package kopo.poly.service.impl;

import kopo.poly.dto.UserDTO;
import kopo.poly.persistance.mapper.IUserMapper;
import kopo.poly.service.IUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Random;

@Slf4j
@Service("UserService")
public class UserService implements IUserService {

    private final IUserMapper userMapper;

    @Autowired
    public UserService(IUserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public int loginCheck(UserDTO userDTO) throws Exception {
        return userMapper.loginCheck(userDTO);
    }

    @Override
    public int signUp(UserDTO userDTO) throws Exception {
        return userMapper.insertUserInfo(userDTO);
    }

    @Override
    public int main(UserDTO userDTO) throws Exception {
        return userMapper.getUserLoginCheck(userDTO);
    }

    @Override
    public UserDTO memberChange(UserDTO userDTO) throws Exception {
        return userMapper.memberChange(userDTO);
    }

    @Override
    public UserDTO loginProc(UserDTO userDTO) throws Exception {
        return userMapper.loginProc(userDTO);
    }

    @Override
    public UserDTO userInfo(UserDTO userDTO) throws Exception {
        return userMapper.userInfo(userDTO);
    }

    @Override
    public UserDTO findUser(UserDTO userDTO) throws Exception {
        return userMapper.findUser(userDTO);
    }

    @Override
    public int updateUserPw(UserDTO userDTO) throws Exception {

        UserDTO findUser = this.findUser(userDTO);
        if(!StringUtils.isEmpty(findUser)){
            /*신규비밀번호로 데이터 수정*/

            UserDTO chgUserPw = new UserDTO();
            chgUserPw.setUser_seq(findUser.getUser_seq());

            String newPw = this.makeAuthRandNumber();
            chgUserPw.setUser_pw(newPw);

            int record = userMapper.updateUserPw(chgUserPw);
            return record;
        }
        return 0;
    }

    @Override
    public String test() throws Exception {
        return userMapper.test();
    }

    public String makeAuthRandNumber() {
        Random random = new Random(System.currentTimeMillis());

        int range = (int)Math.pow(10,6);
        int trim = (int)Math.pow(10, 6-1);
        int result = random.nextInt(range)+trim;

        if(result>range){
            result = result - trim;
        }
        String rst = String.valueOf(result);
        return rst;
    }
}