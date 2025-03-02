#!/bin/bash

# Define the server file
SERVER_FILE="/home/catchpoint/catchpoint-ci-cd-demo/backend/server.js"
PORT=3000

echo "Stopping any existing Node.js process on port $PORT..."

# Find and kill the process running on port 3000
PID=$(lsof -ti :$PORT)
if [ ! -z "$PID" ]; then
    kill -9 $PID
    echo "Process $PID stopped."
else
    echo "No process found on port $PORT."
fi

# Start the server with nohup
echo "Starting $SERVER_FILE with nohup..."
nohup node $SERVER_FILE > output.log 2>&1 &

# Wait a bit to ensure the process starts
sleep 2

# Verify if the server started
NEW_PID=$(lsof -ti :$PORT)
if [ ! -z "$NEW_PID" ]; then
    echo "Server started successfully with PID $NEW_PID"
else
    echo "Failed to start the server. Check output.log for errors."
fi

