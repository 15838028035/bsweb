package com.lj.app.bsweb.upm.app.entity;

import com.lj.app.core.common.base.entity.BaseEntity;

/**
 * 
 * 应用管理
 *
 */
public class UpmApp extends BaseEntity {

  /**
   * ID
   */
  private java.lang.Integer id;

  /**
   * 应用编码
   */
  private String appCode;
  /**
   * 应用名称
   */
  private String appName;
  /**
   * 应用URL
   */
  private String appUrl;

  public UpmApp() {
  }

  public void setAppCode(String value) {
    this.appCode = value;
  }

  public String getAppCode() {
    return this.appCode;
  }

  public void setAppName(String value) {
    this.appName = value;
  }

  public String getAppName() {
    return this.appName;
  }

  public void setAppUrl(String value) {
    this.appUrl = value;
  }

  public String getAppUrl() {
    return this.appUrl;
  }

  public void setId(java.lang.Integer value) {
    this.id = value;
  }

  public java.lang.Integer getId() {
    return this.id;
  }
}
