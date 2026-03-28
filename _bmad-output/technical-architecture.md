# Technical Architecture Document - Beacon Buddy

**Author:** Mohit_shahu  
**Date:** 2026-03-26  
**Version:** 1.0  

## Executive Summary

Beacon Buddy requires a hybrid mobile-SaaS architecture that supports real-time activity coordination, reliability scoring, and corporate B2B features. This document outlines the complete technical architecture for scaling from MVP (300 users) to growth stage (5,000+ users) while maintaining performance, security, and extensibility.

## System Architecture Overview

### High-Level Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   React Native  │    │   React Native  │    │  Web Dashboard  │
│    (iOS/Android)│    │    (iOS/Android)│    │   (Corporate)   │
└─────────┬───────┘    └─────────┬───────┘    └─────────┬───────┘
          │                      │                      │
          └──────────────────────┼──────────────────────┘
                                 │
                    ┌─────────────▼─────────────┐
                    │      Rails API Gateway     │
                    │   (Authentication + Core)  │
                    └─────────────┬─────────────┘
                                 │
          ┌──────────────────────┼──────────────────────┐
          │                      │                      │
┌─────────▼─────────┐  ┌─────────▼─────────┐  ┌─────────▼─────────┐
│   PostgreSQL      │  │   Redis Cache     │  │   Solid Queue    │
│   (Primary DB)    │  │   (Sessions)      │  │   (Background)   │
└───────────────────┘  └───────────────────┘  └───────────────────┘
```

### Component Separation

**Frontend Layer:**
- **React Native Mobile App**: Core user experience for activity seekers and creators
- **Web Dashboard**: Corporate B2B interface for admin and analytics
- **Shared Components**: Common UI elements and state management

**Backend Layer:**
- **Rails API Gateway**: Authentication, core business logic, and API orchestration
- **Service Layer**: Specialized services for complex business operations
- **Background Processing**: Async tasks for notifications and data processing

**Data Layer:**
- **PostgreSQL**: Primary relational database for structured data
- **Redis**: Session management, caching, and real-time features
- **Solid Queue**: Background job processing

## Technology Stack Decisions

### Frontend Technology Stack

**React Native (0.83.1)**
- **Rationale**: Cross-platform development reduces maintenance overhead
- **Benefits**: Single codebase, native performance, large ecosystem
- **Trade-offs**: Slightly larger app size compared to native

**Key Dependencies:**
```json
{
  "@react-native-google-signin/google-signin": "^16.1.1",
  "@react-navigation/native": "^6.1.9",
  "@reduxjs/toolkit": "^2.2.1",
  "react-redux": "^9.1.0",
  "react-native-maps": "^1.10.3",
  "react-native-geolocation-service": "^5.3.1",
  "@react-native-async-storage/async-storage": "^1.21.0",
  "react-native-push-notification": "^8.1.1",
  "socket.io-client": "^4.7.4"
}
```

### Backend Technology Stack

**Rails 8.1.1 with PostgreSQL**
- **Rationale**: Rapid development, strong conventions, excellent ecosystem
- **Benefits**: Mature framework, great for APIs, solid security foundation
- **Trade-offs**: Memory usage higher than lightweight alternatives

**Key Gems:**
```ruby
gem "rails", "~> 8.1.1"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "google-id-token"
gem "jwt"
gem "rack-cors"
gem "kaminari" # Pagination
gem "pg_search" # Full-text search
gem "paperclip" or "active_storage" # File uploads
gem "sidekiq" # Alternative background processing
```

## Database Schema Design

### Core Tables

**Users Table**
```sql
CREATE TABLE users (
  id BIGSERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  google_uid VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255),
  avatar_url TEXT,
  reliability_score INTEGER DEFAULT 750,
  phone VARCHAR(20),
  date_of_birth DATE,
  interests TEXT[], -- PostgreSQL array
  location_lat DECIMAL(10, 8),
  location_lng DECIMAL(11, 8),
  city VARCHAR(100),
  is_corporate BOOLEAN DEFAULT FALSE,
  corporate_id BIGINT,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
```

**Beacons Table**
```sql
CREATE TABLE beacons (
  id BIGSERIAL PRIMARY KEY,
  creator_id BIGINT REFERENCES users(id),
  title VARCHAR(255) NOT NULL,
  description TEXT,
  category INTEGER NOT NULL, -- enum
  beacon_type INTEGER NOT NULL, -- enum
  join_policy INTEGER NOT NULL, -- enum
  status INTEGER DEFAULT 0, -- enum
  event_time TIMESTAMP NOT NULL,
  location_lat DECIMAL(10, 8),
  location_lng DECIMAL(11, 8),
  location_name VARCHAR(255),
  max_participants INTEGER NOT NULL,
  current_participants INTEGER DEFAULT 0,
  age_restriction INTEGER,
  gender_restriction VARCHAR(10),
  hobby_filters TEXT[],
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
```

**Beacon Participants Table**
```sql
CREATE TABLE beacon_participants (
  id BIGSERIAL PRIMARY KEY,
  beacon_id BIGINT REFERENCES beacons(id),
  user_id BIGINT REFERENCES users(id),
  status INTEGER DEFAULT 0, -- enum: requested, joined, attended, no_show
  joined_at TIMESTAMP,
  attended_at TIMESTAMP,
  reliability_impact INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW(),
  UNIQUE(beacon_id, user_id)
);
```

**Reliability History Table**
```sql
CREATE TABLE reliability_histories (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT REFERENCES users(id),
  beacon_id BIGINT REFERENCES beacons(id),
  score_change INTEGER,
  previous_score INTEGER,
  new_score INTEGER,
  reason VARCHAR(255),
  created_at TIMESTAMP DEFAULT NOW()
);
```

## API Architecture

### RESTful API Design

**Authentication Endpoints**
```
POST /api/v1/auth/google          # Google OAuth
GET  /api/v1/auth/me               # Current user info
POST /api/v1/auth/refresh          # Refresh token
DELETE /api/v1/auth/signout        # Sign out
```

**Beacon Endpoints**
```
GET    /api/v1/beacons             # Index with filters
POST   /api/v1/beacons             # Create beacon
GET    /api/v1/beacons/:id         # Show beacon
PUT    /api/v1/beacons/:id         # Update beacon
DELETE /api/v1/beacons/:id         # Cancel beacon
POST   /api/v1/beacons/:id/join    # Join beacon
POST   /api/v1/beacons/:id/leave   # Leave beacon
```

**User Endpoints**
```
GET /api/v1/users/profile          # User profile
PUT /api/v1/users/profile          # Update profile
GET /api/v1/users/reliability      # Reliability score
GET /api/v1/users/history          # Activity history
```

**Real-time Endpoints (WebSocket)**
```
/ws/beacons/:id/chat              # Beacon chat room
/ws/beacons/updates               # Real-time beacon updates
/ws/notifications                 # Push notifications
```

### API Response Format

**Success Response**
```json
{
  "success": true,
  "data": {
    "id": 123,
    "title": "Movie Night",
    "creator": {
      "id": 456,
      "name": "John Doe",
      "reliability_score": 820
    }
  },
  "meta": {
    "pagination": {
      "current_page": 1,
      "total_pages": 5,
      "total_count": 50
    }
  }
}
```

**Error Response**
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid parameters",
    "details": {
      "event_time": ["can't be in the past"]
    }
  }
}
```

## Security Architecture

### Authentication & Authorization

**JWT Token Strategy**
```ruby
class AuthToken
  def self.encode(user_id)
    JWT.encode({
      user_id: user_id,
      exp: 24.hours.from_now.to_i,
      iat: Time.now.to_i
    }, Rails.application.credentials.jwt_secret)
  end
  
  def self.decode(token)
    JWT.decode(token, Rails.application.credentials.jwt_secret)[0]
  end
end
```

**Role-Based Access Control**
```ruby
class Ability
  include CanCan::Ability
  
  def initialize(user)
    can [:read, :create], Beacon
    can [:update, :destroy], Beacon, creator_id: user.id
    
    if user.corporate_admin?
      can :manage, Beacon, creator: { corporate_id: user.corporate_id }
    end
  end
end
```

### Data Protection

**Encryption at Rest**
- Database encryption using PostgreSQL pgcrypto
- Sensitive fields (phone, email) encrypted
- File storage encrypted (AWS S3 with SSE)

**Encryption in Transit**
- TLS 1.3 for all API communication
- Certificate pinning in mobile app
- Secure WebSocket connections (WSS)

### Privacy Controls

**Location Privacy**
```ruby
class LocationPrivacy
  def self.share_location?(user, beacon)
    return false unless user.location_sharing_enabled?
    return true if beacon.join_policy == 'open'
    return true if beacon.creator_id == user.id
    false
  end
end
```

## Performance & Scalability

### Caching Strategy

**Redis Caching Layers**
```
1. Session Cache (30 min TTL)
   - User authentication tokens
   - Temporary session data

2. Beacon Cache (15 min TTL)
   - Active beacon listings
   - Location-based queries

3. User Cache (1 hour TTL)
   - User profiles
   - Reliability scores
```

**Database Optimization**
```sql
-- Indexes for performance
CREATE INDEX idx_beacons_location ON beacons (location_lat, location_lng);
CREATE INDEX idx_beacons_event_time ON beacons (event_time);
CREATE INDEX idx_beacons_status ON beacons (status);
CREATE INDEX idx_beacon_participants_user ON beacon_participants (user_id);
CREATE INDEX idx_beacon_participants_beacon ON beacon_participants (beacon_id);
```

### Load Balancing

**Horizontal Scaling Strategy**
```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Load       │    │   Rails     │    │   Rails     │
│  Balancer    │────│  Server 1   │────│  Server 2   │
│  (Nginx)     │    │             │    │             │
└─────────────┘    └─────────────┘    └─────────────┘
```

**Database Replication**
- Primary database for writes
- Read replicas for beacon discovery
- Connection pooling with PgBouncer

## Real-time Features Architecture

### WebSocket Implementation

**Solid Cable Configuration**
```ruby
# config/cable.yml
production:
  adapter: solid_cable
  connects_to:
    database:
      writing: cable
```

**Chat Room Management**
```ruby
class BeaconChannel < ApplicationCable::Channel
  def subscribed
    beacon = Beacon.find(params[:id])
    stream_for beacon
  end
  
  def speak(data)
    message = Message.create!(
      beacon_id: params[:id],
      user_id: current_user.id,
      content: data['message']
    )
    broadcast_to beacon, message: render_message(message)
  end
end
```

### Push Notifications

**Notification Architecture**
```
Mobile App → Rails API → Solid Queue → FCM/APNS → Device
```

**Notification Types**
- Beacon invitations
- Join requests/approvals
- Event reminders (24h, 1h before)
- Reliability score changes
- Chat messages (when app in background)

## Mobile App Architecture

### State Management

**Redux Store Structure**
```javascript
{
  auth: {
    user: null,
    token: null,
    isAuthenticated: false
  },
  beacons: {
    list: [],
    current: null,
    loading: false,
    filters: {}
  },
  map: {
    region: {},
    userLocation: null,
    beacons: []
  },
  chat: {
    messages: {},
    activeRooms: []
  }
}
```

### Navigation Structure

```javascript
const StackNavigator = () => (
  <Stack.Navigator>
    <Stack.Screen name="Auth" component={AuthStack} />
    <Stack.Screen name="Main" component={MainTabNavigator} />
    <Stack.Screen name="BeaconDetail" component={BeaconDetailScreen} />
    <Stack.Screen name="CreateBeacon" component={CreateBeaconScreen} />
    <Stack.Screen name="Chat" component={ChatScreen} />
    <Stack.Screen name="Profile" component={ProfileScreen} />
  </Stack.Navigator>
);
```

### Key Components

**Beacon Feed Component**
```javascript
const BeaconFeed = () => {
  const dispatch = useDispatch();
  const { beacons, loading } = useSelector(state => state.beacons);
  
  useEffect(() => {
    dispatch(fetchBeacons());
  }, []);
  
  return (
    <FlatList
      data={beacons}
      renderItem={({ item }) => <BeaconCard beacon={item} />}
      onRefresh={() => dispatch(fetchBeacons())}
      refreshing={loading}
    />
  );
};
```

## Corporate B2B Architecture

### Multi-tenant Design

**Corporate Account Structure**
```ruby
class CorporateAccount < ApplicationRecord
  has_many :users, class_name: 'User', foreign_key: 'corporate_id'
  has_many :corporate_beacons, class_name: 'Beacon', through: :users
  
  # Tenant isolation
  def self.current
    RequestStore.store[:current_corporate]
  end
end
```

**Corporate Dashboard Features**
- Employee management
- Beacon analytics
- Reliability reporting
- Custom branding
- SSO integration

### API Extensions for Corporate

**Corporate Endpoints**
```
GET /api/v1/corporate/dashboard      # Dashboard metrics
GET /api/v1/corporate/employees       # Employee management
POST /api/v1/corporate/beacons        # Corporate beacon creation
GET /api/v1/corporate/analytics       # Usage analytics
```

## Deployment Architecture

### Container Strategy

**Docker Configuration**
```dockerfile
# Dockerfile
FROM ruby:3.3-alpine
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
```

**Kubernetes Deployment**
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: beacon-buddy-api
spec:
  replicas: 3
  selector:
    matchLabels:
      app: beacon-buddy-api
  template:
    metadata:
      labels:
        app: beacon-buddy-api
    spec:
      containers:
      - name: api
        image: beacon-buddy:latest
        ports:
        - containerPort: 3000
```

### CI/CD Pipeline

**GitHub Actions Workflow**
```yaml
name: Deploy
on:
  push:
    branches: [main]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run tests
        run: |
          bundle install
          rails test
  deploy:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - name: Deploy to production
        run: |
          kamal deploy
```

## Monitoring & Observability

### Application Monitoring

**Health Checks**
```ruby
class HealthController < ApplicationController
  def show
    render json: {
      status: "ok",
      timestamp: Time.current,
      version: Rails.application.config.version,
      database: ActiveRecord::Base.connection.active?,
      redis: Redis.current.ping
    }
  end
end
```

**Error Tracking**
- Sentry for error monitoring
- Log aggregation with ELK stack
- Performance monitoring with APM

### Metrics Collection

**Key Performance Indicators**
- API response times (< 2s)
- Database query performance (< 100ms)
- WebSocket latency (< 1s)
- Push notification delivery rate (> 95%)
- User engagement metrics

## Development Workflow

### Code Organization

**Rails Structure**
```
app/
├── controllers/
│   ├── api/v1/
│   └── concerns/
├── models/
│   └── concerns/
├── services/
│   ├── beacon_service.rb
│   ├── reliability_service.rb
│   └── notification_service.rb
├── jobs/
└── serializers/
```

**React Native Structure**
```
src/
├── components/
│   ├── common/
│   ├── beacon/
│   └── profile/
├── screens/
├── navigation/
├── services/
│   ├── api.js
│   └── websocket.js
├── store/
└── utils/
```

### Testing Strategy

**Rails Testing**
- RSpec for unit and integration tests
- Factory Bot for test data
- DatabaseCleaner for test isolation

**React Native Testing**
- Jest for unit tests
- React Native Testing Library for components
- Detox for E2E tests

## Migration Strategy

### Phase 1: MVP Foundation (Weeks 1-4)
1. **Authentication System**
   - Google OAuth integration
   - JWT token management
   - User profile creation

2. **Core Beacon Features**
   - Beacon CRUD operations
   - Basic join/leave functionality
   - Simple reliability scoring

3. **Mobile App Foundation**
   - Navigation structure
   - Authentication flow
   - Basic beacon feed

### Phase 2: Enhanced Features (Weeks 5-8)
1. **Real-time Communication**
   - WebSocket implementation
   - Ephemeral chat system
   - Push notifications

2. **Advanced Matching**
   - Location-based discovery
   - Filtering and search
   - Activity suggestions

3. **Corporate Features**
   - Multi-tenant architecture
   - Corporate dashboard
   - Employee management

### Phase 3: Scaling & Optimization (Weeks 9-12)
1. **Performance Optimization**
   - Caching implementation
   - Database optimization
   - Load balancing

2. **Advanced Features**
   - AI-powered suggestions
   - Booking integrations
   - Advanced analytics

## Risk Mitigation

### Technical Risks

**Real-time Performance**
- **Risk**: WebSocket connection issues under load
- **Mitigation**: Connection pooling, fallback to polling, load testing

**Database Performance**
- **Risk**: Slow queries as user base grows
- **Mitigation**: Proper indexing, read replicas, query optimization

**Mobile App Performance**
- **Risk**: Poor user experience on older devices
- **Mitigation**: Performance profiling, progressive loading, device testing

### Security Risks

**Data Privacy**
- **Risk**: Location data exposure
- **Mitigation**: Encryption, user consent, privacy controls

**Authentication Security**
- **Risk**: Token hijacking
- **Mitigation**: Short-lived tokens, refresh mechanism, device fingerprinting

## Future Considerations

### Scalability Planning

**Microservices Migration Path**
- Extract beacon matching service
- Separate notification service
- Independent analytics service

**Global Expansion**
- Multi-region deployment
- CDN integration
- Localized content delivery

### Technology Evolution

**AI/ML Integration**
- Recommendation engine
- Activity pattern analysis
- Reliability prediction

**Advanced Features**
- AR location sharing
- Voice commands
- Wearable integration

## Conclusion

This architecture provides a solid foundation for Beacon Buddy's MVP while supporting future growth. The modular design allows for incremental development and easy scaling. The technology choices balance development speed with performance and security requirements.

Key architectural decisions:
- **Hybrid mobile-SaaS approach** for maximum market reach
- **Rails + React Native** for rapid development
- **Real-time communication** for core user experience
- **Multi-tenant design** for B2B scalability
- **Performance-first approach** with caching and optimization

The architecture supports the phased development approach outlined in the PRD and provides clear migration paths for future enhancements.
