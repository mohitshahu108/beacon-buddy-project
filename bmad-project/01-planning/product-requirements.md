---
stepsCompleted: ["step-01-init", "step-02-discovery", "step-02b-vision", "step-02c-executive-summary", "step-03-success", "step-04-journeys", "step-05-domain", "step-06-innovation", "step-07-project-type", "step-08-scoping", "step-09-functional", "step-10-nonfunctional", "step-11-polish"]
inputDocuments: ["BeaconBuddyMobile/README.md", "beacon_buddy_rails/README.md"]
workflowType: 'prd'
classification:
  projectType: "mobile_app + saas_b2c (hybrid)"
  domain: "social_networking"
  complexity: "medium-high"
  projectContext: "brownfield"
---

# Product Requirements Document - Beacon Buddy

**Author:** Mohit_shahu
**Date:** 2026-03-22T17:21:00.000Z

## Executive Summary

Beacon Buddy is the first universal activity coordination platform that eliminates social friction around planning and joining activities. The platform serves both individual users and corporate clients, with integrated booking partnerships across entertainment venues, sports arenas, and service providers. Target users include introverts and individuals seeking low-pressure social engagement through activity discovery rather than relationship building.

### What Makes This Special

**Pioneer Status:** No direct competitors exist - Beacon Buddy creates a new category rather than entering an existing market. Universal scope encompasses both casual users and corporate clients, unlike Meetup's corporate-only focus. The integrated ecosystem enables direct booking with theaters, arenas, and venues within the same app where users discover activities. Introvert-first design specifically serves the massive underserved market of users who want activities without social pressure. Flexible social control allows users to choose between strangers or close friends for each activity.

**Core Insight:** The platform's magic happens through the activity suggestion system - this is where users realize Beacon Buddy isn't just another social app, but an activity discovery engine that helps them find experiences they wouldn't have considered independently.

### Project Classification

**Project Type:** Mobile app + SaaS B2C hybrid - React Native frontend with Rails API backend, freemium business model evolving to premium AI travel planning features.

**Domain:** Social networking with activity-centric approach rather than relationship-centric, creating a new subcategory of social coordination.

**Complexity:** Medium-high due to real-time features, geolocation matching, reputation system, and partnership ecosystem integration.

**Project Context:** Brownfield - building upon existing authentication foundation and data models in current React Native and Rails codebase.

## Success Criteria

### User Success

Users achieve 50-60% beacon completion rate within 3 months, improving to 70% completion rate within 12 months. Success moment occurs when users discover and complete activities they wouldn't have found independently, particularly introverts experiencing low-pressure social engagement through activity suggestions.

### Business Success

**3-Month Targets (Nagpur Launch):** 300-500 users, 100 beacons created, 50-60% completion rate
**12-Month Targets:** 3,000-5,000 users, 5,000+ beacons, 70% completion rate, new features launched, corporate software sales initiated

### Technical Success

Reliable beacon matching system supporting scalable architecture for 3K-5K users, robust booking integration with theaters/arenas/venues, and corporate client functionality for B2B revenue diversification.

## User Personas & Journeys

### Primary User Personas

**Sam (Activity Seeker, 28, Introvert)**
- Software developer seeking social activities without pressure
- Wants to discover local activities but avoids traditional social apps
- Values privacy and low-pressure interactions
- Tech-savvy, prefers mobile-first experiences

**Raj (Activity Creator, 32, Extrovert)**
- Event organizer who loves bringing people together
- Creates activities for various interests and group sizes
- Needs reliable participants and attendance tracking
- Uses multiple platforms currently, wants unified solution

**Priya (Corporate Admin, 35, HR Manager)**
- Manages team activities and employee engagement
- Needs analytics and reporting for ROI measurement
- Values privacy and data security for corporate use
- Wants streamlined activity management for distributed teams

### User Journey Maps

#### Sam's Discovery Journey
1. **Discovery**: Finds Beacon Buddy through app store search
2. **Onboarding**: Quick Google OAuth, minimal profile setup
3. **Exploration**: Browses nearby activities without social pressure
4. **Joining**: One-tap join for open activities, requests for private ones
5. **Participation**: Attends activity, provides feedback
6. **Retention**: Receives personalized suggestions, continues engagement

#### Raj's Creation Journey
1. **Planning**: Decides on activity type, time, location
2. **Creation**: Uses app to create beacon with details
3. **Management**: Monitors participants, sends updates
4. **Execution**: Runs activity, tracks attendance
5. **Follow-up**: Rates participants, improves reliability score

#### Priya's Corporate Journey
1. **Setup**: Configures corporate account and branding
2. **Creation**: Creates team activities and events
3. **Management**: Monitors participation and engagement
4. **Analytics**: Reviews reports and ROI metrics
5. **Optimization**: Adjusts strategy based on data insights

## Domain Analysis

### Core Domain Concepts

**Beacon**: Location-based activity with time, participants, and rules
- **Open Beacon**: Anyone can join without approval
- **Personal Beacon**: Requires creator approval
- **Filtered Beacon**: Specific requirements (age, gender, interests)

**Reliability Score**: Trust metric (750-1000) based on completion history
- **Starting Score**: 750 for all new users
- **Score Changes**: +10 for attendance, -25 for no-show
- **Score Impact**: Affects ability to join filtered beacons

**Activity Categories**: Predefined types for organization
- **Entertainment**: Movies, concerts, shows
- **Sports**: Running, gym, team sports
- **Food**: Restaurants, cafes, cooking classes
- **Social**: Meetups, networking, hobby groups
- **Other**: Custom activities

### Business Rules

**Beacon Creation Rules**
- Maximum 10 active beacons per user
- Minimum 2 participants required
- 24-hour minimum advance notice
- Automatic cancellation if minimum not met

**Reliability System Rules**
- Score updates within 10 seconds of activity completion
- Dispute resolution process for unfair ratings
- Score recovery through consistent participation
- Corporate admin override for team activities

**Privacy and Security Rules**
- Location data shared only with explicit consent
- Chat messages auto-delete after 24 hours
- Profile information private by default
- Two-factor authentication for corporate accounts

## Innovation Strategy

### Market Positioning

**Blue Ocean Strategy**: Creating new market category rather than competing in existing social app space
- **Differentiation**: Activity-first vs relationship-first approach
- **Focus**: Introvert-friendly vs extrovert-focused
- **Integration**: Direct booking vs external coordination

### Competitive Advantages

**Unique Features**
- Integrated venue booking system
- Reliability scoring with accountability
- Introvert-first design principles
- Corporate B2B functionality
- Real-time ephemeral messaging

**Technical Innovation**
- Geospatial beacon matching algorithms
- Real-time WebSocket infrastructure
- AI-powered activity suggestions
- Cross-platform native performance

## Functional Requirements

### Core User Features

**FR1: Activity Discovery**
- Browse beacons by location without authentication
- Filter by distance, category, activity type
- View beacon details with creator reliability
- Sort by relevance, time, reliability score

**FR2: Beacon Joining**
- One-tap joining for open beacons
- Request approval for personal/filtered beacons
- Real-time notifications for status changes
- Waitlist management for full activities

**FR3: Beacon Creation**
- Create beacons with title, description, category
- Set time, location, participant limits
- Configure join policy (open/personal/filtered)
- Add activity requirements and restrictions

**FR4: Reliability System**
- View current reliability score (750-1000)
- Track score history and trends
- Report attendance and no-shows
- Dispute unfair ratings

**FR5: Social Features**
- Ephemeral chat (24-hour auto-delete)
- Participant lists and profiles
- Activity sharing with close friends
- Push notifications for updates

### Corporate Features

**FR6: Corporate Management**
- Create and manage employee beacons
- Set corporate branding and customization
- View participation analytics
- Manage company-wide reliability scoring

**FR7: Analytics & Reporting**
- Dashboard with engagement metrics
- Generate participation reports
- ROI analytics for corporate activities
- Export data for compliance

### Integration Features

**FR8: Booking Integration**
- View partner venue availability
- One-tap booking for theaters/arenas
- Automatic payment processing
- Calendar synchronization

**FR9: Activity Suggestions**
- Personalized recommendations
- Browse suggested activities
- Filter by preferences and availability
- Feedback on suggestion quality

## Non-Functional Requirements

### Performance Requirements

**NFR1: Response Time**
- User actions complete within 2 seconds
- Real-time chat delivers within 1 second
- Push notifications deliver within 5 seconds

**NFR2: Real-time Updates**
- Beacon status changes reflect within 5 seconds
- Feed updates appear within 3 seconds
- Score updates process within 10 seconds

### Scalability Requirements

**NFR3: Concurrent Users**
- Support 1,000+ simultaneous users in Nagpur
- Chat infrastructure for all active beacons
- Efficient discovery with 500+ users in same area

**NFR4: User Growth**
- Support 10x growth without performance degradation
- Horizontal scaling through load balancers
- Efficient O(n log n) beacon matching algorithms

### Security Requirements

**NFR5: Data Encryption**
- AES-256 encryption at rest
- TLS 1.3+ encryption in transit
- Bcrypt password hashing with salt
- SSL/TLS database connections

**NFR6: Access Control**
- Role-based permissions with audit logging
- Two-factor authentication for corporate admins
- API rate limiting and abuse protection
- Granular privacy controls

### Privacy Requirements

**NFR7: Privacy Protection**
- Location data only with explicit consent
- Auto-deleted chat messages (24 hours)
- Private profile information by default
- User-controlled sharing settings

### Usability Requirements

**NFR8: Mobile-First Design**
- Touch-only navigation support
- Scalable text (12pt-24pt)
- High contrast color schemes
- Screen reader and voice navigation

**NFR9: Introvert-Friendly Interface**
- Minimal social pressure indicators
- Private default settings
- Anonymous browsing options
- User-controlled visibility

## Technical Specifications

### Technology Stack

**Frontend**
- React Native with Expo Router
- TypeScript for type safety
- Zustand for state management
- Expo SDK for cross-platform features

**Backend**
- Ruby on Rails API
- PostgreSQL with PostGIS
- Redis for caching and sessions
- Action Cable for WebSockets

**Infrastructure**
- Docker containers for services
- Nginx reverse proxy
- CDN for static assets
- Cloud hosting with auto-scaling

### API Design

**REST Architecture**
- JSON:API specification compliance
- Versioned endpoints (/api/v1/)
- Comprehensive error handling
- Rate limiting and security

**Real-time Features**
- WebSocket connections via Action Cable
- Ephemeral message handling
- Live beacon status updates
- Push notification integration

### Database Design

**Core Models**
- Users (authentication, profiles, reliability)
- Beacons (activities, locations, rules)
- Participants (join requests, attendance)
- Messages (ephemeral chat, auto-deletion)

**Geospatial Features**
- PostGIS for location queries
- Efficient distance calculations
- Geographic indexing
- Multi-city support

## Implementation Phases

### Phase 1: Foundation (Weeks 1-4)
- User authentication system
- Basic beacon creation and discovery
- Core UI components and navigation
- Reliability scoring foundation

### Phase 2: Core Features (Weeks 5-8)
- Advanced filtering and search
- Real-time messaging system
- Participant management
- Push notification system

### Phase 3: Advanced Features (Weeks 9-12)
- Activity suggestion algorithm
- Booking integration partnerships
- Corporate account management
- Analytics and reporting

### Phase 4: Polish & Launch (Weeks 13-16)
- Performance optimization
- Security hardening
- User testing and feedback
- Nagpur market launch

## Success Metrics & KPIs

### User Engagement Metrics
- Daily active users (DAU)
- Beacon creation rate
- Join request acceptance rate
- Activity completion rate

### Business Metrics
- User acquisition cost (CAC)
- Customer lifetime value (LTV)
- Corporate subscription revenue
- Partner booking commissions

### Technical Metrics
- API response times
- Database query performance
- Mobile app crash rates
- WebSocket connection stability

### Quality Metrics
- User satisfaction scores
- App store ratings
- Customer support tickets
- Feature adoption rates

## Risk Assessment & Mitigation

### Technical Risks
- **Real-time performance**: Mitigate with WebSocket optimization
- **Geospatial scaling**: Mitigate with efficient algorithms
- **Database performance**: Mitigate with proper indexing

### Business Risks
- **User adoption**: Mitigate with introvert-first design
- **Competition**: Mitigate with unique positioning
- **Partnership delays**: Mitigate with phased integration

### Operational Risks
- **Team scaling**: Mitigate with clear documentation
- **Quality control**: Mitigate with automated testing
- **Security breaches**: Mitigate with regular audits

---

**This PRD serves as the comprehensive foundation for Beacon Buddy development, ensuring all stakeholders understand the vision, requirements, and success criteria.**
