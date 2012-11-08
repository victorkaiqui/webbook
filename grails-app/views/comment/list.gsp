
<div class="container-fluid">
  <div class="row-fluid">
    <div class="span4">
${bookmark.title}
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
  <div class="row-fluid">
    <div class="span6">
      <g:each in="${comments}" var="comment">
        
${comment.user.username}
${comment.text}

        <br>
      </g:each>
    </div>
  </div>
</div>
