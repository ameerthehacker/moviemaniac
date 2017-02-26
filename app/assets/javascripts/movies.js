// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function () {
    $('#frm-new-movie').on('click', '.btn-remove-cast', function (evt) {
        evt.preventDefault();
        $(this).prev("input[type=hidden]").val("1");
        $(this).closest(".cast").hide();
    });
    $('#frm-new-movie').on('click', '.btn-remove-team', function (evt) {
        evt.preventDefault();
        $(this).prev("input[type=hidden]").val("1");
        $(this).closest(".team").hide();
    });
});