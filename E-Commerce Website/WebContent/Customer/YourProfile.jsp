<%@ include file="../header.jsp"%>
          <a class="nav-link text-center pt-5" href="#">UserName: <%=session.getAttribute("mail")%></a>
          <div class="text-center pt-3">
          <a class="btn btn-sm btn-primary " href="/E-Commerce_Website/Customer/logout.jsp">Logout</a>
          </div>
      <%@ include file="../footer.jsp"%>