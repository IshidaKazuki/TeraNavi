package ttc.dao;

import java.text.SimpleDateFormat;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.sql.Date;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ttc.bean.UserBean;
import ttc.bean.Bean;
import ttc.exception.IntegrationException;
import ttc.util.MySqlConnectionManager;

import ttc.exception.NotLineException;


public class UsersDao implements AbstractDao{
    PreparedStatement pst=null;
    Connection cn=null;
    ResultSet rs=null;

    public List readAll(Map map)throws IntegrationException{
        List list=new ArrayList();
        try{
            cn=MySqlConnectionManager.getInstance().getConnection();
            String sql="select * from users where user_status_flag=?";
            pst=cn.prepareStatement(sql);
            rs=pst.executeQuery();

            pst.setString(19,(String)map.get("userStatus"));


            while(rs.next()){
                UserBean ub=new UserBean();

                ub.setId(rs.getString(1));
                ub.setLoginId(rs.getString(2));
                ub.setUserName(rs.getString(3));
                ub.setNameKana(rs.getString(4));
                ub.setSex(rs.getString(5));
                ub.setSexVisibleFlag(rs.getString(6));
                ub.setBirthDate(rs.getString(7));
                ub.setMailAddress(rs.getString(8));
                ub.setPassword(rs.getString(9));
                // あとでなおしてね
                // ub.setQuestion(rs.getString(10));
                ub.setSecretAnswer(rs.getString(11));
                ub.setHeaderPath(rs.getString(12));
                ub.setIconPath(rs.getString(13));
                // あとでなおしてね
                // ub.setTitle(rs.getString(14));
                // ub.setHeadPhotoPath(rs.getString(15));
                ub.setAdminFlag(rs.getString(16));
                ub.setLastLoginDate(rs.getString(17));
                ub.setAdminLastLoginDate(rs.getString(18));
                ub.setUserStatus(rs.getString(19));
                ub.setLockEndDate(rs.getString(20));
                ub.setLockStartDate(rs.getString(21));
                // ub.setBlogExplanation(rs.getString(22));
                ub.setProfile(rs.getString(23));
                list.add(ub);
            }
            MySqlConnectionManager.getInstance().commit();
        }catch(SQLException e){
            throw new IntegrationException(e.getMessage(),e);
        }finally{
            try{
                if(pst!=null){
                    pst.close();
                }
            }catch(SQLException e){
                throw new IntegrationException(e.getMessage(),e);
            }
        }
    return list;
    }

    public int update(Map map)throws IntegrationException{
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        int result=0;
        try{
            UserBean ub=new UserBean();
            Connection cn = MySqlConnectionManager.getInstance().getConnection();
            StringBuffer sql = new StringBuffer();
            sql.append("update users set user_name=?,user_name_kana=?,sex_visible_flag=?,");
            sql.append("mail_address=?,password=?,user_header_path=?,user_icon_path=?,");
            sql.append("last_login_dete=?,user_status_flag=?,user_lock_start_date=?,user_lock_end_date=?,");
            sql.append("user_profile=? where user_id=?");
            pst = cn.prepareStatement(new String(sql));

            //ユーザーの名前を変更
            if(map.containsKey("userName")){
                pst.setString(1,(String)map.get("userName"));
            }else{
                pst.setString(1,ub.getUserName());
            }
            //ユーザーの名前（カナ）を変更
            if(map.containsKey("userNameKana")){
                pst.setString(2,(String)map.get("userNameKana"));
            }else{
                pst.setString(2,ub.getNameKana());
            }
            //性別の表示設定を変更
            if(map.containsKey("SexVisibleFlag")){
                pst.setString(3,(String)map.get("SexVisibleFlag"));
            }else{
                pst.setString(3,ub.getSexVisibleFlag());
            }
            //メールアドレスの変更
            if(map.containsKey("mailAddress")){
                pst.setString(4,(String)map.get("mailAddress"));
            }else{
                pst.setString(4,ub.getMailAddress());
            }
            //パスワードの変更
            if(map.containsKey("password")){
                pst.setString(5,(String)map.get("password"));
            }else{
                pst.setString(5,ub.getPassword());
            }
            //ユーザーのヘッダー画像のパスを変更
            if(map.containsKey("headerPath")){
                pst.setString(6,(String)map.get("headerPath"));
            }else{
                pst.setString(6,ub.getHeaderPath());
            }
            //ユーザーのアイコン画像パスを変更
            if(map.containsKey("iconPath")){
                pst.setString(7,(String)map.get("iconPath"));
            }else{
                pst.setString(7,ub.getIconPath());
            }
            //ユーザーが最後にログインした日を変更
            if(map.containsKey("lastLoginDate")){
                pst.setString(8,(String)map.get("lastLoginDate"));
            }else{
                pst.setString(8,ub.getLastLoginDate());
            }
            //ユーザーステータスを変更
            if(map.containsKey("userStatus")){
                pst.setString(9,(String)map.get("userStatus"));
            }else{
                pst.setString(9,ub.getUserStatus());
            }
            //ユーザのロック開始の日にちを変更
            if(map.containsKey("lockStartDate")){


                pst.setDate(10,(Date)map.get("lockStartDate"));
            }else{
                //String型をjava.sql.Dateに直す
                //pst.setDate(10,(Date)ub.getLockStartDate());
            }
            //ユーザのロック終了日を変更
            if(map.containsKey("lockEndDate")){
                pst.setDate(11,(Date)map.get("lockEndDate"));
            }else{
                //String型をjava.sql.Dateに直す
                //pst.setDate(11,(Date)ub.getLockEndDate());
            }
            //ユーザの自己紹介を変更
            if(map.containsKey("profile")){
                pst.setString(6,(String)map.get("profile"));
            }else{
                pst.setString(6,ub.getProfile());
            }


            pst.setString(13,(String)map.get("userId"));


            result = pst.executeUpdate();


        }catch(SQLException e){
            MySqlConnectionManager.getInstance().rollback();
            throw new IntegrationException(e.getMessage(),e);
        }finally{
            try{
                if(pst!=null){
                    pst.close();
                }
            }catch(SQLException e){
                throw new IntegrationException(e.getMessage(),e);
            }
        }

        return result;

    }

    public int insert(Map map)throws IntegrationException{
        int count = 0;
        try{
            cn=MySqlConnectionManager.getInstance().getConnection();
            StringBuffer sql = new StringBuffer();
            sql.append("insert into users(login_id,user_name,user_name_kana,sex,sex_visible_flg,birth_date,mail_address,password,fk_secret_question_id,secret_answer)");
            sql.append("values(?,?,?,?,?,?,?,?,?,?)");
            pst=cn.prepareStatement(new String(sql));

            pst.setString(1,(String)map.get("loginId"));
            pst.setString(2,(String)map.get("userName"));
            pst.setString(3,(String)map.get("nameKana"));
            pst.setString(4,(String)map.get("sex"));
            pst.setString(5,(String)map.get("sexVisibleFlag"));
            pst.setString(6,(String)map.get("birthDate"));
            pst.setString(7,(String)map.get("mailAddress"));
            pst.setString(8,(String)map.get("password"));
            pst.setString(9,(String)map.get("quepstionId"));
            pst.setString(10,(String)map.get("secretAnswer"));

            count = pst.executeUpdate();
        }catch(SQLException e){
            MySqlConnectionManager.getInstance().rollback();
        }finally{
            try{
                if(pst!=null){
                    pst.close();
                }
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
        return count;
    }
    public Bean read(Map map) throws IntegrationException{
        UserBean ub = new UserBean();
        PreparedStatement pst = null;
        try{
            Connection cn = null;
            cn = MySqlConnectionManager.getInstance().getConnection();
            StringBuffer sql=new StringBuffer();
            sql.append("select user_id,login_id,user_name,user_name_kana,sex,sex_visible_flag");
            sql.append(",birth_date,mali_address,password,user_header_path,user_icon_path,admin_flag,last_login_dete,");
            sql.append("admin_last_login_date,user_status_flag,user_lock_end_date,user_lock_start_date,");
            sql.append("user_profile from users");
            sql.append(map.get("where"));
            pst = cn.prepareStatement(new String(sql));

            pst.setString(1,(String)map.get("value"));

            ResultSet rs = pst.executeQuery();

            if(rs.next()){

                ub.setId(rs.getString(1));
                ub.setUserName(rs.getString(2));
                ub.setNameKana(rs.getString(3));
                ub.setSex(rs.getString(4));
                ub.setSexVisibleFlag(rs.getString(5));
                ub.setBirthDate(rs.getString(6));
                ub.setMailAddress(rs.getString(7));
                ub.setPassword(rs.getString(8));
                ub.setHeaderPath(rs.getString(9));
                ub.setIconPath(rs.getString(10));
                ub.setAdminFlag(rs.getString(11));
                ub.setLastLoginDate(rs.getString(12));
                ub.setAdminLastLoginDate(rs.getString(13));
                ub.setUserStatus(rs.getString(14));
                ub.setLockEndDate(rs.getString(15));
                ub.setLockStartDate(rs.getString(16));
                ub.setProfile(rs.getString(17));

            }else{
                throw new NotLineException("0行が選択されました",null);
            };

        }catch(SQLException e){
            throw new IntegrationException(e.getMessage(),e);
        }finally{
            try{
                if(pst!=null){
                    pst.close();
                }
            }catch(SQLException e){
                throw new IntegrationException(e.getMessage(),e);
            }
        }
        return ub;
    }


}