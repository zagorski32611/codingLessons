// project site: https://sheltered-castle-98941.herokuapp.com/ | https://git.heroku.com/sheltered-castle-98941.git



// this is the main JS page

'use strict';
var electron = require('electron');
var app = electron.app;
var BrowserWindow = electron.BrowserWindow;

var mainWindow = null;

app.on('ready', function() {
    mainWindow = new BrowserWindow({
        height: 600,
        width: 800
    });

    mainWindow.loadURL('file://' + __dirname + '/index.html');
});
