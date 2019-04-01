$(document).on('turbolinks:load', function() {
    // when a post is clicked, show its full content in a modal window
    $("body").on( "click", ".single-post-card, .post-list", function() {
      var post_img = $(this).find('.post-content img').attr('src');
      var posted_by = $(this).find('.post-content .posted-by').html();
      var post_heading = $(this).find('.post-content h3').html();
      var interested = $(this).find('.post-content .interested').attr('href');

      $('.modal-header .posted-by').text(posted_by);
      $('.loaded-data img').attr('src', post_img);
      $('.loaded-data h3').text(post_heading);
      $('.loaded-data .interested a').attr('href', interested);
      $('.myModal').modal('show');
    });
  });