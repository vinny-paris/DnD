webPage = require('webpage');
var page = webPage.create();

var fs = require('fs');
var path = 'techstars.html'

page.open('http://whothefuckismydndcharacter.com', function (status) {
  var content = page.content;
  fs.write(path,content,'w')
  phantom.exit();
});