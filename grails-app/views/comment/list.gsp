
<div class="container-fluid">
  <div class="row-fluid">
    <div class="span6">
      <g:form url="[action:'save', controller:'comment']">
        <fieldset>

          <g:render template="/comment/form"/>

          <g:hiddenField name="id" value="${bookmarkId}" />
          <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />


        </fieldset>
      </g:form>
    </div>
    <div class="span6">
      <g:each in="${comments}" var="comment">
${comment.text}<br>

        <div class="acoes" style="display: none;">
          <g:form>        
            <g:hiddenField name="id" value="${comment?.id}" />
            <g:actionSubmit class="delete" action="delete" value="Excluir" onclick="return confirm('Você tem certeza?'); "/>
            </fieldset>
          </g:form>
        </div>
      </g:each>
    </div>
  </div>
</div>
<script>
  $(document).ready(function(){
    $("div.span6").hover(
    function(){
      $(this).find("div.acoes").show();
    },
    function(){
$(this).find("div.acoes").hide();
}
);
)}  
</script>


