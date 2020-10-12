# instactical-sandstorm-server
Insurgency: Sandstorm Server Configuration Files

Files and Bash scripts that will help run a dedicated Insurgency: Sandstorm community server

#### Start Server
Run with ./server <start|stop|restart>
* Will automatically check if players are in game if user attempts to stop or restart a server
* Can detect if graceful server stop fails and will attempt a force stop (killall command)
* Copies necessary files from a consolidated folder to appropriate directories for easy server config edits without having to navigate to different nested folders

#### Auto restart
Run with ./autoRestart
* Checks if the server if already running, if the API for checking number of players is working, and then restarts server if it is empty

#### Cron jobs
Copy and paste into cron file ('crontab -e' in terminal)
* Clear server status log files, run autoRestart and server checks periodically

#### Bug Test RCON
* A Bash script to test whether New World Interactive fixed the zombie threads that are never destroyed when using RCON
* Server times out at about 900 RCON uses
