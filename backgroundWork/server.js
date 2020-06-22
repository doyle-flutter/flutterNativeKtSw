var app = require('express')(); 
var http = require('http').Server(app); 
var io = require('socket.io')(http); 

app.get('/:data', function(req, res){ 
    var data = req.params.data;
    console.log(`service ${data}`);
    res.json(true);
    return;
}); 


io.on('connection', function(socket){ 
    console.log("CONNECTION");
    socket.on('send_message', function(msg){ 
        console.log(msg)
        io.emit('receive_message', msg); }
    ); 
});

http.listen(3000, function(){ console.log('listening on *:3000'); });
