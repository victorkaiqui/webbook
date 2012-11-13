<g:form url="[action:'edit', controller:'bookmark']">
  <fieldset>

    <g:render template="/bookmark/form" />

    <div class="modal-footer">  
      <a href="#" class="btn btn-small btn-danger" data-dismiss="modal" >Close</a>  
      <g:submitButton name="edit" value="Editar" class="btn btn-small btn-info"/>
    </div>

  </fieldset>
</g:form>