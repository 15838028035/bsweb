package com.lj.app.bsweb.upm.common.web;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.stereotype.Controller;

import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.Struts2Utils;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * 功能web
 *
 */
@Controller
@Namespace("/")
@Action("commonWebAction")
public class CommonWebAction extends ActionSupport {

  private static Log logger = LogFactory.getLog(CommonWebAction.class);

  public static final String TEMPLATE_DIR = "template";

  /**
   * 模板文件名称
   */
  private String templatekey;

  /**
   * 获得模板
   */
  public void getBatchTemplate() {

    InputStream in = null;
    OutputStream os = null;
    String filePath = null;

    try {

      String path = Struts2Utils.getRequest().getContextPath();

      filePath = path + File.separator + TEMPLATE_DIR + File.separator + templatekey;

      if (StringUtil.isBlank(filePath)) {
        return;
      }

      String fileName = filePath.substring(0, filePath.lastIndexOf("."));
      fileName = filePath.substring(filePath.lastIndexOf("/") + 1, filePath.length());

      HttpServletResponse response = Struts2Utils.getResponse();
      response.setContentType("application/octet-stream; charset=utf-8");
      response.setHeader("Content-disposition", "attachment; fileName=\"" + fileName + "\"");
      os = response.getOutputStream();

      in = this.getClass().getResourceAsStream(filePath);

      if (in == null) {
        if (os != null) {
          os.close();
        }
      }

      byte[] b = new byte[2048];

      while (in.read(b) != -1) {
        os.write(b);
        os.flush();
      }
    } catch (IOException e) {
      e.printStackTrace();
      logger.error("file[" + filePath + "] read error= " + e.getMessage());
    } catch (Exception e) {
      e.printStackTrace();
      logger.error(e.getMessage());
    } finally {
      try {
        if (os != null) {
          in.close();
        }
        if (os != null) {
          os.close();
        }
      } catch (IOException e) {
        e.printStackTrace();
        logger.error(e.getMessage());
      }
    }
  }

  public String getTemplatekey() {
    return templatekey;
  }

  public void setTemplatekey(String templatekey) {
    this.templatekey = templatekey;
  }

  public void logintimeout() {
    Struts2Utils.renderText("登陆超时");
  }

  public void ajaxtimeout() {
    Struts2Utils.renderText("超时");
  }

}
