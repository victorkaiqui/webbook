
<div class="container-fluid">
  <div class="row-fluid">
    <div class="span4">
      <h3>${bookmark.title}</h3>
      <a href="${bookmark.urlShorten}">${bookmark.urlShorten}</a>
    </div>
    <div class="span8">
      <g:form url="[action:'save', controller:'comment']">
        <fieldset>

          <g:render template="/comment/form"/>

          <g:hiddenField name="id" value="${bookmark.id}" />
          <g:submitButton name="create" class="btn btn-primary" value="Comentar" />

        </fieldset>
      </g:form>
    </div>
  </div>
  <hr>


  <g:each in="${comments}" var="comment">
    
    <div class="row-fluid ">
      <div class="span2">
        <h4>${comment.user.username}</h4>
      </div>
      <div class="span10 thumbnail">
        <div class="row-fluid ">
          <div class="span11">
            <p class="lead">${comment.text}</p>
          </div>
          <div class="span1">
            <g:if test="${comment.user.id == user.id}">
            <g:form controller="comment" >
              <g:hiddenField name="id" value="${comment?.id}" />
              <g:hiddenField name="version" value="${comment?.version}" />

              <g:actionSubmit class="btn btn-link"action="delete" value="x" formnovalidate="" onclick="return confirm('Tem certeza?');" />

            </g:form>
            </g:if>
          </div>
        </div>
      </div>
    </div>
    <hr>
    
  </g:each>

</div>
