// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function () {

    var frmMovie = $("#frm-movie");
    frmMovie.on('click', '.btn-remove-cast', function (evt) {
        evt.preventDefault();
        $(this).prev("input[type=hidden]").val("1");
        $(this).closest(".cast").hide();
    });
    frmMovie.on('click', '.btn-remove-team', function (evt) {
        evt.preventDefault();
        $(this).prev("input[type=hidden]").val("1");
        $(this).closest(".team").hide();
    });
    frmMovie.on('click', '.btn-add-cast', function (evt) {
        evt.preventDefault();
        $(".casts").append("<div class='cast'>" + $(this).attr('data-fields') + "</div>");
    });
    frmMovie.on('click', '.btn-add-team', function (evt) {
        evt.preventDefault();
        $(".teams").append("<div class='team'>" + $(this).attr('data-fields') + "</div>");
    });
});