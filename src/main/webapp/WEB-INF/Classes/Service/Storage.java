package Service;

import Beans.Student;
import DB.DB_operation;

/**
 * Created with IntelliJ IDEA.
 *
 * @author wanyu
 * @Date: 2018-03-12
 * @Time: 11:39
 * To change this template use File | Settings | File Templates.
 * @desc 存储数据
 */
public class Storage {
    public boolean storage(Student student) {
        if (student != null) {
            DB_operation db_operation = new DB_operation(student);
            if (!db_operation.Judge()) {//如果没有重复的
                db_operation.Write();//写入数据
                return true;
            } else {
                System.out.println("重复了！！");
                return false;
            }
        } else {
            return false;
        }
    }
}
