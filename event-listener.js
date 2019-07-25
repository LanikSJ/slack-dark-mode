
document.addEventListener('DOMContentLoaded', function() {
  const fs = require('fs');
  const filePath = "SLACK_DARK_THEME_PATH";
  const tt__customCss = '.menu ul li a:not(.inline_menu_link) {color: #fff !important;}'
  fs.readFile(filePath, {
    encoding: 'utf-8'
  }, function(err, css) {
    if (!err) {
      const head = document.getElementsByTagName('head')[0];
      const style = document.createElement('style');
      style.innerHTML = css + tt__customCss;

      head.appendChild(style);
    }
  });
});
