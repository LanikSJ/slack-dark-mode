document.addEventListener('DOMContentLoaded', function() {
  const fs = require('fs');
  const filePath = 'SLACK_DARK_THEME_PATH';
  const tt__customCss = '.menu ul li a:not(.inline_menu_link) {color: #fff !important;}'
  fs.readFile(filePath, {
    encoding: 'utf-8'
  }, function(err, css) {
    if (!err) {
      $("<style></style>").appendTo('head').html(css + tt__customCss);
    }
  });
});
