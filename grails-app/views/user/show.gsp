
<%@ page import="br.com.webbook.User" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<!--		<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
                <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
        </div>-->
  <div class="row">
    <div class="span8 offset2" style="border: 1px solid gainsboro">
      <h1><g:message code="default.show.label" args="[entityName]" /></h1>
      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>
      <ol class="property-list user">

        <g:if test="${userInstance?.name}">
          <li class="fieldcontain">
            <span id="name-label" class="property-label"><g:message code="user.name.label" default="Name" /></span>

            <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${userInstance}" field="name"/></span>

          </li>
        </g:if>

        <g:if test="${userInstance?.lastName}">
          <li class="fieldcontain">
            <span id="lastName-label" class="property-label"><g:message code="user.lastName.label" default="Last Name" /></span>

            <span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${userInstance}" field="lastName"/></span>

          </li>
        </g:if>

        <g:if test="${userInstance?.username}">
          <li class="fieldcontain">
            <span id="username-label" class="property-label"><g:message code="user.username.label" default="Username" /></span>

            <span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}" field="username"/></span>

          </li>
        </g:if>

        <g:if test="${userInstance?.email}">
          <li class="fieldcontain">
            <span id="email-label" class="property-label"><g:message code="user.email.label" default="Email" /></span>

            <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span>

          </li>
        </g:if>


        <g:if test="${userInstance?.birthyday}">
          <li class="fieldcontain">
            <span id="birthyday-label" class="property-label"><g:message code="user.birthyday.label" default="Birthyday" /></span>

            <span class="property-value" aria-labelledby="birthyday-label"><g:formatDate date="${userInstance?.birthyday}" /></span>

          </li>
        </g:if>

        <g:if test="${userInstance?.accountExpired}">
          <li class="fieldcontain">
            <span id="accountExpired-label" class="property-label"><g:message code="user.accountExpired.label" default="Account Expired" /></span>

            <span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${userInstance?.accountExpired}" /></span>

          </li>
        </g:if>

        <g:if test="${userInstance?.accountLocked}">
          <li class="fieldcontain">
            <span id="accountLocked-label" class="property-label"><g:message code="user.accountLocked.label" default="Account Locked" /></span>

            <span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${userInstance?.accountLocked}" /></span>

          </li>
        </g:if>

        <g:if test="${userInstance?.bookmarks}">
          <li class="fieldcontain">
            <span id="bookmarks-label" class="property-label"><g:message code="user.bookmarks.label" default="Bookmarks" /></span>

          <g:each in="${userInstance.bookmarks}" var="b">
            <span class="property-value" aria-labelledby="bookmarks-label"><g:link controller="bookmark" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
          </g:each>

          </li>
        </g:if>

        <g:if test="${userInstance?.comments}">
          <li class="fieldcontain">
            <span id="comments-label" class="property-label"><g:message code="user.comments.label" default="Comments" /></span>

          <g:each in="${userInstance.comments}" var="c">
            <span class="property-value" aria-labelledby="comments-label"><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
          </g:each>

          </li>
        </g:if>

        <g:if test="${userInstance?.dateCreated}">
          <li class="fieldcontain">
            <span id="dateCreated-label" class="property-label"><g:message code="user.dateCreated.label" default="Date Created" /></span>

            <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${userInstance?.dateCreated}" /></span>

          </li>
        </g:if>

        <g:if test="${userInstance?.enabled}">
          <li class="fieldcontain">
            <span id="enabled-label" class="property-label"><g:message code="user.enabled.label" default="Enabled" /></span>

            <span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${userInstance?.enabled}" /></span>

          </li>
        </g:if>

        <g:if test="${userInstance?.filters}">
          <li class="fieldcontain">
            <span id="filters-label" class="property-label"><g:message code="user.filters.label" default="Filters" /></span>

          <g:each in="${userInstance.filters}" var="f">
            <span class="property-value" aria-labelledby="filters-label"><g:link controller="filter" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
          </g:each>

          </li>
        </g:if>

        <g:if test="${userInstance?.lastUpdated}">
          <li class="fieldcontain">
            <span id="lastUpdated-label" class="property-label"><g:message code="user.lastUpdated.label" default="Last Updated" /></span>

            <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${userInstance?.lastUpdated}" /></span>

          </li>
        </g:if>

        <g:if test="${userInstance?.passwordExpired}">
          <li class="fieldcontain">
            <span id="passwordExpired-label" class="property-label"><g:message code="user.passwordExpired.label" default="Password Expired" /></span>

            <span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></span>

          </li>
        </g:if>

      </ol>
      <g:form>
        <fieldset class="buttons">
          <g:hiddenField name="id" value="${userInstance?.id}" />
          <g:link class="btn btn-warning btn-large" action="edit" id="${userInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
          <g:actionSubmit class="btn btn-danger btn-large" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
      </g:form>
    </div>
  </div>
</body>
</html>
