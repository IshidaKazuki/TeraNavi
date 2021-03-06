package ttc.dao;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import ttc.util.MySqlConnectionManager;
import ttc.bean.Bean;
import ttc.bean.TopicBean;
import ttc.util.DateConversion;

import ttc.exception.integration.IntegrationException;

public class TopicDao implements AbstractDao{

    public Bean read(Map map)throws IntegrationException{
        PreparedStatement pst = null;
		TopicBean bean = null;

		try{
			Connection cn = null;
			cn = MySqlConnectionManager.getInstance().getConnection();
			StringBuffer sql = new StringBuffer();

			sql.append("select topic_id,topic_name ");
			sql.append("from topics where topic_id=?");

            pst = cn.prepareStatement( new String(sql) );

            pst.setString(1, (String)map.get("topicId"));

			ResultSet rs = pst.executeQuery();
			rs.next();

			bean = new TopicBean();
			bean.setTopicId(rs.getString(1));
			bean.setName(rs.getString(2));

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
		return bean;
    }

    public int update(Map map)throws IntegrationException{
        return 0;
    }

    public int insert(Map map)throws IntegrationException{
        PreparedStatement pst = null;
        int result = 0;
        try{
            Connection cn = null;
            cn = MySqlConnectionManager.getInstance().getConnection();

            StringBuffer sql = new StringBuffer();

            sql.append("INSERT INTO ");
            sql.append("topics(fk_community_id,fk_create_user_id,topic_name,");
            sql.append("topic_updatetime_date,topic_created_date) ");
            sql.append("values(?,?,?,now(),now())");

            pst = cn.prepareStatement( new String(sql) );

            pst.setString(1, (String)map.get("communityId"));
            pst.setString(2, (String)map.get("userId"));
            pst.setString(3, (String)map.get("topic_name"));

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

    public List readAll(Map map)throws IntegrationException{
        List result = new ArrayList();
        PreparedStatement pst = null;
        String commId= (String)map.get("communityId");

        try{
            Connection cn = null;
            cn = MySqlConnectionManager.getInstance().getConnection();
            StringBuffer sql = new StringBuffer();
			sql.append("select topic_id,fk_create_user_id,topic_name,topic_updatetime_date,");
			sql.append("topic_created_date,users.user_name,");
            sql.append("users.user_icon_path ");
			sql.append("from topics inner join users ");
			sql.append("on topics.fk_create_user_id=users.user_id ");
            sql.append("where fk_community_Id=?");

            pst = cn.prepareStatement(new String(sql));

			pst.setString(1, commId);

            ResultSet rs = pst.executeQuery();

            while(rs.next()){
                TopicBean topic = new TopicBean();
                topic.setTopicId(rs.getString(1));
                topic.setCreateUserId(rs.getString(2));
                topic.setName(rs.getString(3));
                topic.setUpdateDate(DateConversion.doFormatDateYear(rs.getString(4)));
                topic.setCreateDate(DateConversion.doFormatDateYear(rs.getString(5)));
                topic.setCreateUserName(rs.getString(6));
                topic.setUserIconPath(rs.getString(7));
                result.add(topic);
            }

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

        return result;
    }

}
