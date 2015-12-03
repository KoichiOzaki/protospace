function like_btn() {
  console.log("success");
  $('#like_btn').on('click', function() {
    var button = $(this);
    var img = $("#like_btn img")
    var like_count = $("#like_count")
    var id = $(this).attr('data-id');
    button.attr("disabled", true);
    if (button.hasClass("like_create")) {
      $.ajax({
        url: "/api/like/",
        type: "post",
        data: { prototype_id: id, dataType: "json" },
        success: function(json_data) {
          $("#like_btn img").attr("src", image_path("icon_redheart.svg"))
          button.removeClass('like_create');
          button.addClass('like_destroy');
          like_count.text(json_data.count);
        },
        error: function() {
            alert("Server Error. Pleasy try again later.");
        },
        complete: function() {
          button.prop("disabled", false);
        }
      });
    }else if (button.hasClass("like_destroy")) {
      $.ajax({
        url: "/api/like/",
        type: "delete",
        data: { prototype_id: id, dataType: "json" },
        success: function(json_data) {
          $("#like_btn img").attr("src", image_path("icon_heart.svg"))
          button.removeClass('like_destroy');
          button.addClass('like_create');
          like_count.text(json_data.count);
        },
        error: function() {
          alert("Server Error. Pleasy try again later.");
        },
        complete: function() {
        button.prop("disabled", false);
        }
      });
    }
  });
};

$(document).ready(like_btn)
$(document).on('page:load', like_btn)
