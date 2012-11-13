<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main"/>

  </head>
  <body>
    <div class="container-fluid">
      <div class="row-fluid thumbnail" style="background: white">


        <div class="span1">
          <avatar:gravatar email="${user.email}" alt="${user.username}" cssClass="img-circle" size="56" defaultGravatarUrl="mm"/>
        </div>
        <div class="span9">
          <div class="row-fluid">
            <h2 class="fullname" style="margin-bottom: 0px">${user.name}</h2>
          </div>
          <div class="row-fluid">
            <h3 class="fullname" style="margin-top: 0px"><a class="muted">${user.username}</a></h3>
          </div>
        </div>
        <div class="span2">
          <div class="row-fluid">

            <b>${user.bookmarks.size()}</b>
            <a href="${request.contextPath}/${user.username}"> 
              Favoritos
            </a>

          </div>
          <div class="row-fluid">

            <b>${user.followings.size()}</b>
            <g:link action="followings"  controller="user" id="${user.id}">  
              Seguindo
            </g:link>


          </div>
          <div class="row-fluid">

            <b>${user.followers.size()}</b>
            <g:link action="followers"  controller="user" id="${user.id}">  
              Seguidores
            </g:link>

          </div>
          <div class="row-fluid">
            <g:form url="[action:'follow', controller:'user']">

              <g:hiddenField name="username" value="${user.username}" />
              <g:if test="${user.username != userInstance.username}">
                <g:if test="${isFollowing}">
                  <button  name="deixarDeSeguir" value="Deixar de Seguir" class="btn btn-small btn-danger"><g:img dir="img" file="glyphicons_007_user_remove_1.png" width="18" height="14"/> Deixar de Seguir </button>           
                </g:if>
                <g:else>
                  <button name="seguir" value="Seguir" class="btn btn-small btn-success"><g:img dir="img" file="glyphicons_006_user_add_1.png" width="18" height="14"/> Seguir </button>          
                </g:else>
              </g:if>
            </g:form>
          </div>
        </div>

      </div>


      <!---- --------------------------->
      <div id="bookmarkModal" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
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
                <a href="#" class="btn btn-large" data-dismiss="modal" >Close</a>  
              </div>

            </fieldset>
          </g:form>

        </div>  
      </div>


      <div class="row-fluid">

        <h4>Favoritos:</h4>
        <hr>      

        <g:each in="${timelineList}" status="i" var="bookmarkInstance">

          <g:if test="${!bookmarkInstance.visibility}">

            <div class="favorito">

              <div class="row-fluid">

                <div class="span1">
                  <avatar:gravatar email="${bookmarkInstance.user.email}" alt="${bookmarkInstance.user.username}"  cssClass="img-rounded" size="42" defaultGravatarUrl="mm" />
                </div>

                <div class="span11" id="dispose">

                  <a href="${request.contextPath}/${bookmarkInstance.user.username}">
                    <font color="black"><h5 style="margin-top: 0; margin-bottom: 0px;">${bookmarkInstance.user.username}</h5></font>
                  </a>

                  <a href="${request.contextPath}/bookmark/update?id=${bookmarkInstance?.id}"  onclick="return false;" class="btn btn-link openBookmark" style="margin-bottom: 0px; margin-top: 0px; padding: 0px;">
                    <font color="black"><h6 style="margin-bottom: 0">${fieldValue(bean: bookmarkInstance, field: "title")}</h6></font>
                  </a><br>


                  <small><a href="${fieldValue(bean: bookmarkInstance, field: "urlShorten")}">${fieldValue(bean: bookmarkInstance, field: "urlShorten")}</a></small>        
                  <p>${fieldValue(bean: bookmarkInstance, field: "description")}</p>

                  <div class="row-fluid">
                    <g:each in="${bookmarkInstance.tags}">
                      <span class="label label-info">#${it.text}</span>
                    </g:each>
                  </div>

                </div>            
              </div>  

              <div class="row-fluid">
                <div class="span6">              
                  <div id="commentModal" class="modal hide fade in">  
                    <div class="modal-header">  
                      <a class="close" data-dismiss="modal">×</a>  
                      <h3>Adicione seu novo comentario</h3>  
                    </div>  

                    <div class="modal-body"> 

                    </div> 
                    <div class="modal-footer">

                    </div>
                  </div>

                  <i class="icon-edit"></i><a href="${request.contextPath}/comment/list?id=${bookmarkInstance?.id}" onclick="return false;" data-toggle="modal" class="btn btn-link openComment">Comentários</a>

                </div>

                <div class="acoes" style="display: none;">
                  <div class="span2">
                    <g:if test="${user.id == bookmarkInstance.user.id}">  

                      <i class="icon-trash"></i><a href="${request.contextPath}/bookmark/delete?id=${bookmarkInstance?.id}" class="btn btn-link" onclick="return confirm('Você tem certeza?');">Excluir</a>

                    </g:if>
                  </div>
                  <div class="span2">
                    <g:if test="${user.id == bookmarkInstance.user.id}">  

                      <i class="icon-edit"></i><a href="${request.contextPath}/bookmark/edit?id=${bookmarkInstance?.id}" class="btn btn-link openBookmark">Editar</a>

                    </g:if>
                  </div>
                  <div class="span2">
                    <g:if test="${user.username != bookmarkInstance.user.username}">

                      <i class="icon-ok"></i><a href="${request.contextPath}/bookmark/favoritar?id=${bookmarkInstance?.id}"  onclick="return false;" class="btn btn-link openBookmark">Favoritar</a>

                    </g:if>
                  </div>

                </div> 
              </div> 

            </div>

            <hr style="margin-top: 0px;">
          </g:if>
          <g:else>

          </g:else>
        </g:each>
      </div>
    </div>
  </div>



  <script>
$(document).ready(function(){
  $("div.favorito").hover(
    function(){
      $(this).find("div.acoes").show();
    },
    function(){
      $(this).find("div.acoes").hide();
    }
    );

  $("#tags").tagsInput({
    'defaultText':'Adicione tags',
    'height':'100px',
    'width':'215px',
    'placeholderColor' :'#B8B8B8'
  });

  $('#openBookmarkModal').click(function() {
    var url =  $("#bookmarkUrl").val();

    $.getJSON('${request.contextPath}/bookmark/preview', {url: url} , function(data){
      $("#url").val(data.url);     
      $("#title").val(data.title); 
    }); 
    
    $('#bookmarkModal').modal();

  });
  
  function loadData(){
    var url = $(this).attr("href");
    $.get(url, {}, function (data){
      $("#id").val(data.id);
      $("#title").val(data.title);
      $("#url").val(data.url);
      $("#description").val(data.description);
//      $("#tags").val(data.tags);
//      $("#tags").importTags(data.tags.toString());

      $('#bookmarkModal').modal();
    });
  }

  $('.openBookmark').on('click', loadData);

   function createComment() {
var url = $(this).attr("href");

$('#commentModal .modal-body').load(url);
$('#commentModal').modal();
}

$('.openComment').on('click', createComment);
})
</script>
</body>

</html>