# Use the base image specified in devcontainer.json
FROM mcr.microsoft.com/devcontainers/python:3.11

# Install Node.js and Azure CLI
RUN apt-get update && apt-get install -y \
    curl \
    && curl -sL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g azure-cli

# Install Azure Dev CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Set working directory
WORKDIR /app

# Copy your project files (if any)
COPY . .

# Ensure the script is executable
RUN chmod +x ./scripts/prepdocs.sh

# Ensure the logs directory exists
RUN mkdir -p /mnt/fileshare/logs

# Ensure correct permission
RUN chown -R vscode:vscode /mnt/fileshare/logs

# Install any dependencies (if you have a requirements.txt for Python)
RUN pip install --no-cache-dir -r requirements.txt

# Log successful build
RUN echo "Docker image built successfully" > /mnt/fileshare/logs/prepdocs.log

# Expose the port you specified in forwardPorts
EXPOSE 50505

# Set the default user
USER vscode

# Set the default command to run the script
CMD ["./scripts/prepdocs.sh"]
