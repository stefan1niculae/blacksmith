﻿// Generated by IcedCoffeeScript 108.0.9
(function() {
  this.addComment = function() {
    var content, form;
    form = $("#new-comment-form");
    content = form.find("input[type='text']").val();
    if (content === "") {
      return;
    }
    return $.get("" + window.location.href + "&new-comm=" + content, function(data) {
      $(data).find("#comments-list .comment:last").css("display", "none").appendTo($("#comments-list")).slideDown("fast");
      return console.log("done posting comment " + content);
    });
  };

  this.deleteComment = function() {
    var comment, id;
    comment = $(event.currentTarget).parent(".comment");
    id = comment.attr("db-id");
    return $.ajax({
      url: "" + window.location.href + "&del-comm=" + id
    }).done(function() {
      comment.slideUp("fast");
      return console.log("done deleting comment with id " + id + " at " + window.location.href + "&del-comm=" + id);
    });
  };

}).call(this);

//# sourceMappingURL=AddDeleteComment.js.map