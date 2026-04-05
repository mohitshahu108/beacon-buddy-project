# Beacon Buddy AI Development Context

## Project Overview
**Type**: Mobile-first social activity coordination platform
**Architecture**: React Native (frontend) + Rails API (backend)
**Deployment**: Separate frontend/backend flows

## AI Development Guidelines

### Frontend (React Native + Expo)
- **Framework**: React Native 0.81 + Expo Router 6.0
- **State Management**: Zustand for global state
- **Styling**: TailwindCSS + custom components
- **Navigation**: Expo Router file-based routing
- **Deployment**: Expo EAS (Application Services)

### Backend (Rails API)
- **Framework**: Rails 8.1 API-only
- **Database**: PostgreSQL + PostGIS
- **Authentication**: JWT tokens + Google OAuth
- **API Style**: JSON:API specification
- **Deployment**: Docker + Rails server

### AI Coding Patterns
- **Component Structure**: Follow existing component patterns
- **API Integration**: Use existing service patterns
- **Error Handling**: Consistent error boundaries
- **Testing**: Jest + React Testing Library (frontend), RSpec (backend)

### Key Architectural Decisions
- **Separate Deployments**: Frontend and backend deploy independently
- **Shared Types**: API contracts in `docs/api/` directory
- **Local Development**: Docker Compose for full stack
- **AI Context**: All AI prompts reference this document

## AI Prompt Engineering
When working with AI assistants, always include:
1. This project context
2. Specific component/service patterns
3. Deployment considerations
4. Testing requirements
