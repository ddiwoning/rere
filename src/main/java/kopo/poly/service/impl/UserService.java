package kopo.poly.service.impl;

import kopo.poly.dto.UserDTO;
import kopo.poly.mapper.IUserMapper;
import kopo.poly.service.IUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public String test() throws Exception {
        return userMapper.test();
    }
}