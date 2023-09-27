package com.boseong.jsp.freeboard.controller;

import com.boseong.jsp.freeboard.model.vo.Freeboard;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FreeboardController {

  public String requestFreeboard(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    ArrayList<Freeboard> list = null;
    list = new FreeboardService().selectFboardList();

    String returnMe = "/views/freeboard/fboardListView.jsp";
    return returnMe;
  }
}
