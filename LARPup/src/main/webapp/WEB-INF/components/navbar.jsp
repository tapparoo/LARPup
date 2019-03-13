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
	    <form class="form-inline my-2 my-lg-0" action="/auth/authorize.do" method="POST">
	      <input class="form-control mr-sm-2" name="email" type="email" placeholder="email" aria-label="email">
	      <input class="form-control mr-sm-2" name="password" type="password" placeholder="password" aria-label="password">
	      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
	    </form>
    </c:otherwise>
    </c:choose>
	
	<div class="text-center">
	  <a href="" class="btn btn-outline-success btn-rounded mb-4" data-toggle="modal" data-target="#modalRegisterForm">Launch
	    Modal Register Form</a>
	</div>

	    
	      <%-- <form class="form-inline my-2 my-lg-0" action="/user/createUserForm.do" method="GET">
	      <button class="btn btn-outline-success my-2 my-sm-0"type="submit">Sign Up</button>
	      </form> --%>
  </div>
</nav>

<div class="modal fade" id="modalRegisterForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Sign up</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
          <i class="fas fa-user prefix grey-text"></i>
          <input type="text" id="orangeForm-name" class="form-control validate">
          <label data-error="wrong" data-success="right" for="orangeForm-name">Your name</label>
        </div>
        <div class="md-form mb-5">
          <i class="fas fa-envelope prefix grey-text"></i>
          <input type="email" id="orangeForm-email" class="form-control validate">
          <label data-error="wrong" data-success="right" for="orangeForm-email">Your email</label>
        </div>

        <div class="md-form mb-4">
          <i class="fas fa-lock prefix grey-text"></i>
          <input type="password" id="orangeForm-pass" class="form-control validate">
          <label data-error="wrong" data-success="right" for="orangeForm-pass">Your password</label>
        </div>

      </div>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-deep-orange">Sign up</button>
      </div>
    </div>
  </div>
</div>
