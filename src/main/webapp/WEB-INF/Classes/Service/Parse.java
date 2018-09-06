package Service;

import Beans.Student;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.HttpServletRequest;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 *
 * @author wanyu
 * @Date: 2018-03-12
 * @Time: 11:25
 * To change this template use File | Settings | File Templates.
 * @desc 解析从前端发来的数据
 */
public class Parse {
    private HttpServletRequest request;
    private Student student;

    public Parse(HttpServletRequest request) {
        this.request = request;
        student = new Student();
        doParse();//进行数据解析
    }

    /**
     * @return 数据解析结果
     */
    public Student getRes() {
        return student;
    }

    /**
     * 数据解析操作
     */
    private void doParse() {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload fileUpload = new ServletFileUpload(factory);
        fileUpload.setFileSizeMax(3 * 1024 * 1024);//设置获取数据的最大数值
        try {
            List<FileItem> items = fileUpload.parseRequest(request);//解析每一个表单项
            for (FileItem item : items) {
                if (!item.isFormField()) {//如果不是表单数据，即文件
                    UploadPicture picture = new UploadPicture();//解析上传的文件
                    student.setPhoto(picture.upload(item));
                } else {
                    String name = item.getFieldName();//获取表单名字
                    String value = item.getString("UTF-8");//获取该名字的数据
                    switch (name) {
                        case "name": {
                            student.setName(value);
                            break;
                        }
                        case "sex": {
                            student.setSex(value);
                            break;
                        }
                        case "std": {
                            student.setStudent_id(value);
                            break;
                        }
                        case "phone": {
                            student.setPhone(value);
                            break;
                        }
                        case "QQ": {
                            student.setQq(value);
                            break;
                        }
                        case "specialty": {
                            student.setMajor(value);
                            break;
                        }
                        case "dormitory": {
                            student.setDorm(value);
                            break;
                        }
                        case "department": {
                            String temp = student.getDepartment();
                            if (temp != null) {
                                value = value + " " + temp;
                            }
                            student.setDepartment(value);
                            break;
                        }
                        case "mail": {
                            student.setMail(value);
                            break;
                        }
                        case "introduce": {
                            student.setIntroduce(value);
                            break;
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
