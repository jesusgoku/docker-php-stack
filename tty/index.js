var tty = require('tty.js');

var app = tty.createServer({
  shell: 'bash',
  users: {
    admin: 'PASSWORD'
  },
  https: {
    key: "./server.key",
    cert: "./server.crt"
  },
  port: 8080
});

app.listen();
