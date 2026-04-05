---
stepsCompleted: [1, 2, 3, 4]
inputDocuments: ["../01-planning/product-requirements.md", "../03-architecture/system-architecture.md", "../02-design/design-system/"]
---

# Beacon Buddy - Epic Breakdown

## Overview

This document provides complete epic and story breakdown for Beacon Buddy, decomposing requirements from PRD, UX Design, and Architecture requirements into implementable stories.

## Requirements Inventory

### Functional Requirements

FR1: Activity Seeker can browse beacons without account
- As a guest user, browse location-based beacon feed without authentication
- Filter beacons by distance, category, and activity type
- View beacon details including creator reliability scores and participant count

FR2: Activity Seeker can join open beacons instantly
- One-tap joining for open beacons without approval process
- Automatic notification to beacon creator about new participant
- Immediate access to beacon chat and participant information

FR3: Activity Seeker can request to join personal beacons
- Submit join requests for personal or filtered beacons requiring approval
- Track status of pending requests (approved, denied, expired)
- Notification system for request status changes

FR4: Activity Creator can create beacons with activity details
- Create beacons with title, description, activity type, and time
- Set participant limits (2-person vs group) and join policy (open/personal/filtered)
- Select activity category from predefined list (movie, sports, food, park, other)
- Add location details and meeting point information

FR5: Activity Creator can set participant limits and join policies
- Define maximum participant count for group beacons
- Configure join requirements (age, gender, hobby filters for filtered beacons)
- Set beacon visibility (public, private, friends-only)
- Manage waitlist and approval workflows for personal beacons

FR6: Users can report activity completion and no-shows
- Report attendance status after beacon completion (attended, no-show, cancelled)
- Report no-show participants for reliability score adjustment
- View complete attendance history and reliability score trends

FR7: Users can view and modify reliability scores
- Display current reliability score (starting at 750) with score history
- Show score breakdown by activity type and completion rate
- Visual indicators of reliability level (excellent, good, needs improvement)

FR8: Users can receive activity suggestions based on preferences
- Receive personalized activity recommendations based on user interests and history
- Browse suggested activities with one-tap creation workflow
- Filter suggestions by location, time availability, and social preferences
- Option to provide feedback on suggestion quality

FR9: Users can share beacon links with close friends
- Generate shareable links for specific beacons
- Send beacon invitations to close friends via messaging apps
- Control privacy settings for shared beacons (friends-only vs public)
- Track join status for invited friends

FR10: Corporate admins can manage employee beacons
- Create and manage beacons on behalf of company accounts
- Set corporate branding and customization options
- View employee participation analytics and completion rates
- Manage company-wide reliability scoring and policies

FR11: Corporate admins can view analytics and reports
- Access dashboard with beacon creation, participation, and completion metrics
- Generate reports on employee engagement and reliability scores
- View ROI analytics for corporate beacon investments
- Export data for accounting and compliance purposes

FR12: Users can communicate via ephemeral chat
- Access chat room after joining beacon (24-hour automatic deletion)
- Send text messages to beacon participants and creators
- Share location updates and status changes within chat
- Block and report inappropriate chat behavior

FR13: Users can receive push notifications for activity updates
- Receive notifications for beacon invitations and join requests
- Get reminders for upcoming beacon events (24 hours before, 1 hour before)
- Notifications for beacon status changes (cancelled, full, participant updates)
- Reliability score change notifications and dispute resolutions

FR14: Users can filter beacons by location and category
- Apply distance-based filters (within 5km, 10km, 25km)
- Filter by activity categories with multi-select capability
- Sort beacons by relevance, time, and creator reliability
- Save filter preferences and search history

FR15: Users can access integrated booking for venues and events
- View partner venue information and availability within beacon details
- One-tap booking integration for movie theaters and event venues
- Automatic payment processing through partner systems
- Sync booking confirmations with calendar applications

### NonFunctional Requirements

NFR1: User actions complete within 2 seconds
- Beacon discovery, joining, and profile updates must complete within 2 seconds for optimal user experience
- Real-time chat messages deliver within 1 second between participants
- Push notifications deliver within 5 seconds of trigger events

NFR2: Real-time Updates
- Beacon status changes (new participants, cancellations, location updates) reflect in user interface within 5 seconds
- Beacon feed updates with new beacons appear within 3 seconds
- Reliability score updates process and display within 10 seconds of activity completion

NFR3: Concurrent Users
- System supports 1,000+ simultaneous users in Nagpur region without performance degradation
- Chat infrastructure supports ephemeral messaging for all active beacons simultaneously
- Beacon discovery feed performs efficiently with up to 500 concurrent users in same geographic area

NFR4: Data Encryption
- All user data encrypted at rest using AES-256 encryption standard
- All data in transit encrypted using TLS 1.3 or higher
- User passwords and authentication tokens hashed using bcrypt with salt
- Database connections encrypted using SSL/TLS

NFR5: Access Control
- Role-based permissions with audit logging for all admin actions
- Two-factor authentication required for corporate admin accounts
- API rate limiting prevents abuse and protects system resources
- Personal data access requires explicit user consent through granular privacy controls

NFR6: Privacy Protection
- Location data shared only with explicit user consent and can be revoked at any time
- Chat messages automatically deleted after 24 hours with no recovery option
- User profile information accessible only to authenticated users and authorized corporate admins
- Activity participation history private by default with user-controlled sharing settings

NFR7: User Growth
- System supports 10x user growth without performance degradation from 300 to 5,000 users
- Architecture supports horizontal scaling through load balancers and database replication
- Beacon discovery algorithms optimized for efficient matching with O(n log n) complexity for large user bases

NFR8: Geographic Expansion
- Multi-city deployment capability without architecture changes through configurable region settings
- Location-based services automatically adapt to new geographic regions through partner integration
- Performance remains consistent across different geographic regions through CDN deployment

NFR9: Mobile-first Design
- User interface fully functional with touch-only navigation for accessibility
- Text size scalable from 12pt to 24pt for users with visual impairments
- High contrast color scheme support for users with low vision
- Voice navigation and screen reader support for all major app functions

NFR10: Introvert-friendly Interface
- Social interaction pressure minimized through default private settings and anonymous browsing options
- Activity suggestions focus on individual experiences rather than social performance metrics
- Reliability scores displayed privately by default with user-controlled visibility settings

### Additional Requirements

- Starter Template: Initialize project using Expo CLI and Rails API templates
- Infrastructure: Docker containers for PostgreSQL, Redis, and application services
- Integration: Google OAuth 2.0 implementation with JWT token management
- Real-time: Action Cable for WebSocket connections and ephemeral messaging
- API Design: REST with JSON:API specification and versioned endpoints
- State Management: Zustand for frontend state with immutable updates
- Database: PostgreSQL with PostGIS extension for geolocation queries
- Caching: Redis for session storage and real-time data
- Testing: Jest for frontend, RSpec for backend with comprehensive coverage

### UX Design Requirements

- Component-based UI architecture with reusable design system
- Mobile-first responsive design with touch-optimized interactions
- Introvert-friendly interface with minimal social pressure indicators
- Accessibility compliance with WCAG 2.1 AA standards
- Real-time feedback for all user actions with loading states
- Error handling with user-friendly messages and recovery options

### Design System Requirements

DS1: Unified Design Language
- Implement comprehensive design token system (colors, typography, spacing)
- Create reusable component library with consistent API
- Support light/dark theme modes with smooth transitions
- Ensure accessibility compliance across all components

DS2: Component Architecture
- Build 30+ core components (Button, Card, Input, Avatar, etc.)
- Implement responsive design patterns for mobile/tablet/desktop
- Create themed components with consistent styling
- Add micro-interactions and animation system

DS3: Implementation Standards
- TypeScript strict mode with proper interfaces
- Performance optimizations (useNativeDriver, virtualization)
- Component testing with Jest and React Native Testing Library
- Storybook documentation and visual testing

DS4: Platform Considerations
- iOS-specific optimizations (SafeAreaView, SF Pro Display)
- Android-specific handling (permissions, Inter font)
- Web responsiveness and PWA features
- Cross-platform consistency with platform adaptations

### FR Coverage Map

All functional requirements mapped to epics and stories for complete coverage.

### Epic 0: Design System Foundation
**User Outcome:** Consistent, accessible, and performant user interface
**FRs covered:** DS1, DS2, DS3, DS4

#### Story 0.1: Design Token Implementation
As a developer,
I want to implement design tokens for colors, typography, and spacing,
So that all components use consistent styling across the app.

**Acceptance Criteria:**
**Given** Design tokens are defined in design-tokens.json
**When** Components reference design tokens
**Then** All styling uses consistent values from the token system
**And** Light/dark theme switching works seamlessly

#### Story 0.2: Core Component Library
As a developer,
I want to build reusable UI components (Button, Card, Input, Avatar),
So that the app has consistent interaction patterns and styling.

**Acceptance Criteria:**
**Given** Component specifications are defined
**When** Components are implemented following design system
**Then** All components support theming and accessibility
**And** Components work consistently across iOS, Android, and Web

#### Story 0.3: Responsive Layout System
As a user,
I want the app to adapt seamlessly to different screen sizes,
So that I have optimal experience on mobile, tablet, and desktop.

**Acceptance Criteria:**
**Given** Responsive breakpoints are defined
**When** App renders on different devices
**Then** Layout adjusts appropriately for screen size
**And** Navigation adapts (tabs vs sidebar)

#### Story 0.4: Theme System Integration
As a user,
I want to switch between light and dark themes,
So that I can use the app comfortably in different lighting conditions.

**Acceptance Criteria:**
**Given** Theme system is implemented
**When** User toggles theme preference
**Then** All UI elements update to match selected theme
**And** Theme preference persists across app sessions

#### Story 0.5: Animation and Micro-interactions
As a user,
I want smooth animations and feedback for my actions,
So that the app feels responsive and polished.

**Acceptance Criteria:**
**Given** Animation specifications are defined
**When** User interacts with UI elements
**Then** Appropriate animations play (press, hover, focus)
**And** Animations perform smoothly using native driver

### Epic 1: User Authentication & Profiles
**User Outcome:** Secure access to platform with personalized experience
**FRs covered:** FR1, FR2

#### Story 1.1: Seamless Google Authentication
As a new user (Sam),
I want to sign up using my Google account with one tap,
So that I can quickly join the platform without password friction.

**Acceptance Criteria:**
**Given** No existing account
**When** User taps "Sign in with Google" button
**Then** User is authenticated with profile created from Google data
**And** JWT token is stored securely with refresh mechanism

#### Story 1.2: Profile Management
As an authenticated user (Raj),
I want to manage my profile information and privacy settings,
So that I can control how I appear to others and what data is shared.

**Acceptance Criteria:**
**Given** User is authenticated
**When** User accesses profile section
**Then** User can edit name, photo, interests, and privacy preferences
**And** Changes are saved and reflected across the app immediately

#### Story 1.3: User Preferences
As an authenticated user (Priya),
I want to customize my app experience with themes and notifications,
So that the app works according to my preferences and needs.

**Acceptance Criteria:**
**Given** User is authenticated
**When** User accesses settings
**Then** User can toggle themes, manage notifications, and set preferences
**And** Preferences are saved and applied consistently across the app

### Epic 2: Beacon Discovery & Browsing
**User Outcome:** Find relevant activities nearby effortlessly
**FRs covered:** FR14, FR2.1

#### Story 2.1: Location-based Beacon Feed
As a guest user (Sam),
I want to browse beacons near my location without creating an account,
So that I can explore activities available in my area.

**Acceptance Criteria:**
**Given** User has location permissions
**When** User opens beacon discovery screen
**Then** User sees list of nearby beacons sorted by relevance
**And** User can filter by distance, category, and activity type

#### Story 2.2: Beacon Details View
As an authenticated user (Raj),
I want to view detailed information about specific beacons,
So that I can make informed decisions about joining activities.

**Acceptance Criteria:**
**Given** User is viewing beacon list
**When** User taps on a beacon
**Then** User sees complete beacon details including creator info, participants, and requirements
**And** User can join or request to join from the detail view

#### Story 2.3: Search and Filtering
As a user (Priya),
I want to search and filter beacons based on my preferences,
So that I can find activities that match my specific interests and availability.

**Acceptance Criteria:**
**Given** User is on beacon discovery screen
**When** User applies search terms and filters
**Then** Beacon list updates to show only matching results
**And** User can save filter preferences for future use

#### Story 2.4: Map Integration
As a user (Sam),
I want to see beacons on a map interface,
So that I can understand their geographic distribution and make location-based decisions.

**Acceptance Criteria:**
**Given** User has location permissions
**When** User switches to map view
**Then** User sees beacons plotted on map with distance indicators
**And** User can interact with map beacons to view details

### Epic 3: Beacon Creation & Management
**User Outcome:** Create and manage activities with control over participation
**FRs covered:** FR4, FR5, FR3

#### Story 3.1: Beacon Creation Flow
As an activity creator (Raj),
I want to create new beacons with detailed information,
So that I can organize activities according to my preferences and requirements.

**Acceptance Criteria:**
**Given** User is authenticated
**When** User initiates beacon creation
**Then** User can set title, description, category, time, location, and participation rules
**And** Beacon is created and appears in discovery feed

#### Story 3.2: Participant Management
As a beacon creator (Raj),
I want to manage participants who join my beacons,
So that I can control who participates and ensure appropriate group composition.

**Acceptance Criteria:**
**Given** User created a beacon
**When** Participants request to join
**Then** User can approve/deny requests and manage participant list
**And** Notifications are sent to participants about status changes

#### Story 3.3: Activity Updates
As a beacon creator (Raj),
I want to send updates and modifications to beacon participants,
So that I can communicate changes and important information effectively.

**Acceptance Criteria:**
**Given** User is beacon creator
**When** User sends updates or modifies beacon details
**Then** All participants receive notifications about changes
**And** Chat room reflects updated information

#### Story 3.4: Beacon Analytics
As a beacon creator (Raj),
I want to view analytics about my beacons,
So that I can understand participation patterns and improve future activities.

**Acceptance Criteria:**
**Given** User has created multiple beacons
**When** User views beacon analytics
**Then** User sees participation rates, completion rates, and participant feedback
**And** Analytics help user understand activity success factors

### Epic 4: Social Features & Communication
**User Outcome:** Connect with participants and coordinate activities effectively
**FRs covered:** FR12, FR13, FR9

#### Story 4.1: Ephemeral Chat System
As a beacon participant (Sam),
I want to communicate with other participants in a temporary chat,
So that we can coordinate logistics and build community around the activity.

**Acceptance Criteria:**
**Given** User has joined a beacon
**When** User accesses beacon chat
**Then** User can send messages to all participants
**And** Messages are automatically deleted after 24 hours

#### Story 4.2: Push Notifications
As a user (Priya),
I want to receive notifications about beacon activities and updates,
So that I stay informed about activities I'm interested in.

**Acceptance Criteria:**
**Given** User has joined beacons or created activities
**When** Beacon events occur (joins, updates, reminders)
**Then** User receives relevant push notifications
**And** Notifications are timely and actionable

#### Story 4.3: Beacon Sharing
As a user (Raj),
I want to share beacons with friends,
So that I can invite specific people to activities I think they'll enjoy.

**Acceptance Criteria:**
**Given** User is viewing a beacon
**When** User chooses to share beacon
**Then** User can generate shareable link or send invitations
**And** Recipients can easily join the shared beacon

#### Story 4.4: Participant Profiles
As a user (Sam),
I want to view profiles of other participants,
So that I can learn more about people I'm connecting with.

**Acceptance Criteria:**
**Given** User is in a beacon
**When** User views participant list
**Then** User can see participant profiles with reliability scores
**And** Privacy settings control what information is visible

### Epic 5: Reliability System & Trust
**User Outcome:** Build trust through reliable participation and fair scoring
**FRs covered:** FR6, FR7

#### Story 5.1: Reliability Scoring
As a user (Sam),
I want to build and maintain a reliability score,
So that I can demonstrate my trustworthiness as a participant.

**Acceptance Criteria:**
**Given** User participates in beacons
**When** Activities complete
**Then** User's reliability score updates based on attendance
**And** Score history shows trends and breakdowns

#### Story 5.2: Attendance Reporting
As a beacon creator (Raj),
I want to report participant attendance,
So that reliability scores accurately reflect real behavior.

**Acceptance Criteria:**
**Given** Beacon activity is completed
**When** Creator reports attendance
**Then** Participant reliability scores update accordingly
**And** Reports can be disputed if incorrect

#### Story 5.3: Score Visibility
As a user (Priya),
I want to control who sees my reliability score,
So that I can manage my privacy while still building trust.

**Acceptance Criteria:**
**Given** User has reliability score
**When** User configures privacy settings
**Then** Score visibility respects user preferences
**And** Users can choose public, friends-only, or private visibility

#### Story 5.4: Dispute Resolution
As a user (Sam),
I want to dispute unfair reliability score changes,
So that I can maintain an accurate reputation.

**Acceptance Criteria:**
**Given** User believes score change is unfair
**When** User submits dispute
**Then** Review process evaluates the dispute
**And** Score is adjusted if dispute is valid

### Epic 6: Activity Suggestions & Personalization
**User Outcome:** Discover relevant activities through intelligent recommendations
**FRs covered:** FR8

#### Story 6.1: Personalized Suggestions
As a user (Priya),
I want to receive personalized activity suggestions,
So that I can discover activities I might not find otherwise.

**Acceptance Criteria:**
**Given** User has activity history and preferences
**When** System generates suggestions
**Then** Suggestions match user interests and availability
**And** User can provide feedback on suggestion quality

#### Story 6.2: Recommendation Engine
As the system,
I want to analyze user behavior and preferences,
So that I can generate accurate and relevant activity suggestions.

**Acceptance Criteria:**
**Given** User data and activity information
**When** Recommendation algorithm processes data
**Then** Suggestions are relevant and engaging
**And** Algorithm improves over time with feedback

#### Story 6.3: Suggestion Interface
As a user (Raj),
I want to browse and interact with activity suggestions,
So that I can easily discover and join recommended activities.

**Acceptance Criteria:**
**Given** Activity suggestions are available
**When** User views suggestion interface
**Then** User can browse, filter, and join suggestions
**And** Interface is intuitive and engaging

#### Story 6.4: Feedback Loop
As a user (Sam),
I want to provide feedback on activity suggestions,
So that the recommendation system can improve over time.

**Acceptance Criteria:**
**Given** User receives activity suggestions
**When** User interacts with suggestions
**Then** User can provide explicit feedback
**And** Feedback improves future suggestion quality

### Epic 7: Corporate Features & B2B
**User Outcome:** Manage team activities and analyze engagement
**FRs covered:** FR10, FR11

#### Story 7.1: Corporate Account Setup
As a corporate admin (Priya),
I want to set up a corporate account,
So that I can manage team activities and track engagement.

**Acceptance Criteria:**
**Given** Admin wants corporate features
**When** Admin sets up corporate account
**Then** Account includes company branding and employee management
**And** Admin can configure company-wide settings

#### Story 7.2: Team Activity Management
As a corporate admin (Raj),
I want to create and manage team activities,
So that I can organize employee engagement and team building.

**Acceptance Criteria:**
**Given** Corporate account is set up
**When** Admin creates team activities
**Then** Activities include company branding and specific rules
**And** Employees can join company activities

#### Story 7.3: Analytics Dashboard
As a corporate admin (Priya),
I want to view analytics about team participation,
So that I can measure engagement and ROI.

**Acceptance Criteria:**
**Given** Corporate account has activities
**When** Admin views analytics dashboard
**Then** Dashboard shows participation rates, completion rates, and trends
**And** Admin can export reports for management

#### Story 7.4: Corporate Reporting
As a corporate admin (Raj),
I want to generate reports for management and compliance,
So that I can provide insights about team engagement initiatives.

**Acceptance Criteria:**
**Given** Analytics data is available
**When** Admin generates reports
**Then** Reports include key metrics and insights
**And** Reports can be exported in various formats

### Epic 8: Booking Integration & Partnerships
**User Outcome**: Seamlessly book venues and services for activities
**FRs covered**: FR15

#### Story 8.1: Partner Venue Integration
As a user (Sam),
I want to see and book partner venues within the app,
So that I can easily secure locations for my activities.

**Acceptance Criteria:**
**Given** Partner venues are available
**When** User creates beacon with venue
**Then** User can view availability and book directly
**And** Booking syncs with beacon details

#### Story 8.2: Payment Processing
As a user (Raj),
I want to pay for venue bookings through the app,
So that I can complete transactions without leaving the platform.

**Acceptance Criteria:**
**Given** Venue booking requires payment
**When** User proceeds with payment
**Then** Payment processes securely within the app
**And** Receipt is generated and stored

#### Story 8.3: Calendar Integration
As a user (Priya),
I want to sync beacon activities with my calendar,
So that I can manage my schedule effectively.

**Acceptance Criteria:**
**Given** User has calendar integration enabled
**When** User joins or creates beacons
**Then** Events appear in user's calendar
**And** Changes sync automatically

#### Story 8.4: Partner Management
As a system admin,
I want to manage partner integrations,
So that I can maintain venue booking capabilities.

**Acceptance Criteria:**
**Given** Partner venues exist
**When** Admin manages partnerships
**Then** Admin can add, update, or remove partners
**And** Integration status is monitored

## Implementation Priority

### Phase 1: Foundation (Weeks 1-4)
- **Epic 0**: Design System Foundation (Stories 0.1-0.5)
- **Epic 1**: User Authentication & Profiles (Stories 1.1-1.3)

### Phase 2: Core Features (Weeks 5-8)
- **Epic 2**: Beacon Discovery & Browsing (Stories 2.1-2.4)
- **Epic 3**: Beacon Creation & Management (Stories 3.1-3.4)

### Phase 3: Social Features (Weeks 9-12)
- **Epic 4**: Social Features & Communication (Stories 4.1-4.4)
- **Epic 5**: Reliability System & Trust (Stories 5.1-5.4)

### Phase 4: Advanced Features (Weeks 13-16)
- **Epic 6**: Activity Suggestions & Personalization (Stories 6.1-6.4)
- **Epic 7**: Corporate Features & B2B (Stories 7.1-7.4)
- **Epic 8**: Booking Integration & Partnerships (Stories 8.1-8.4)

## Success Metrics

### Epic Completion Criteria
Each epic is considered complete when:
- All stories are implemented and tested
- Acceptance criteria are met
- Performance requirements are satisfied
- User acceptance testing is passed

### Quality Gates
- **Code Coverage**: Minimum 80% for all epics
- **Performance**: Meets NFR requirements
- **Accessibility**: WCAG 2.1 AA compliance
- **Security**: Passes security review

---

**This epic breakdown provides a systematic approach to implementing Beacon Buddy with clear user outcomes and measurable success criteria.**
