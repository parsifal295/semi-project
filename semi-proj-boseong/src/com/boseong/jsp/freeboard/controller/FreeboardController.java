package com.boseong.jsp.freeboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FreeboardController {

  public String requestFreeboard(HttpServletRequest request, HttpServletResponse response) {
    String returnMe = "/views/freeboard/fboardListView.jsp";
    return returnMe;
  }
}
