# instactical-sandstorm-server

Files and Bash scripts that help run the [insTactical](http://info.insTactical.com), an Insurgency: Sandstorm Dedicated server, with [SISSM](https://github.com/schroeder-lvb/sissm "Simple Insurgency Sandstorm Server Manager")

Note: The restart script should be in the scripts folder, otherwise SISSM will not restart properly.

Follow the instructions to install the server and SISSM outlined in the `instructions.txt` file

Additional information can be found in the [server guide at mod.io](https://insurgencysandstorm.mod.io/guides/server-admin-guide)

#### Start Server Screen Session
```
./server <[start|stop|restart|status|update]>
```

#### Start SISSM Screen Session
```
./sissm <[start|stop|restart|status]>
```

## Session Usage
#### List All Sessions
```
screen -ls
```

#### View a Current Session
```
screen -r <session-name>
```

#### Detach (Not terminate) from a Session
<kbd>CTRL</kbd>+<kbd>A</kbd>&nbsp;&nbsp;&nbsp;<kbd>D</kbd>
