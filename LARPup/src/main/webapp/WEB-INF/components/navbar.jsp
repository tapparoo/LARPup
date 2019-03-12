<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
  <a class="navbar-brand" href="/home/home.do">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/home/home.do">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
      </li>
    </ul>
    <c:choose> 
      <c:when test="${ not empty sessionScope.myUser }"> 
        <form class="form-inline my-2 my-lg-0" action="/user/displayUser.do" method="GET">
          <input type="hidden" name="userId" value="${sessionScope.myUser.id}"/>
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Profile</button>
        </form>
        <form class="form-inline my-2 my-lg-0" action="/auth/logout.do" method="GET">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Logout</button>
        </form>
      </c:when>
	  <c:otherwise>
	    <form class="form-inline my-2 my-lg-0" action="/auth/authorize.do" method="GET">
	      <input class="form-control mr-sm-2" name="email" type="search" placeholder="email" aria-label="email">
	      <input class="form-control mr-sm-2" name="password" type="search" placeholder="password" aria-label="password">
	      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
	    </form>
	      <form class="form-inline my-2 my-lg-0" action="/user/createUserForm.do" method="GET">
	      <button class="btn btn-outline-success my-2 my-sm-0"type="submit">Sign Up</button>
	      </form>
	  </c:otherwise>
    </c:choose>
  </div>
</nav>
