package kopo.poly.dto;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserDTO {


    private int user_seq;  // 기본키
    private String find_lf;
    private String user_name;
    private String user_id;
    private String user_pw;
    private String user_gender;
    private int user_age;
    private int user_birth;
    private String user_newaddr;
    private String user_phone;
    private String join_dt;

    @Override
    public String toString() {
        return "UserDTO{" +
                "user_seq =" + user_seq +
                " user_name =" + user_name +
                " user_id ='" + user_id + '\'' +
                " user_pw ='" + user_pw + '\'' +
                " user_gender ='" + user_gender + '\'' +
                " user_age ='" + user_age + '\'' +
                " user_birth ='" + user_birth + '\'' +
                " user_newaddr =" + user_newaddr +
                " user_phone ='" + user_phone + '\'' +
                " join_dt ='" + join_dt +
                '}';
    }

}