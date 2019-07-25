
document.addEventListener('DOMContentLoaded', function() {
  const fs = require('fs');
  const filePath = "SLACK_DARK_THEME_PATH";
  fs.readFile(filePath, {
    encoding: 'utf-8'
  }, function(err, css) {
      if (!err) {
          var styleEl = document.createElement("style");
          styleEl.innerHTML = css;
          document.querySelector("head").append(styleEl);
    }
  });
});
