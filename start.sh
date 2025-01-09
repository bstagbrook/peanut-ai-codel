
#!/bin/bash

# Check if GROQ_API_KEY is set
if [ -z "$GROQ_API_KEY" ]; then
    echo "Error: GROQ_API_KEY environment variable is not set"
    exit 1
fi

# Export required environment variables
export GROQ_API_KEY=$GROQ_API_KEY
export GROQ_MODEL=${GROQ_MODEL:-"mixtral-8x7b-32768"}
export PORT=${PORT:-3000}

# Start the application
docker run -e GROQ_API_KEY=$GROQ_API_KEY \
          -e GROQ_MODEL=$GROQ_MODEL \
          -e PORT=$PORT \
          -p $PORT:8080 \
          ghcr.io/semanser/codel:latest
