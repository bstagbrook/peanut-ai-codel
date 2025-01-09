
#!/bin/bash

# Export environment variables
export GROQ_API_KEY=${GROQ_API_KEY:-""}
export GROQ_MODEL=${GROQ_MODEL:-"mixtral-8x7b-32768"}
export PORT=${PORT:-3000}

# Install dependencies
cd frontend && yarn install
cd ../backend && go mod download

# Run the backend in the background
cd ../backend && go run main.go &

# Run the frontend
cd ../frontend && yarn dev --host 0.0.0.0 --port $PORT
