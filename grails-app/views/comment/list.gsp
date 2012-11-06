<g:form url="[action:'save', controller:'comment']">
  <fieldset>

    <g:render template="/comment/form"/>
                     
      <g:hiddenField name="id" value="${bookmarkId}" />
      <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
  

  </fieldset>
</g:form>
<g:each in="${comments}" var="comment">
  ${comment.text}
</g:each>