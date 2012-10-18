<g:set var="entityName" value="${message(code: 'bookmark.label', default: 'Bookmark')}" />

<div class="container-fluid">
  <div class="row-fluid">
    <div class="span2">

      <div> 
        <avatar:gravatar email="${user.email}" alt="${user.username}" cssClass="img-circle" size="42"/>
        <h4><sec:loggedInUserInfo field="username"/></h4>
      </div>

      <div class="container">  
        <div id="example" class="modal hide fade in" style="display: none; ">  
          <div class="modal-header">  
            <a class="close" data-dismiss="modal">×</a>  
            <h3>This is a Modal Heading</h3>  
          </div>  
          <div class="modal-body">  

            <g:form url="[action:'save', controller:'bookmark']">
              <fieldset>
                <g:render template="/bookmark/form" />
                <div class="modal-footer">  
                  <g:submitButton name="create" value="${message(code: 'default.button.create.label', default: 'Create')}" class="btn btn-warning btn-large"/>
                  <a href="#" class="btn" data-dismiss="modal">Close</a>  
                </div>
              </fieldset>
            </g:form>

          </div>  
        </div>

        <p><a data-toggle="modal" href="#example" class="btn btn-primary">Adicionar favorito</a></p>  

      </div>
    </div>

    <div class="span10">
      <h1>Links</h1>
      <hr> 

    </div>
  </div>
</div>
</div>

