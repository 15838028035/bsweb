package com.lj.app.bsweb.upm.file.web;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lj.app.bsweb.upm.AbstractBaseUpmAction;
import com.lj.app.core.common.base.entity.UpmFile;
import com.lj.app.core.common.base.service.BaseService;
import com.lj.app.core.common.base.service.UpmFileService;
import com.lj.app.core.common.pagination.PageTool;
import com.lj.app.core.common.util.DateUtil;
import com.lj.app.core.common.util.StringUtil;
import com.lj.app.core.common.web.AbstractBaseAction;
import com.lj.app.core.common.web.Struts2Utils;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * @title :UpmFileAction.java
 * @description :UpmFileAction
 * @author: userName
 * @date: date
 */
@SuppressWarnings("serial")
@Controller
@Namespace("/jsp/upmFile")
@Results({
    @Result(name = AbstractBaseAction.RELOAD, 
      location = "upmFileAction", type = AbstractBaseAction.REDIRECT),
    @Result(name = AbstractBaseAction.INPUT,
      location = "/jsp/upmFile/upmFile-input.jsp"),
    @Result(name = AbstractBaseAction.SAVE, 
      location = "upmFileAction!edit.action", type = AbstractBaseAction.REDIRECT),
    @Result(name = AbstractBaseAction.LIST, 
      location = "/jsp/upmFile/upmFileList.jsp", type = AbstractBaseAction.REDIRECT)
    })
@Action("upmFileAction")
public class UpmFileAction extends AbstractBaseUpmAction<UpmFile> {

  protected Logger logger = LoggerFactory.getLogger(UpmFileAction.class);

  /**
   * ID
   */
  private Integer id;

  /**
   * relateId1
   */
  private String relateId1;

  /**
   * 
   */
  private String relateId2;

  /**
   * 
   */
  private String name;

  /**
   * optdate
   */
  private java.util.Date optdate;

  /**
   * operator
   */
  private Integer operator;

  /**
   * content
   */
  private byte[] content;

  /**
   * 排序列
   */
  private String sidx;

  /**
   * 排序方式
   */
  private String sord;

  /**
   * 排序列
   */
  private String sortColumns;

  @Autowired
  private UpmFileService<UpmFile> upmFileService;

  private UpmFile upmFile;

  public BaseService<UpmFile> getBaseService() {
    return upmFileService;
  }

  public UpmFile getModel() {
    return upmFile;
  }

  @Override
  protected void prepareModel() throws Exception {
    if (id != null) {
      upmFile = (UpmFile) upmFileService.getInfoByKey(id);
    } else {
      upmFile = new UpmFile();
    }

  }

  @Override
  public String list() throws Exception {
    try {
      Map<String, Object> condition = new HashMap<String, Object>();
      if (StringUtil.isNotBlank(this.getSidx())) {
        String orderBy = PageTool.convert(this.getSidx()) + " " + this.getSord();
        sortColumns = orderBy;
        page.setSortColumns(sortColumns);
      }

      condition.put("id", id);
      condition.put("relateId1", relateId1);
      condition.put("relateId2", relateId2);
      condition.put("name", name);
      condition.put("optdate", optdate);
      condition.put("optdateBegin", Struts2Utils.getParameter("optdateBegin"));
      condition.put("optdateEnd", Struts2Utils.getParameter("optdateEnd"));
      condition.put("operator", operator);
      condition.put("content", content);
      condition.put(CREATE_BY, getLoginUserId());

      upmFileService.findPageList(page, condition);
      Struts2Utils.renderText(PageTool.pageToJsonBootStrap(this.page), new String[0]);
      return null;
    } catch (Exception e) {
      e.printStackTrace();
      throw e;
    }
  }

  @Override
  public String input() throws Exception {
    return INPUT;
  }

  @Override
  public String save() throws Exception {

    try {
      if (StringUtil.isEqualsIgnoreCase(operate, AbstractBaseAction.EDIT)) {
        upmFile.setId(id);
        upmFile.setRelateId1(relateId1);
        upmFile.setRelateId2(relateId2);
        upmFile.setName(name);
        upmFile.setOptdate(optdate);
        upmFile.setOperator(operator);
        upmFile.setContent(content);
        upmFile.setUpdateBy(getLoginUserId());
        upmFile.setUpdateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
        upmFileService.updateObject(upmFile);

        returnMessage = UPDATE_SUCCESS;
      } else {
        upmFile = new UpmFile();
        upmFile.setId(id);
        upmFile.setRelateId1(relateId1);
        upmFile.setRelateId2(relateId2);
        upmFile.setName(name);
        upmFile.setOptdate(optdate);
        upmFile.setOperator(operator);
        upmFile.setContent(content);

        upmFile.setCreateBy(getLoginUserId());
        upmFile.setCreateDate(DateUtil.getNowDateYYYYMMddHHMMSS());
        upmFileService.insertObject(upmFile);
        returnMessage = CREATE_SUCCESS;
      }

      return LIST;
    } catch (Exception e) {
      returnMessage = CREATE_FAILURE;
      e.printStackTrace();
      throw e;
    } 

  }

  /**
   * @description: 文件下载
   * @return String
   * @throws Exception：
   */
  public String download() throws Exception {
    String id = Struts2Utils.getRequest().getParameter("id");
    try {
      UpmFile upmFile = (UpmFile) upmFileService.getInfoByKey(id);
      // 获取该附件的类型
      byte[] bt = null;
      bt = upmFile.getContent();
      HttpServletResponse res = Struts2Utils.getResponse();
      res.reset();
      res.setContentType("application/x-msdownload");
      res.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(upmFile.getName(), "UTF-8"));
      OutputStream out = res.getOutputStream();

      out.write(bt);
      out.flush();
      out.close();
    } catch (Exception e1) {

      e1.printStackTrace();
    }
    return null;
  }

  @Override
  public String delete() throws Exception {
    String id = Struts2Utils.getRequest().getParameter("id");
    upmFileService.delete(id);
    Struts2Utils.renderText(TRUE);
    return null;
  }

  public UpmFileService<UpmFile> getUpmFileService() {
    return upmFileService;
  }

  public void setUpmFileService(UpmFileService<UpmFile> upmFileService) {
    this.upmFileService = upmFileService;
  }

  public void setId(Integer value) {
    this.id = value;
  }

  public Integer getId() {
    return this.id;
  }

  public void setRelateId1(String value) {
    this.relateId1 = value;
  }

  public String getRelateId1() {
    return this.relateId1;
  }

  public void setRelateId2(String value) {
    this.relateId2 = value;
  }

  public String getRelateId2() {
    return this.relateId2;
  }

  public void setName(String value) {
    this.name = value;
  }

  public String getName() {
    return this.name;
  }

  public void setOptdate(java.util.Date value) {
    this.optdate = value;
  }

  public java.util.Date getOptdate() {
    return this.optdate;
  }

  public void setOperator(Integer value) {
    this.operator = value;
  }

  public Integer getOperator() {
    return this.operator;
  }

  public Logger getLogger() {
    return logger;
  }

  public void setLogger(Logger logger) {
    this.logger = logger;
  }

  public byte[] getContent() {
    return content;
  }

  public void setContent(byte[] content) {
    this.content = content;
  }

  public UpmFile getUpmFile() {
    return upmFile;
  }

  public void setUpmFile(UpmFile upmFile) {
    this.upmFile = upmFile;
  }

  public String getSidx() {
    return sidx;
  }

  public void setSidx(String sidx) {
    this.sidx = sidx;
  }

  public String getSord() {
    return sord;
  }

  public void setSord(String sord) {
    this.sord = sord;
  }

  public String getSortColumns() {
    return sortColumns;
  }

  public void setSortColumns(String sortColumns) {
    this.sortColumns = sortColumns;
  }

}
