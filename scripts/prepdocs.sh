 #!/bin/sh

. ./scripts/load_python_env.sh

# Create a log file in the persistent storage
mkdir -p /mnt/fileshare/logs
LOG_FILE="/mnt/fileshare/logs/prepdocs.log"

# Log the start of the script
echo "Starting prepdocs.sh script..." >> $LOG_FILE
echo "Starting prepdocs.sh script..."

# Check if the script is running
echo "Current working directory: $(pwd)" >> $LOG_FILE
echo "Current working directory: $(pwd)"

# Log the files in the current directory
echo "Files in current directory:" >> $LOG_FILE
ls >> $LOG_FILE 2>&1
echo "Files in current directory:"
ls

echo 'Running "prepdocs.py"'

AZURE_USE_AUTHENTICATION=$(azd env get-value AZURE_PUBLIC_NETWORK_ACCESS)
AZURE_PUBLIC_NETWORK_ACCESS=$(azd env get-value AZURE_PUBLIC_NETWORK_ACCESS)

if [ -n "$AZURE_USE_AUTHENTICATION" ] && [ "$AZURE_PUBLIC_NETWORK_ACCESS" = "Disabled" ]; then
  echo "AZURE_PUBLIC_NETWORK_ACCESS is set to Disabled. Exiting."
  exit 0
fi

additionalArgs=""
if [ $# -gt 0 ]; then
  additionalArgs="$@"
fi

./.venv/bin/python ./app/backend/prepdocs.py './data/*' --verbose $additionalArgs
