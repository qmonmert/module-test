<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<!-- SQL-2 query -->
<jcr:sql var="res" sql="select * from [jnt:account]"/>

<h3>Accounts</h3>

<table class="table">
  <thead>
    <tr>
      <th>Lastname</th>
      <th>Firstname</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach items="${res.nodes}" var="stravaActivity" varStatus="status">
        <tr>
          <td>${stravaActivity.properties['lastname'].string}</td>
          <td>${stravaActivity.properties['firstname'].string}</td>
        </tr>
    </c:forEach>
  </tbody>
</table>

<a class="btn btn-default btn-primary"
    href="<c:url value="${url.base}/sites/strava-site/accounts/create-account.html"/>">
    Create an account
</a>