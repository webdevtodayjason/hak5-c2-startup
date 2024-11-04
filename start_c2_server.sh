#!/bin/bash

# Load configuration from config file
CONFIG_FILE="./c2_server_config.conf"
if [ -f "$CONFIG_FILE" ]; then
  source "$CONFIG_FILE"
else
  echo "Configuration file $CONFIG_FILE not found. Please create it with the necessary settings."
  exit 1
fi

# Set hostname and SSL flag from config
hostname_option=""
ssl_option=""

if [ -n "$HOSTNAME" ]; then
  hostname_option="-hostname $HOSTNAME"
fi

if [ "$SSL" == "Y" ]; then
  ssl_option="-https"
fi

# Session name for tmux
tmux_session="c2_server_session"

# Command to run the server
server_command="sudo ./c2-3.4.0_amd64_linux $hostname_option $ssl_option"

# Check if tmux session already exists
tmux has-session -t $tmux_session 2>/dev/null

if [ $? != 0 ]; then
  # Create a new tmux session and run the command
  tmux new-session -d -s $tmux_session "$server_command"
  echo "Server started in new tmux session: $tmux_session"
else
  echo "Tmux session $tmux_session already exists. Attaching to it."
fi

# Display information on reconnecting
cat << EOF
To attach to the session, use:
  tmux attach-session -t $tmux_session

To detach from the session (while keeping it running), press:
  Ctrl + b, then d
EOF

