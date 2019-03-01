document.addEventListener('DOMContentLoaded', function() {
  const fs = require('fs');
  const filePath = '/Applications/Slack.app/Contents/Resources/dark-theme.css';
  const tt__customCss = '.menu ul li a:not(.inline_menu_link) {color: #fff !important;}'
  fs.readFile(filePath, {
    encoding: 'utf-8'
  }, function(err, css) {
    if (!err) {
      $("<style></style>").appendTo('head').html(css + tt__customCss);
      $("<style></style>").appendTo('head').html('.p-threads_footer__input--legacy .p-message_input_field {background: padding-box #545454}');
      $("<style></style>").appendTo('head').html('.p-threads_footer__input--legacy .p-message_input_file_button {background: padding-box #545454}');
      $("<style></style>").appendTo('head').html('.p-threads_footer__input--legacy .p-message_input_field .ql-placeholder {color: #e6e6e6}');
      $("<style></style>").appendTo('head').html('.p-threads_footer__input .p-message_input_field.focus~.p-message_input_file_button:not(:hover) {color: #949494}');
      $("<style></style>").appendTo('head').html('.c-texty_input.focus .c-texty_input__button {color: #949494}');
      $("<style></style>").appendTo('head').html('.p-channel_sidebar {background: #363636 !important}');
      $("<style></style>").appendTo('head').html('#client_body:not(.onboarding):not(.feature_global_nav_layout):before {background: inherit;}');
    }
  });
});
