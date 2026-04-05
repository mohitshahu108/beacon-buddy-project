#!/bin/bash

# Beacon Buddy Development Script

echo "🚀 Starting Beacon Buddy Development Environment..."

# Start backend services
echo "🔧 Starting backend services..."
docker-compose up -d postgres redis

# Wait for databases to be ready
echo "⏳ Waiting for databases..."
sleep 5

# Start backend
echo "🔧 Starting Rails API..."
cd beacon-buddy-api
bundle install
bundle exec rails db:create db:migrate
bundle exec rails s -d &
BACKEND_PID=$!

# Start frontend
echo "📱 Starting React Native frontend..."
cd ../beacon-buddy-frontend
npm install
npm start &
FRONTEND_PID=$!

echo "✅ Development environment started!"
echo "🔧 Backend API: http://localhost:3000"
echo "📱 Frontend: Run 'npm run ios' or 'npm run android' in another terminal"

# Cleanup function
cleanup() {
    echo "🛑 Stopping services..."
    kill $BACKEND_PID $FRONTEND_PID 2>/dev/null
    docker-compose down
    echo "✅ All services stopped"
}

trap cleanup EXIT

# Wait for user input
echo "Press Ctrl+C to stop all services..."
wait
