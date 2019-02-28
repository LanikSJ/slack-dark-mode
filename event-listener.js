document.addEventListener('DOMContentLoaded', function() {
  const fs = require('fs');
  const filePath = '/Applications/Slack.app/Contents/Resources/dark-theme.css';
  const tt__customCss = '.menu ul li a:not(.inline_menu_link) {color: #fff !important;}'
  fs.readFile(filePath, {encoding: 'utf-8'}, function(err, css) {
    if (!err) {
      \$('<style></style>').appendTo('head').html(css + tt__customCss);
      \$('<style></style>').appendTo('head').html('#reply_container.upload_in_threads .inline_message_input_container {background: padding-box #545454}');
      \$('<style></style>').appendTo('head').html('.p-channel_sidebar {background: #363636 !important}');
      \$('<style></style>').appendTo('head').html('#client_body:not(.onboarding):not(.feature_global_nav_layout):before {background: inherit;}');
    }
  });
});
