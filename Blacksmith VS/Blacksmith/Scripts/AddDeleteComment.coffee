﻿# CoffeeScript

@addComment = () ->
  form = $ "#new-comment-form"
  content = form.find("input[type='text']").val()
  
  if content is "" 
    return
    
  $.get "#{window.location.href}&new-comm=#{content}", (data) ->
    $(data).find "#comments-list .comment:last"
      .css "display", "none"
      .appendTo $ "#comments-list"
      .slideDown("fast")
      
    console.log "done posting comment #{content}"
    
@deleteComment = () ->
  comment = $(event.currentTarget).parent(".comment")
  id = comment.attr "db-id"
  $.ajax url: "#{window.location.href}&del-comm=#{id}"
    .done ->
      comment.slideUp("fast")
      console.log "done deleting comment with id #{id} at #{window.location.href}&del-comm=#{id}"