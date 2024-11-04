# Hak5 Cloud C2 Server Starter Script

## Overview
This project provides an easy-to-use shell script for starting the Hak5 Cloud C2 Server with the flexibility of configuration through an external file. The script uses `tmux` to run the server in a persistent session, allowing for easy management and reconnection.

Hak5 Cloud C² simplifies deployment and management for penetration testers and IT security teams, enabling control of Hak5 devices from a central cloud dashboard.

**Documentation:** [Hak5 Cloud C2 Docs](https://docs.hak5.org/cloud-c2)

**Repository:** [GitHub - hak5-c2-startup](https://github.com/webdevtodayjason/hak5-c2-startup.git)

## Features
- Starts the Hak5 Cloud C2 Server in a dedicated `tmux` session.
- Reads configuration parameters from an external `c2_server_config.conf` file.
- Supports optional SSL configuration with a simple switch.
- Provides instructions for reconnecting to the `tmux` session.

## Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/webdevtodayjason/hak5-c2-startup.git
   cd hak5-c2-startup
   ```
2. Make the script executable:
   ```bash
   chmod +x start_c2_server.sh
   ```
3. Create a configuration file named `c2_server_config.conf` in the same directory.

## Configuration
Create a `c2_server_config.conf` file with the following content:

```bash
# Configuration file for starting the Hak5 Cloud C2 Server

# Hostname (if applicable)
HOSTNAME=c2.YOURDOMAIN.COM

# SSL flag (Y for SSL, N for no SSL)
SSL=Y
```

## Usage
Run the script with:
```bash
./start_c2_server.sh
```

### Reconnecting to the Session
To attach to the running `tmux` session, use:
```bash
tmux attach-session -t c2_server_session
```

To detach from the session while keeping it running, press:
```
Ctrl + b, then d
```

## License
This project is open-source and available under the [MIT License](LICENSE).

## Contributing
Feel free to open issues or submit pull requests for any improvements or fixes.


