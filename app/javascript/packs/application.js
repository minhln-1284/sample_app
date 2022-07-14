// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("bootstrap")

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

window.jQuery = window.$ = require('jquery')

var Turbolinks = require("turbolinks");
Turbolinks.start();

import I18n from 'i18n-js'
window.I18n = I18n


$(function(){
  $('#micropost_image').bind('change', function() {
    var size_in_megabytes = this.files[0].size/1024/1024;
    if (size_in_megabytes > 5) {
      alert(I18n.t("js.maximum_size"));
    }
  });
});
