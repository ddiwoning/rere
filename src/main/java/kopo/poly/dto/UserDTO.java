package kopo.poly.dto;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserDTO {

    /*private String user_name;
    private String user_id;
    private String user_pw;
    private String user_gender;
    private String user_age;
    private String user_birth;
    private String user_newaddr;
    private String user_oldaddr;
    private String user_phone;
    private String join_dt;

     */


    private int userSeq;     // 기본키, 순번
    private int userLogin;   //
    private String userId;      // 기본키, 순번
    private String userPw;      // 제목
    private String userName;
    private String userEmail;
    private String userLevel;
    private int userAge;
    private String userGender;
    private String userNickname;
    private String userStatus;

    @Override
    public String toString() {
        return "UserDTO{" +
                "userSeq=" + userSeq +
                ", userLogin=" + userLogin +
                ", userId='" + userId + '\'' +
                ", userPw='" + userPw + '\'' +
                ", userName='" + userName + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userLevel='" + userLevel + '\'' +
                ", userAge=" + userAge +
                ", userGender='" + userGender + '\'' +
                ", userNickname='" + userNickname + '\'' +
                ", userStatus='" + userStatus +
                '}';
    }

}
