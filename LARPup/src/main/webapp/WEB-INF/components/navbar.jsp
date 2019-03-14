<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<style>
	.navbar{
		background-color: #e1e3e4
	}
	.navbar-brand{
		color: rgb(255, 129, 55)!important;
	    font-style: oblique;
	    font-weight: bold;
	}
	.btn-outline-warning{
		border-color: rgb(255, 129, 55)!important;
		color: rgb(255, 129, 55)!important;
	}
</style>

<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
  <a class="navbar-brand" href="/home/home.do">LARPup</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/search/searchPage.do">Search<span class="sr-only">(current)</span></a>
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
	      <button class="btn btn-sm btn-outline-warning my-2 my-sm-0" type="submit">Login</button>
	    </form>
	      <form class="form-inline my-2 my-lg-0" action="/user/createUserForm.do" method="GET">
	      <button class="btn btn-sm btn-outline-warning my-2 my-sm-0"type="submit">Sign Up</button>
	      </form>
	  </c:otherwise>
    </c:choose>
  </div>
</nav>
