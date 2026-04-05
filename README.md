# Beacon Buddy

Universal activity coordination platform for spontaneous social connections.

## Overview

Beacon Buddy helps people create and discover local activities instantly. Whether you want to grab coffee, play sports, or find movie buddies, Beacon Buddy connects you with nearby people who share your interests.

## Architecture

- **Frontend**: React Native + Expo SDK 55 + TypeScript
- **Backend**: Rails API + PostgreSQL + Redis
- **Authentication**: Google OAuth 2.0 with JWT tokens
- **Real-time**: Action Cable for WebSocket connections
- **Geolocation**: PostGIS for location-based queries

## Project Structure

```
beacon-buddy/
├── frontend/          # React Native app
│   ├── src/
│   │   ├── app/       # Expo Router navigation
│   │   └── features/  # Feature-based organization
│   ├── package.json
│   └── app.config.ts
├── backend/           # Rails API
│   ├── app/
│   │   ├── models/
│   │   ├── controllers/
│   │   ├── services/
│   │   └── serializers/
│   ├── config/
│   └── db/migrate/
└── README.md
```

## Getting Started

### Prerequisites

- Node.js 18+
- Ruby 3.2+
- PostgreSQL with PostGIS extension
- Redis

### Frontend Setup

```bash
cd beacon-buddy-frontend
npm install
npx expo start
```

### Backend Setup

```bash
cd beacon-buddy-api
bundle install
rails db:create db:migrate
rails s
```

### Environment Variables

Create `.env` files in both frontend and backend directories:

**Backend (.env)**
```
DATABASE_URL=postgresql://localhost/beacon_buddy_api_development
REDIS_URL=redis://localhost:6379
GOOGLE_OAUTH_CLIENT_ID=your_google_client_id
GOOGLE_OAUTH_CLIENT_SECRET=your_google_client_secret
JWT_SECRET_KEY=your_jwt_secret
```

## Features

### Core Functionality

- **Google Authentication**: One-tap sign up with Google accounts
- **Beacon Discovery**: Location-based activity browsing
- **Quick Creation**: Instant beacon creation with details
- **Real-time Updates**: Live participant tracking
- **Reliability System**: Trust-based community scoring

### Activity Categories

- Food & Coffee
- Sports & Recreation  
- Entertainment & Movies
- Music & Events
- Parks & Outdoors
- Custom Activities

## API Endpoints

### Authentication
- `POST /api/v1/auth/google` - Google OAuth login
- `POST /api/v1/auth/refresh` - JWT token refresh
- `POST /api/v1/auth/logout` - Logout

### Beacons
- `GET /api/v1/beacons` - List nearby beacons
- `POST /api/v1/beacons` - Create new beacon
- `GET /api/v1/beacons/:id` - Get beacon details
- `POST /api/v1/beacons/:id/join` - Join beacon

### Users
- `GET /api/v1/users/profile` - Get user profile
- `PUT /api/v1/users/profile` - Update profile

## Development

### Running Tests

**Frontend**
```bash
npm test
```

**Backend**
```bash
rails test
```

### Code Style

- TypeScript for frontend
- Ruby for backend
- Follow existing naming conventions
- Use feature-based organization

## Deployment

### Frontend
```bash
npx expo build:android
npx expo build:ios
```

### Backend
```bash
rails assets:precompile
rails db:migrate RAILS_ENV=production
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

## License

MIT License - see LICENSE file for details

## Contact

- Project Lead: Mohit Shahu
- Location: Nagpur, India
- Target Market: Local activity coordination
