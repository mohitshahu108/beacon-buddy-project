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

### Measurable Outcomes

**User Growth:** 10x increase from 3 to 12 months (300-500 → 3,000-5,000 users)
**Engagement:** 70% beacon completion rate improvement from initial 50-60%
**Revenue Diversification:** User subscriptions + corporate software licensing

## Product Scope

### MVP - Minimum Viable Product

User authentication and profiles, beacon creation and discovery, activity suggestion system, basic reliability scoring, Nagpur city-specific focus only.

### Growth Features (Post-MVP)

Enhanced corporate features, advanced booking integrations, AI travel planning (premium), multi-city expansion.

### Vision (Future)

Corporate software licensing, global activity ecosystem, AI-powered experience discovery platform.

## User Journeys

### Primary User - Introverted Activity Seeker

**Opening Scene:** Raj, 28, software engineer in Nagpur, wants to watch latest movie but friends are busy, feels anxious about going alone

**Rising Action:** Discovers Beacon Buddy, sees movie beacon with 2 others joining, reads their reliability scores (780, 820)

**Climax:** Joins beacon, chats briefly, meets at theater, enjoys movie without social pressure

**Resolution:** Rates experience 5/5, reliability score increases to 755, feels confident joining future activities

### Primary User - Corporate Event Planner

**Opening Scene:** Priya, HR manager at TechCorp, needs team building event for 15 employees, traditional venues are complicated

**Rising Action:** Uses Beacon Buddy corporate dashboard, creates "team movie night" beacon, books group tickets

**Climax:** 12 employees join, automatic reminders sent, event attendance tracked

**Resolution:** Successful team event, Priya uses Beacon Buddy for all future company activities

### Admin User - System Operations

**Opening Scene:** System admin needs to resolve user dispute about no-show reporting

**Rising Action:** Accesses admin dashboard, reviews beacon participation history, adjusts reliability scores

**Climax:** Resolves dispute fairly, sends notification to affected users

**Resolution:** System integrity maintained, user trust preserved

### Journey Requirements Summary

These journeys reveal requirements for:
- **Trust & Safety:** Reliability scoring, dispute resolution, transparent user history
- **Corporate Features:** Dashboard, group booking, employee management, B2B tools
- **Discovery & Matching:** Location-based feed, filtering algorithms, activity suggestions
- **Communication:** Ephemeral chat, notifications, reminders, status updates
- **Booking Integration:** Theater/venue partnerships, ticket purchasing, reservation systems

## Domain-Specific Requirements

### Compliance & Privacy

- **User Data Protection:** Profile information, location data, activity history encryption
- **Content Moderation:** Beacon descriptions, chat content filtering and reporting
- **Age Verification:** For activities with age restrictions (movies, venues)
- **Privacy Controls:** User preferences for location sharing and data visibility

### Technical Constraints

- **Real-time Messaging:** Ephemeral chat with 24-hour deletion, push notifications
- **Geolocation Privacy:** User-controlled location sharing for beacon discovery
- **Scalable Matching:** Location-based beacon feed with filtering algorithms
- **Reliability System Integrity:** Fair scoring mechanisms, dispute resolution workflows

### Integration Requirements

- **Payment Processing:** Premium subscription features, corporate licensing fees
- **Third-party Booking APIs:** Theater, arena, venue reservation systems
- **Push Notification Infrastructure:** Activity reminders, join requests, status updates

### Risk Mitigations

- **User Safety:** Identity verification, reporting systems, user blocking capabilities
- **Fake Beacon Prevention:** Spam detection, content quality controls, rate limiting
- **Reliability Gaming Prevention:** Score manipulation detection, fair attendance tracking
- **Privacy Breach Prevention:** Data encryption, secure access controls, audit logging

## Innovation & Novel Patterns

### Detected Innovation Areas

**1. Pioneer Market Creation**
- **What's unique:** First universal activity coordination platform (no direct competitors)
- **Novel approach:** Activity-centric vs relationship-centric social networking
- **Innovation:** Creating new category rather than entering existing market

**2. Integrated Booking Ecosystem**
- **What's unique:** Combining activity discovery with direct booking/purchasing
- **Novel approach:** One app for discovery AND execution
- **Innovation:** Seamless bridge between social coordination and commerce

**3. AI-Powered Activity Suggestions**
- **What's unique:** Learning user preferences and suggesting novel experiences
- **Novel approach:** Proactive discovery vs reactive searching
- **Innovation:** Personalized activity recommendation engine

**4. Introvert-First Social Design**
- **What's unique:** Social platform designed for low-pressure engagement
- **Novel approach:** Flexible social control (strangers vs close friends)
- **Innovation:** Serving massive underserved market intentionally

### Market Context & Competitive Landscape

**Current Solutions Gaps:**
- **Meetup:** Corporate-focused, requires existing social connections
- **Facebook Events:** Relationship-based, high social pressure
- **Eventbrite:** Ticketing only, no social matching
- **Dating apps:** Relationship-focused, not activity-centered

**Beacon Buddy's Innovation:** Combines social matching + booking + introvert-friendly design + AI suggestions

### Validation Approach

**MVP Validation:**
- **Nagpur city focus** - Test market penetration in controlled geography
- **50-60% completion rate target** - Measure core value proposition
- **Activity suggestion system** - Test AI recommendation effectiveness
- **Corporate pilot program** - Validate B2B market demand

**Risk Mitigation:**
- **Fallback to proven patterns** if activity suggestions underperform
- **Manual curation** backup for AI recommendations
- **Gradual social exposure** options for user comfort

## Mobile App + SaaS B2C Hybrid Specific Requirements

### Project-Type Overview

Beacon Buddy combines mobile-first user experience with enterprise-grade B2B functionality, creating a hybrid platform that serves both individual activity coordination and corporate event management.

### Technical Architecture Considerations

**Mobile App Architecture:**
- **Cross-platform React Native** development for iOS/Android deployment
- **Offline capability** for beacon browsing when connectivity is lost
- **Push notification infrastructure** for activity reminders and join requests
- **Device permissions** for location services, camera access, and contacts
- **Real-time communication** through ephemeral chat with 24-hour deletion

**SaaS B2B Architecture:**
- **Multi-tenant architecture** with corporate data isolation
- **Role-based access control** distinguishing corporate admins from regular users
- **API integration layer** for theater, arena, and venue booking systems
- **Subscription management** for premium AI travel planning features
- **Corporate dashboard** for employee management and beacon analytics

### Implementation Considerations

**Mobile Development:**
- **Platform consistency** across iOS and Android versions
- **Performance optimization** for real-time beacon discovery and matching
- **Battery efficiency** for location-based background processes
- **Secure data storage** for user profiles and reliability scores

**Enterprise Integration:**
- **White-label deployment** options for corporate clients
- **Custom branding** capabilities for company-specific beacon experiences
- **SSO integration** with existing corporate identity systems
- **Compliance adherence** for enterprise data handling requirements

## Project Scoping & Phased Development

### MVP Strategy & Philosophy

**MVP Approach:** Problem-Solving MVP focused on core activity coordination loop and market validation in Nagpur.

**Resource Requirements:**
- **Mobile Development:** React Native developer with Rails API experience
- **Backend Development:** Rails developer with real-time features
- **UI/UX Design:** Mobile-first design with introvert-friendly interface
- **DevOps:** Basic deployment and monitoring for single-region launch

### MVP Feature Set (Phase 1)

**Core User Journeys Supported:**
- **Activity Seeker:** Browse beacons → Join beacon → Complete activity → Rate experience
- **Activity Creator:** Create beacon → Manage participants → Complete activity → Maintain reliability score
- **Guest User:** Browse beacons → Sign up → Join beacon (limited functionality)

**Must-Have Capabilities:**
- **User Authentication:** Google OAuth (existing) + Facebook OAuth
- **Profile Management:** Name, photo, interests, reliability score (750 starting)
- **Beacon Creation:** Activity type, time, location, participant limits, category selection
- **Beacon Discovery:** Location-based feed with distance/category filters
- **Join System:** Instant join for open beacons, request for personal beacons
- **Basic Reliability:** Track attendance, simple point deduction for no-shows
- **Guest Mode:** Browse beacons without account creation
- **Nagpur Geographic Focus:** Single city launch for density and market validation

### Post-MVP Features

**Phase 2 (Post-MVP):**
- Enhanced corporate features with employee management dashboards
- Advanced booking integrations with theaters, arenas, venues
- Multi-city expansion to major Indian metropolitan areas
- Improved reliability scoring with dispute resolution system

**Phase 3 (Expansion):**
- Premium AI travel planning for multi-day trips
- Corporate software licensing and white-label solutions
- Global activity ecosystem with international partner integrations
- Advanced matching algorithms with preference learning

### Risk Mitigation Strategy

**Technical Risks:** Simplify initial real-time features to ensure reliable performance before scaling complexity
**Market Risks:** Focus on Nagpur market penetration first, validate model before geographic expansion
**Resource Risks:** Launch with lean team, prioritize core features over advanced functionality

## Functional Requirements

### User Management

**FR1: Activity Seeker can browse beacons without account**
- As a guest user, browse location-based beacon feed without authentication
- Filter beacons by distance, category, and activity type
- View beacon details including creator reliability scores and participant count

**FR2: Activity Seeker can join open beacons instantly**
- One-tap joining for open beacons without approval process
- Automatic notification to beacon creator about new participant
- Immediate access to beacon chat and participant information

**FR3: Activity Seeker can request to join personal beacons**
- Submit join requests for personal or filtered beacons requiring approval
- Track status of pending requests (approved, denied, expired)
- Notification system for request status changes

**FR4: Activity Creator can create beacons with activity details**
- Create beacons with title, description, activity type, and time
- Set participant limits (2-person vs group) and join policy (open/personal/filtered)
- Select activity category from predefined list (movie, sports, food, park, other)
- Add location details and meeting point information

**FR5: Activity Creator can set participant limits and join policies**
- Define maximum participant count for group beacons
- Configure join requirements (age, gender, hobby filters for filtered beacons)
- Set beacon visibility (public, private, friends-only)
- Manage waitlist and approval workflows for personal beacons

**FR6: Users can report activity completion and no-shows**
- Report attendance status after beacon completion (attended, no-show, cancelled)
- Report no-show participants for reliability score adjustment
- Appeal reliability score changes through dispute resolution system
- View complete attendance history and reliability score trends

**FR7: Users can view and modify reliability scores**
- Display current reliability score (starting at 750) with score history
- Show score breakdown by activity type and completion rate
- Visual indicators of reliability level (excellent, good, needs improvement)
- Profile integration of reliability score display

**FR8: Users can receive activity suggestions based on preferences**
- Receive personalized activity recommendations based on user interests and history
- Browse suggested activities with one-tap creation workflow
- Filter suggestions by location, time availability, and social preferences
- Option to provide feedback on suggestion quality

### Beacon Management

**FR9: Users can share beacon links with close friends**
- Generate shareable links for specific beacons
- Send beacon invitations to close friends via messaging apps
- Control privacy settings for shared beacons (friends-only vs public)
- Track join status for invited friends

**FR10: Corporate admins can manage employee beacons**
- Create and manage beacons on behalf of company accounts
- Set corporate branding and customization options
- View employee participation analytics and completion rates
- Manage company-wide reliability scoring and policies

**FR11: Corporate admins can view analytics and reports**
- Access dashboard with beacon creation, participation, and completion metrics
- Generate reports on employee engagement and reliability scores
- View ROI analytics for corporate beacon investments
- Export data for accounting and compliance purposes

### Communication & Collaboration

**FR12: Users can communicate via ephemeral chat**
- Access chat room after joining beacon (24-hour automatic deletion)
- Send text messages to beacon participants and creators
- Share location updates and status changes within chat
- Block and report inappropriate chat behavior

**FR13: Users can receive push notifications for activity updates**
- Receive notifications for beacon invitations and join requests
- Get reminders for upcoming beacon events (24 hours before, 1 hour before)
- Notifications for beacon status changes (cancelled, full, participant updates)
- Reliability score change notifications and dispute resolutions

### Integration & Ecosystem

**FR14: Users can filter beacons by location and category**
- Apply distance-based filters (within 5km, 10km, 25km)
- Filter by activity categories with multi-select capability
- Sort beacons by relevance, time, and creator reliability
- Save filter preferences and search history

**FR15: Users can access integrated booking for venues and events**
- View partner venue information and availability within beacon details
- One-tap booking integration for movie theaters and event venues
- Automatic payment processing through partner systems
- Sync booking confirmations with calendar applications

## Non-Functional Requirements

### Performance

**NFR1: User actions complete within 2 seconds**
- Beacon discovery, joining, and profile updates must complete within 2 seconds for optimal user experience
- Real-time chat messages deliver within 1 second between participants
- Push notifications deliver within 5 seconds of trigger events

**NFR2: Real-time Updates**
- Beacon status changes (new participants, cancellations, location updates) reflect in user interface within 5 seconds
- Beacon feed updates with new beacons appear within 3 seconds
- Reliability score updates process and display within 10 seconds of activity completion

**NFR3: Concurrent Users**
- System supports 1,000+ simultaneous users in Nagpur region without performance degradation
- Chat infrastructure supports ephemeral messaging for all active beacons simultaneously
- Beacon discovery feed performs efficiently with up to 500 concurrent users in same geographic area

### Security

**NFR4: Data Encryption**
- All user data encrypted at rest using AES-256 encryption standard
- All data in transit encrypted using TLS 1.3 or higher
- User passwords and authentication tokens hashed using bcrypt with salt
- Database connections encrypted using SSL/TLS

**NFR5: Access Control**
- Role-based permissions with audit logging for all admin actions
- Two-factor authentication required for corporate admin accounts
- API rate limiting prevents abuse and protects system resources
- Personal data access requires explicit user consent through granular privacy controls

**NFR6: Privacy Protection**
- Location data shared only with explicit user consent and can be revoked at any time
- Chat messages automatically deleted after 24 hours with no recovery option
- User profile information accessible only to authenticated users and authorized corporate admins
- Activity participation history private by default with user-controlled sharing settings

### Scalability

**NFR7: User Growth**
- System supports 10x user growth without performance degradation from 300 to 5,000 users
- Architecture supports horizontal scaling through load balancers and database replication
- Beacon discovery algorithms optimized for efficient matching with O(n log n) complexity for large user bases

**NFR8: Geographic Expansion**
- Multi-city deployment capability without architecture changes through configurable region settings
- Location-based services automatically adapt to new geographic regions through partner integration
- Performance remains consistent across different geographic regions through CDN deployment

### Accessibility

**NFR9: Mobile-first Design**
- User interface fully functional with touch-only navigation for accessibility
- Text size scalable from 12pt to 24pt for users with visual impairments
- High contrast color scheme support for users with low vision
- Voice navigation and screen reader support for all major app functions

**NFR10: Introvert-friendly Interface**
- Social interaction pressure minimized through default private settings and anonymous browsing options
- Activity suggestions focus on individual experiences rather than social performance metrics
- Reliability scores displayed privately by default with user-controlled visibility settings
