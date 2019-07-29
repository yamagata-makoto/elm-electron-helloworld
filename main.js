const electron = require('electron');
const app = electron.app;
const BrowserWindow = electron.BrowserWindow;

app.on('window-all-closed', function() {
    app.quit();
});

app.on('ready', function() {
    var server = require('child_process').spawn('python',['./server.py']);
    var indexURL = 'http://localhost:5000/';

    var startUp = function() {
        console.log('server started');

        let mainWindow = new BrowserWindow({ width: 400, height: 450 });
        mainWindow.loadURL(indexURL)

        mainWindow.on('closed', function() {
            electron.session.defaultSession.clearCache(() => {})
            server.kill('SIGINT');
        });
    };

    startUp();
});

