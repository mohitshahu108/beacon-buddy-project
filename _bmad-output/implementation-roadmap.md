# Implementation Roadmap - Beacon Buddy

**Author:** Mohit_shahu  
**Date:** 2026-03-26  
**Timeline:** 12 Weeks (MVP → Growth Features)

## Sprint Planning Overview

### Phase 1: MVP Foundation (Weeks 1-4)
**Goal**: Core user journeys working in Nagpur market

### Phase 2: Enhanced Features (Weeks 5-8)
**Goal**: Real-time features and corporate functionality

### Phase 3: Scaling & Optimization (Weeks 9-12)
**Goal**: Performance optimization and advanced features

---

## Phase 1: MVP Foundation (Weeks 1-4)

### Week 1: Authentication & User Management

#### Backend Tasks
**Priority: High**

1. **Enhance User Model**
   ```bash
   rails generate migration AddReliabilityScoreToUsers reliability_score:integer default:750
   rails generate migration AddLocationFieldsToUsers location_lat:decimal location_lng:decimal city:string
   rails generate migration AddInterestsToUsers interests:text array:true
   ```

2. **Update Authentication Controller**
   - Add user profile creation on first login
   - Implement JWT refresh token mechanism
   - Add user profile endpoints

3. **Create User Profile API**
   ```
   GET /api/v1/users/profile
   PUT /api/v1/users/profile
   GET /api/v1/users/reliability
   ```

#### Frontend Tasks
**Priority: High**

1. **Install Navigation Dependencies**
   ```bash
   npm install @react-navigation/native @react-navigation/stack @react-navigation/bottom-tabs
   npm install react-native-screens react-native-safe-area-context
   ```

2. **Create Auth Flow**
   - Login screen with Google Sign-In
   - User profile setup screen
   - Token storage and refresh logic

3. **Redux Store Setup**
   ```bash
   npm install @reduxjs/toolkit react-redux
   ```

#### Deliverables
- [ ] User can authenticate with Google
- [ ] User profile created automatically
- [ ] JWT tokens managed properly
- [ ] Basic navigation structure

---

### Week 2: Core Beacon Functionality

#### Backend Tasks
**Priority: High**

1. **Enhance Beacon Model**
   ```bash
   rails generate migration AddLocationToBeacons location_lat:decimal location_lng:decimal location_name:string
   rails generate migration AddFiltersToBeacons age_restriction:integer gender_restriction:string hobby_filters:text array:true
   ```

2. **Update Beacon Controller**
   - Add location-based filtering
   - Implement search functionality
   - Add pagination with Kaminari

3. **Beacon Discovery API**
   ```
   GET /api/v1/beacons?lat=21.1463&lng=79.0849&radius=25&category=movie
   ```

#### Frontend Tasks
**Priority: High**

1. **Install Map Dependencies**
   ```bash
   npm install react-native-maps react-native-geolocation-service
   ```

2. **Create Beacon Screens**
   - Beacon feed screen
   - Beacon detail screen
   - Create beacon screen

3. **Location Services**
   - Request location permissions
   - Get current location
   - Location-based beacon filtering

#### Deliverables
- [ ] User can view nearby beacons
- [ ] User can create new beacons
- [ ] Location-based filtering works
- [ ] Map integration functional

---

### Week 3: Join System & Basic Reliability

#### Backend Tasks
**Priority: High**

1. **Enhance BeaconParticipant Model**
   ```bash
   rails generate migration AddReliabilityImpactToBeaconParticipants reliability_impact:integer default:0
   rails generate migration AddAttendanceTrackingToBeaconParticipants attended_at:timestamp status_change_reason:text
   ```

2. **Create Reliability Service**
   ```ruby
   # app/services/reliability_service.rb
   class ReliabilityService
     def self.update_score(user, beacon_participant, attended)
       # Score calculation logic
     end
   end
   ```

3. **Join/Leave API Endpoints**
   ```
   POST /api/v1/beacons/:id/join
   POST /api/v1/beacons/:id/leave
   POST /api/v1/beacons/:id/complete
   ```

#### Frontend Tasks
**Priority: High**

1. **Join Flow Screens**
   - Join beacon confirmation
   - My beacons screen
   - Beacon completion flow

2. **Reliability Score Display**
   - Show user reliability score
   - Display other users' scores
   - Score history visualization

#### Deliverables
- [ ] User can join beacons
- [ ] Basic reliability scoring works
- [ ] User can track joined beacons
- [ ] Beacon completion flow functional

---

### Week 4: Guest Mode & MVP Polish

#### Backend Tasks
**Priority: Medium**

1. **Guest Mode API**
   - Allow beacon browsing without authentication
   - Limited functionality for guest users
   - Guest-to-user conversion flow

2. **API Documentation**
   - OpenAPI/Swagger documentation
   - Postman collection
   - API rate limiting

#### Frontend Tasks
**Priority: Medium**

1. **Guest Mode UI**
   - Browse beacons without login
   - Limited functionality indicators
   - Prompt to sign up for full features

2. **UI/UX Polish**
   - Introvert-friendly design
   - Loading states
   - Error handling

3. **Testing Setup**
   ```bash
   npm install @testing-library/react-native jest
   ```

#### Deliverables
- [ ] Guest users can browse beacons
- [ ] Sign-up flow from guest mode
- [ ] MVP ready for Nagpur testing
- [ ] Basic test coverage

---

## Phase 2: Enhanced Features (Weeks 5-8)

### Week 5: Real-time Communication

#### Backend Tasks
**Priority: High**

1. **WebSocket Setup**
   ```ruby
   # config/cable.yml
   production:
     adapter: solid_cable
     connects_to:
       database:
         writing: cable
   ```

2. **Chat System**
   ```ruby
   rails generate model Message beacon:references user:references content:text created_at:timestamp
   ```

3. **Real-time Updates**
   - Beacon status changes
   - Participant count updates
   - New beacon notifications

#### Frontend Tasks
**Priority: High**

1. **WebSocket Integration**
   ```bash
   npm install socket.io-client
   ```

2. **Chat Components**
   - Chat room screen
   - Message input component
   - Real-time message updates

3. **Notification System**
   - Push notification setup
   - In-app notifications
   - Notification preferences

#### Deliverables
- [ ] Real-time chat functional
- [ ] Push notifications working
- [ ] Beacon updates in real-time
- [ ] Message history available

---

### Week 6: Advanced Filtering & Search

#### Backend Tasks
**Priority: Medium**

1. **Search Implementation**
   ```ruby
   # Gemfile
   gem 'pg_search'
   ```

2. **Advanced Filters**
   - Multi-category filtering
   - Time-based filtering
   - Reliability score filtering

3. **Activity Suggestions**
   - Basic recommendation algorithm
   - User preference tracking
   - Suggestion API endpoint

#### Frontend Tasks
**Priority: Medium**

1. **Advanced Filter UI**
   - Filter modal component
   - Saved filter presets
   - Filter result count

2. **Search Functionality**
   - Search bar component
   - Search results screen
   - Search history

#### Deliverables
- [ ] Advanced filtering works
- [ ] Search functionality complete
- [ ] Basic activity suggestions
- [ ] Filter preferences saved

---

### Week 7: Corporate Features

#### Backend Tasks
**Priority: High**

1. **Multi-tenant Architecture**
   ```bash
   rails generate model CorporateAccount name:string domain:string settings:json
   rails generate migration AddCorporateToUsers corporate_id:bigint is_corporate_admin:boolean
   ```

2. **Corporate API**
   ```
   GET /api/v1/corporate/dashboard
   POST /api/v1/corporate/beacons
   GET /api/v1/corporate/employees
   ```

3. **Admin Dashboard**
   - Employee management
   - Corporate beacon management
   - Analytics endpoints

#### Frontend Tasks
**Priority: High**

1. **Web Dashboard Setup**
   - React.js admin dashboard
   - Corporate authentication
   - Dashboard layout

2. **Corporate Features**
   - Employee management screen
   - Corporate beacon creation
   - Analytics dashboard

#### Deliverables
- [ ] Corporate accounts functional
- [ ] Admin dashboard working
- [ ] Employee management complete
- [ ] Corporate analytics available

---

### Week 8: Enhanced Reliability System

#### Backend Tasks
**Priority: Medium**

1. **Advanced Reliability Scoring**
   - Weighted scoring by activity type
   - Time-based score decay
   - Dispute resolution system

2. **Reliability History**
   ```bash
   rails generate model ReliabilityHistory user:references beacon:references score_change:integer previous_score:integer new_score:integer reason:string
   ```

3. **Dispute Resolution**
   - Dispute creation API
   - Admin resolution interface
   - Appeal system

#### Frontend Tasks
**Priority: Medium**

1. **Reliability Dashboard**
   - Score history visualization
   - Reliability insights
   - Achievement badges

2. **Dispute System**
   - Report no-show functionality
   - Dispute tracking
   - Appeal interface

#### Deliverables
- [ ] Advanced reliability scoring
- [ ] Dispute resolution system
- [ ] Reliability history tracking
- [ ] Achievement system

---

## Phase 3: Scaling & Optimization (Weeks 9-12)

### Week 9: Performance Optimization

#### Backend Tasks
**Priority: High**

1. **Caching Implementation**
   ```ruby
   # Redis caching for beacon feeds
   def cached_beacons(location, filters)
    Rails.cache.fetch("beacons_#{location.hash}_#{filters.hash}", expires_in: 15.minutes) do
      Beacon.nearby(location, filters)
    end
   end
   ```

2. **Database Optimization**
   - Add proper indexes
   - Query optimization
   - Connection pooling

3. **Background Jobs**
   - Notification emails
   - Score calculations
   - Data cleanup

#### Frontend Tasks
**Priority: High**

1. **Performance Optimization**
   - Image lazy loading
   - Infinite scrolling
   - Memory management

2. **Offline Support**
   - Cached beacon browsing
   - Offline beacon creation
   - Sync when online

#### Deliverables
- [ ] API response times < 2s
- [ ] Database queries optimized
- [ ] Offline functionality working
- [ ] Memory usage optimized

---

### Week 10: Booking Integrations

#### Backend Tasks
**Priority: Medium**

1. **Partner API Integration**
   - Theater booking APIs
   - Venue reservation systems
   - Payment processing

2. **Booking Service**
   ```ruby
   class BookingService
     def self.create_booking(beacon, user)
       # Integration with partner APIs
     end
   end
   ```

3. **Payment Integration**
   - Stripe integration
   - Corporate billing
   - Subscription management

#### Frontend Tasks
**Priority: Medium**

1. **Booking UI**
   - Partner venue selection
   - Payment flow
   - Booking confirmation

2. **Corporate Billing**
   - Subscription management
   - Usage tracking
   - Invoice generation

#### Deliverables
- [ ] Theater booking integration
- [ ] Payment processing working
- [ ] Corporate billing functional
- [ ] Booking confirmations sent

---

### Week 11: AI-Powered Features

#### Backend Tasks
**Priority: Low**

1. **Recommendation Engine**
   - User behavior analysis
   - Activity preference learning
   - Personalized suggestions

2. **ML Model Integration**
   - Python microservice
   - TensorFlow model
   - API integration

#### Frontend Tasks
**Priority: Low**

1. **AI Features UI**
   - Smart suggestions
   - Preference learning
   - Personalized feed

#### Deliverables
- [ ] Basic recommendation engine
- [ ] User preference tracking
- [ ] AI-powered suggestions
- [ ] Personalized beacon feed

---

### Week 12: Launch Preparation

#### Backend Tasks
**Priority: High**

1. **Production Deployment**
   - Kamal deployment setup
   - Environment configuration
   - SSL certificates

2. **Monitoring Setup**
   - Error tracking (Sentry)
   - Performance monitoring
   - Health checks

3. **Security Hardening**
   - Security audit
   - Penetration testing
   - Compliance checks

#### Frontend Tasks
**Priority: High**

1. **App Store Preparation**
   - App Store assets
   - Privacy policy
   - Terms of service

2. **Beta Testing**
   - TestFlight setup
   - Crash reporting
   - User feedback collection

#### Deliverables
- [ ] Production deployment ready
- [ ] Monitoring and alerting
- [ ] App Store submission ready
- [ ] Beta testing program launched

---

## Development Guidelines

### Code Standards

#### Ruby on Rails
- Follow RuboCop style guidelines
- Use service objects for complex logic
- Write comprehensive tests (RSpec)
- Use FactoryBot for test data

#### React Native
- Follow Airbnb JavaScript style guide
- Use TypeScript for type safety
- Component-based architecture
- Redux for state management

### Git Workflow

#### Branch Strategy
```
main
├── develop
├── feature/beacon-creation
├── feature/real-time-chat
└── hotfix/critical-bug-fix
```

#### Commit Convention
```
feat: Add beacon creation functionality
fix: Resolve authentication token refresh issue
docs: Update API documentation
test: Add reliability service tests
```

### Testing Strategy

#### Backend Testing
- Unit tests: Models, Services, Utilities
- Integration tests: API endpoints
- System tests: User journeys

#### Frontend Testing
- Unit tests: Components, Utilities
- Integration tests: Screen flows
- E2E tests: Critical user paths

### Deployment Strategy

#### Environments
1. **Development**: Local development
2. **Staging**: Pre-production testing
3. **Production**: Live environment

#### CI/CD Pipeline
1. **Push to feature branch**: Run tests
2. **Pull request**: Full test suite + code review
3. **Merge to develop**: Deploy to staging
4. **Tag release**: Deploy to production

---

## Risk Management

### Technical Risks

#### Real-time Performance
- **Mitigation**: Load testing, connection pooling
- **Fallback**: HTTP polling if WebSocket fails

#### Database Scalability
- **Mitigation**: Proper indexing, read replicas
- **Monitoring**: Query performance tracking

#### Mobile App Size
- **Mitigation**: Code splitting, lazy loading
- **Monitoring**: Bundle size tracking

### Business Risks

#### Market Adoption
- **Mitigation**: User feedback loops, A/B testing
- **Metrics**: Daily active users, retention rates

#### Competition
- **Mitigation**: Feature differentiation, user experience
- **Monitoring**: Competitor analysis

---

## Success Metrics

### Technical Metrics
- API response time < 2 seconds
- Database query time < 100ms
- WebSocket latency < 1 second
- App crash rate < 1%
- Test coverage > 80%

### Business Metrics
- User registration rate
- Beacon creation rate
- Join completion rate > 50%
- User retention (7-day, 30-day)
- Corporate account acquisition

### User Experience Metrics
- App Store rating > 4.0
- User satisfaction score
- Support ticket volume
- Feature adoption rate

---

## Conclusion

This implementation roadmap provides a structured approach to building Beacon Buddy from MVP to a scalable platform. The phased approach allows for:

1. **Early market validation** with MVP features
2. **Iterative improvement** based on user feedback
3. **Technical debt management** through regular refactoring
4. **Scalability planning** from the beginning

Key success factors:
- **Consistent sprint delivery**
- **User feedback integration**
- **Performance monitoring**
- **Security first approach**
- **Quality assurance**

The roadmap is flexible and can be adjusted based on market feedback, technical challenges, and business priorities. Regular retrospectives will help identify areas for improvement and course correction.
