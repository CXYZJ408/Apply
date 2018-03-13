package Service;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 *
 * @author wanyu
 * @Date: 2018-03-11
 * @Time: 21:19
 * To change this template use File | Settings | File Templates.
 * @desc 上传图片
 */
public class UploadPicture {
    /**
     * @param item 传入的文件
     * @return 文件路径
     * @throws Exception
     */
    public String upload(FileItem item) throws Exception {
        String separator = File.separator;//分割符号
        String path = "/home/yaser/img";
        String filename = item.getName();
        filename = filename.substring(filename.lastIndexOf(separator) + 1);
        File file = rename(new File(path + separator + filename));
        if (!file.exists()) {
            file.getParentFile().mkdirs();
        }

        if (!file.exists()) {
            item.write(file);
        }
        item.delete();
        return file.getAbsolutePath() + separator + file.getName();
    }

    /**
     * @param file 要重命名的文件
     * @return 返回重命名后的文件
     */
    private File rename(File file) {
        String body;
        String ext;
        Date date = new Date();
        int pot = file.getName().lastIndexOf(".");
        if (pot != -1) {
            body = date.getTime() + "";
            ext = file.getName().substring(pot);
        } else {
            body = (new Date()).getTime() + "";
            ext = "";
        }
        String newName = body + ext;
        file = new File(file.getParent(), newName);
        return file;
    }
}
