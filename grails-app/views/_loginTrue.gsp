<g:set var="entityName" value="${message(code: 'bookmark.label', default: 'Bookmark')}" />

<div class="container-fluid">
  <div class="row-fluid">
    <div class="span3">


      <avatar:gravatar email="${user.email}" alt="${user.username}" cssClass="img-circle" size="42" defaultGravatarUrl="mm"/>
      <span class="help-inline">
        <h4><sec:loggedInUserInfo field="username"/></h4>
      </span>


      <div class="container">  
        <div id="bookmark" class="modal hide fade in" style="display: none; ">  
          <div class="modal-header">  
            <a class="close" data-dismiss="modal">×</a>  
            <h3>Adicione seu novo favorito</h3>  
          </div>  

          <div class="modal-body">  

            <g:form url="[action:'save', controller:'bookmark']">
              <fieldset>

                <g:render template="/bookmark/form" />

                <div class="modal-footer">                  
                  <g:submitButton name="create" value="${message(code: 'default.button.create.label', default: 'Create')}" class="btn btn-warning btn-large"/>
                  <a href="#" class="btn btn-large" data-dismiss="modal">Close</a>  
                </div>

              </fieldset>
            </g:form>

          </div>  
        </div>

        <p><a data-toggle="modal" href="#bookmark" class="btn btn-primary"><i class="icon-plus icon-white"></i> Favorito</a></p>  

      </div>
    </div>

    <div class="span9">
      <h1>Novidades:</h1>
      <hr> 

    </div>
  </div>
</div>
</div>

