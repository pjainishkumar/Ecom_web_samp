import 'bootstrap'
import '../stylesheets/application'
//= require rails-ujs
//= require turbolinks
//= require_tree .
mport Rails from "@rails/ujs"
Rails.start()


$(document).on('turbolinks:load', function() {
  setTimeout(function() {
    $('.alert').fadeOut('slow', function() {
      $(this).remove();
    });
  }, 3000); // Adjust the time as needed
});