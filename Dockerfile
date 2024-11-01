# Use the lightweight Alpine Linux image
FROM alpine:latest

# Set the working directory (optional)
WORKDIR /app

# Create a simple shell script that does nothing
RUN echo '#!/bin/sh\nsleep 5\nexit 0' > sleep.sh && chmod +x sleep.sh

# Set the command to run the script
CMD ["./sleep.sh"]
