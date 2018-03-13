package DB;

import Beans.Student;

import java.sql.*;

/**
 * Created with IntelliJ IDEA.
 *
 * @author wanyu
 * @Date: 2018-03-12
 * @Time: 11:10
 * To change this template use File | Settings | File Templates.
 * @desc
 */
public class DB_operation {//数据库操作
    private Student student;

    public DB_operation(Student student) {
        this.student = student;
    }

    /**
     * 向数据库中写入数据
     */
    public void Write() {
        Connection connection = DB_connect.getConnection();//获取数据库连接
        PreparedStatement preparedStatement = null;
        try {
            //获取student对象中的数据
            String data[] = new String[12];
            data[1] = student.getName();
            data[2] = student.getStudent_id();
            data[3] = student.getPhone();
            data[4] = student.getMail();
            data[5] = student.getQq();
            data[6] = student.getDepartment();
            data[7] = student.getPhoto();
            data[8] = student.getIntroduce();
            data[9] = student.getSex();
            data[10] = student.getDorm();
            data[11] = student.getMajor();
            //SQL语句
            String SQL = "INSERT INTO student VALUES(?,?,?,?,?,?,?,?,?,?,?)";
            preparedStatement = connection.prepareStatement(SQL);
            for (int i = 1; i < 12; i++) {
                preparedStatement.setString(i, data[i]);//语句拼接
            }
            System.out.println(preparedStatement.toString());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } catch (SQLException ignored) {

            }
        }
    }

    /**
     * 判断该学生是否已经报名过了
     *
     * @return 判断结果
     */
    public boolean Judge() {
        Connection connection = DB_connect.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        boolean flag = false;//false表示没有重复
        try {
            String SQL = "SELECT name FROM student WHERE name=? LIMIT 1;";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, student.getName());
            resultSet = preparedStatement.executeQuery();
            flag = resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return flag;

    }
}
