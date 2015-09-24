var tty = require('tty.js');

var app = tty.createServer({
  shell: 'bash',
  users: {
    admin: 'PASSWORD'
  },
  port: 8080
});

app.listen();
