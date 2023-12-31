#!/bin/bash

# Path to the marker file
MARKER_FILE="/.first-run-complete"

cd /app

# Check if the marker file exists
if [ ! -f "$MARKER_FILE" ]; then
    # The marker file doesn't exist, so this is the first run

    # Your commands go here
    echo "Running first-time setup..."

    pip install --no-cache-dir -r requirements.txt

    apt-get purge -y \
        gcc \
        && apt-get autoremove -y

    # Create the marker file to indicate first run is complete
    touch "$MARKER_FILE"
else
    echo "This is not the first run. Skipping setup..."
fi

# Continue with the rest of your script
python $APP