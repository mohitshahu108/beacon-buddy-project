# User Stories - Beacon Buddy

**Author:** Mohit_shahu  
**Date:** 2026-03-26  
**Format:** User Story Mapping with Acceptance Criteria

---

## Epic 1: User Authentication & Onboarding

### Story 1.1: Google Sign-In
**As a** new user  
**I want to** sign up using my Google account  
**So that** I can quickly join the platform without remembering another password

**Acceptance Criteria:**
- [ ] User sees "Sign in with Google" button on welcome screen
- [ ] Clicking button opens Google OAuth flow
- [ ] After successful authentication, user is redirected to app
- [ ] User profile is automatically created with Google data
- [ ] User receives welcome notification
- [ ] JWT token is stored securely for future sessions
- [ ] Error handling for failed authentication

**Priority:** High  
**Sprint:** Week 1

---

### Story 1.2: User Profile Setup
**As a** new user  
**I want to** complete my profile setup  
**So that** others can know more about me and I can get better beacon suggestions

**Acceptance Criteria:**
- [ ] Profile setup screen appears after first login
- [ ] User can add/edit name, bio, interests
- [ ] User can set location preferences
- [ ] User can upload profile photo
- [ ] User can set age and gender preferences
- [ ] Profile information is saved and displayed correctly
- [ ] User can skip optional fields and complete later

**Priority:** High  
**Sprint:** Week 1

---

### Story 1.3: Guest Mode Browsing
**As a** potential user  
**I want to** browse beacons without creating an account  
**So that** I can see what activities are available before committing

**Acceptance Criteria:**
- [ ] Guest users can view beacon feed
- [ ] Guest users can apply basic filters
- [ ] Guest users can see beacon details
- [ ] Guest users see prompts to sign up for full features
- [ ] Guest users cannot join or create beacons
- [ ] Clear indication of limited functionality

**Priority:** Medium  
**Sprint:** Week 4

---

## Epic 2: Beacon Discovery & Management

### Story 2.1: Create Beacon
**As an** activity creator  
**I want to** create a new beacon  
**So that** others can join my activity

**Acceptance Criteria:**
- [ ] User sees "Create Beacon" button/FAB
- [ ] Beacon creation form with all required fields
- [ ] User can select activity category
- [ ] User can set date, time, and location
- [ ] User can set participant limits and join policy
- [ ] User can add description and tags
- [ ] Location can be selected via map or text input
- [ ] Beacon is saved and appears in feed
- [ ] Creator receives confirmation

**Priority:** High  
**Sprint:** Week 2

---

### Story 2.2: Beacon Discovery Feed
**As an** activity seeker  
**I want to** see nearby beacons in a feed  
**So that** I can find activities to join

**Acceptance Criteria:**
- [ ] Beacon feed shows nearby activities by default
- [ ] Each beacon card shows title, time, location, participants
- [ ] Cards show creator reliability score
- [ ] Feed updates in real-time
- [ ] Pull-to-refresh functionality
- [ ] Infinite scroll for older beacons
- [ ] Empty state when no beacons available
- [ ] Loading states during data fetch

**Priority:** High  
**Sprint:** Week 2

---

### Story 2.3: Location-Based Filtering
**As an** activity seeker  
**I want to** filter beacons by location and distance  
**So that** I can find activities near me

**Acceptance Criteria:**
- [ ] User can set search radius (5km, 10km, 25km)
- [ ] Filter uses current location by default
- [ ] User can manually set location
- [ ] Distance shown for each beacon
- [ ] Filters persist across app sessions
- [ ] Location permission handling

**Priority:** High  
**Sprint:** Week 2

---

### Story 2.4: Category & Interest Filtering
**As an** activity seeker  
**I want to** filter beacons by category and interests  
**So that** I can find activities I'm interested in

**Acceptance Criteria:**
- [ ] Category filter with multiple selection
- [ ] Categories: Movie, Sports, Food, Park, Other, Gaming, Cultural, etc.
- [ ] Filter shows count of beacons per category
- [ ] User can save favorite filter combinations
- [ ] Filter results update immediately
- [ ] Clear all filters option

**Priority:** Medium  
**Sprint:** Week 6

---

### Story 2.5: Beacon Details View
**As an** activity seeker  
**I want to** see detailed information about a beacon  
**So that** I can decide if I want to join

**Acceptance Criteria:**
- [ ] Full beacon description and details
- [ ] Creator profile with reliability score
- [ ] Current participants list with their scores
- [ ] Map showing exact location
- [ ] Join policy and requirements clearly displayed
- [ ] Cost information (if applicable)
- [ ] Share beacon functionality
- [ ] Report beacon option

**Priority:** High  
**Sprint:** Week 2

---

## Epic 3: Joining & Participation

### Story 3.1: Join Open Beacon
**As an** activity seeker  
**I want to** instantly join open beacons  
**So that** I can participate without waiting for approval

**Acceptance Criteria:**
- [ ] "Join" button clearly visible on beacon details
- [ ] Instant confirmation when joining
- [ ] Added to participants list immediately
- [ ] Creator receives notification
- [ ] Calendar event created (optional)
- [ ] Cannot join if already a participant
- [ ] Cannot join if beacon is full

**Priority:** High  
**Sprint:** Week 3

---

### Story 3.2: Request to Join Personal Beacon
**As an** activity seeker  
**I want to** request to join personal/filtered beacons  
**So that** creators can approve participants

**Acceptance Criteria:**
- [ ] "Request to Join" button for restricted beacons
- [ ] Request form with optional message
- [ ] Request status tracking (pending, approved, rejected)
- [ ] Notifications for status changes
- [ ] Creator can approve/reject requests
- [ ] Can cancel pending requests

**Priority:** High  
**Sprint:** Week 3

---

### Story 3.3: Leave Beacon
**As a** participant  
**I want to** leave a beacon I've joined  
**So that** I can cancel my participation if needed

**Acceptance Criteria:**
- [ ] "Leave" button on joined beacons
- [ ] Confirmation dialog before leaving
- [ ] Removed from participants list
- [ ] Creator receives notification
- [ ] Cannot leave after beacon has started
- [ ] Reliability score impact explained

**Priority:** Medium  
**Sprint:** Week 3

---

### Story 3.4: Mark Attendance
**As a** participant  
**I want to** mark my attendance after an activity  
**So that** my reliability score is updated

**Acceptance Criteria:**
- [ ] Attendance marking available after beacon end time
- [ ] Options: "Attended" or "Couldn't make it"
- [ ] Optional reason for not attending
- [ ] Reliability score updated immediately
- [ ] Score change notification
- [ ] History of attendance records

**Priority:** High  
**Sprint:** Week 3

---

## Epic 4: Reliability System

### Story 4.1: View Reliability Score
**As a** user  
**I want to** see my reliability score and history  
**So that** I understand my reputation on the platform

**Acceptance Criteria:**
- [ ] Score displayed on profile (0-1000)
- [ ] Visual indicator of level (Excellent, Good, Fair, etc.)
- [ ] Score history with changes
- [ ] Explanation of how score is calculated
- [ ] Achievement badges for milestones
- [ ] Comparison with platform average

**Priority:** High  
**Sprint:** Week 3

---

### Story 4.2: Reliability Score Updates
**As a** user  
**I want to** receive notifications when my score changes  
**So that** I understand the impact of my actions

**Acceptance Criteria:**
- [ ] Real-time score change notifications
- [ ] Clear explanation of score change reason
- [ ] Positive reinforcement for good attendance
- [ ] Warning system for low scores
- [ ] Tips to improve reliability score

**Priority:** Medium  
**Sprint:** Week 8

---

### Story 4.3: Dispute Resolution
**As a** user  
**I want to** dispute unfair reliability score changes  
**So that** I can maintain accurate reputation

**Acceptance Criteria:**
- [ ] Dispute creation form for score changes
- [ ] Evidence upload capability
- [ ] Dispute status tracking
- [ ] Admin review process
- [ ] Notification of dispute resolution
- [ ] Score adjustment if dispute approved

**Priority:** Low  
**Sprint:** Week 8

---

## Epic 5: Real-time Communication

### Story 5.1: Beacon Chat
**As a** participant  
**I want to** chat with other participants  
**So that** we can coordinate before the activity

**Acceptance Criteria:**
- [ ] Chat room opens after joining beacon
- [ ] Real-time message delivery
- [ ] Message history visible
- [ ] Messages auto-delete after 24 hours
- [ ] Can send text messages
- [ ] Can share location
- [ ] Can report inappropriate messages
- [ ] Online status indicators

**Priority:** High  
**Sprint:** Week 5

---

### Story 5.2: Push Notifications
**As a** user  
**I want to** receive notifications about beacon activities  
**So that** I don't miss important updates

**Acceptance Criteria:**
- [ ] Notifications for new beacon invitations
- [ ] Notifications for join request approvals
- [ ] Reminders 24 hours before beacon
- [ ] Reminders 1 hour before beacon
- [ ] Notifications for beacon cancellations
- [ ] Chat message notifications when app in background
- [ ] Settings to control notification preferences

**Priority:** High  
**Sprint:** Week 5

---

### Story 5.3: Real-time Updates
**As a** user  
**I want to** see real-time updates in beacon feed  
**So that** I have the latest information

**Acceptance Criteria:**
- [ ] New beacons appear automatically
- [ ] Participant counts update in real-time
- [ ] Beacon status changes update immediately
- [ ] Last seen timestamps
- [ ] Connection status indicators

**Priority:** Medium  
**Sprint:** Week 5

---

## Epic 6: Activity Suggestions

### Story 6.1: Personalized Suggestions
**As an** activity seeker  
**I want to** receive personalized activity suggestions  
**So that** I can discover new experiences

**Acceptance Criteria:**
- [ ] Suggestions based on user interests
- [ ] Suggestions based on past activity history
- [ ] Suggestions based on location preferences
- [ ] "Recommended for you" section
- [ ] One-tap join from suggestions
- [ ] Feedback mechanism on suggestion quality
- [ ] Learning algorithm improves over time

**Priority:** Medium  
**Sprint:** Week 6

---

### Story 6.2: Trending Activities
**As an** activity seeker  
**I want to** see trending activities in my area  
**So that** I can join popular events

**Acceptance Criteria:**
- [ ] "Trending Now" section
- [ ] Based on join rate and completion rate
- [ ] Time-based trending (today, this week)
- [ ] Location-based trending
- [ ] Category-specific trending

**Priority:** Low  
**Sprint:** Week 6

---

## Epic 7: Corporate Features

### Story 7.1: Corporate Account Setup
**As a** business administrator  
**I want to** create a corporate account  
**So that** my company can manage employee activities

**Acceptance Criteria:**
- [ ] Corporate registration form
- [ ] Company verification process
- [ ] Employee invitation system
- [ ] Corporate branding options
- [ ] Subscription plan selection
- [ ] Billing information setup

**Priority:** Medium  
**Sprint:** Week 7

---

### Story 7.2: Employee Management
**As a** corporate administrator  
**I want to** manage employee accounts  
**So that** I can oversee company activities

**Acceptance Criteria:**
- [ ] Employee invitation via email
- [ ] Employee roster management
- [ ] Department/Team organization
- [ ] Permission levels (admin, manager, employee)
- [ ] Employee activity tracking
- [ ] Bulk operations

**Priority:** Medium  
**Sprint:** Week 7

---

### Story 7.3: Corporate Beacon Creation
**As a** corporate administrator  
**I want to** create beacons on behalf of employees  
**So that** I can organize company activities

**Acceptance Criteria:**
- [ ] Corporate beacon creation interface
- [ ] Auto-invite specific employees/departments
- [ ] Company branding on beacons
- [ ] Budget allocation for activities
- [ ] Approval workflows
- [ ] Activity reporting

**Priority:** Medium  
**Sprint:** Week 7

---

### Story 7.4: Corporate Analytics
**As a** corporate administrator  
**I want to** view analytics dashboard  
**So that** I can measure engagement and ROI

**Acceptance Criteria:**
- [ ] Employee participation rates
- [ ] Activity completion rates
- [ ] Department-wise analytics
- [ ] Cost per activity analysis
- [ ] Reliability score trends
- [ ] Export capabilities
- [ ] Custom date range filtering

**Priority:** Medium  
**Sprint:** Week 7

---

## Epic 8: Booking & Payments

### Story 8.1: Partner Venue Integration
**As a** beacon creator  
**I want to** book tickets/reservations through the app  
**So that** I can easily arrange paid activities

**Acceptance Criteria:**
- [ ] Partner venue search
- [ ] Real-time availability checking
- [ ] In-app booking interface
- [ ] Payment processing
- [ ] Booking confirmations
- [ ] Cancellation and refund options
- [ ] Integration with calendar

**Priority:** Low  
**Sprint:** Week 10

---

### Story 8.2: Payment Processing
**As a** user  
**I want to** pay for activities securely  
**So that** I can join paid events

**Acceptance Criteria:**
- [ ] Multiple payment options (cards, UPI, wallets)
- [ ] Secure payment processing
- [ ] Payment history
- [ ] Receipt generation
- [ ] Refund processing
- [ ] Corporate billing options

**Priority:** Low  
**Sprint:** Week 10

---

## Epic 9: Search & Discovery

### Story 9.1: Advanced Search
**As an** activity seeker  
**I want to** search for beacons using keywords  
**So that** I can find specific activities

**Acceptance Criteria:**
- [ ] Search bar with auto-suggestions
- [ ] Search by beacon title, description, tags
- [ ] Search by creator name
- [ ] Search filters (date, location, category)
- [ ] Search history
- [ ] Saved searches
- [ ] No results state with suggestions

**Priority:** Medium  
**Sprint:** Week 6

---

### Story 9.2: Beacon Sharing
**As a** user  
**I want to** share beacons with friends  
**So that** I can invite people to join activities

**Acceptance Criteria:**
- [ ] Share via messaging apps
- [ ] Share via social media
- [ ] Copy link functionality
- [ ] Email sharing
- [ ] QR code generation
- [ ] Custom message with share
- [ ] Tracking of shared beacon joins

**Priority:** Low  
**Sprint:** Week 6

---

## Epic 10: User Management

### Story 10.1: Profile Management
**As a** user  
**I want to** manage my profile information  
**So that** I can keep my details up to date

**Acceptance Criteria:**
- [ ] Edit profile information
- [ ] Change profile photo
- [ ] Update interests and preferences
- [ ] Privacy settings management
- [ ] Notification preferences
- [ ] Account deletion option
- [ ] Data export functionality

**Priority:** Medium  
**Sprint:** Week 1

---

### Story 10.2: Privacy Controls
**As a** user  
**I want to** control my privacy settings  
**So that** I can protect my personal information

**Acceptance Criteria:**
- [ ] Location sharing toggle
- [ ] Profile visibility settings
- [ ] Activity history privacy
- [ ] Block/unblock users
- [ ] Report inappropriate behavior
- [ ] Data retention settings

**Priority:** High  
**Sprint:** Week 1

---

## Epic 11: Performance & Offline

### Story 11.1: Offline Browsing
**As a** user  
**I want to** browse beacons when offline  
**So that** I can use the app without internet

**Acceptance Criteria:**
- [ ] Cached beacon feed for offline viewing
- [ ] Offline indicator
- [ ] Sync when connection restored
- [ ] Offline beacon creation (queued for sync)
- [ ] Cached user profile data

**Priority:** Low  
**Sprint:** Week 9

---

### Story 11.2: Performance Optimization
**As a** user  
**I want** the app to load quickly  
**So that** I have a smooth experience

**Acceptance Criteria:**
- [ ] App startup time < 3 seconds
- [ ] Beacon feed loads < 2 seconds
- [ ] Image lazy loading
- [ ] Efficient memory usage
- [ ] Smooth scrolling
- [ ] Minimal battery usage

**Priority:** Medium  
**Sprint:** Week 9

---

## Epic 12: AI-Powered Features

### Story 12.1: Smart Recommendations
**As a** user  
**I want** AI-powered activity recommendations  
**So that** I discover experiences I'll love

**Acceptance Criteria:**
- [ ] Machine learning model for recommendations
- [ ] Personalized activity suggestions
- [ ] Time-based suggestions (weekend, evening)
- [ ] Social context awareness
- [ ] Feedback loop for improvement
- [ ] Explainable AI (why this was suggested)

**Priority:** Low  
**Sprint:** Week 11

---

### Story 12.2: Activity Pattern Analysis
**As a** user  
**I want** insights about my activity patterns  
**So that** I can understand my preferences

**Acceptance Criteria:**
- [ ] Activity frequency analysis
- [ ] Category preference insights
- [ ] Social interaction patterns
- [ ] Reliability trend analysis
- [ ] Personalized recommendations based on patterns
- [ ] Export insights

**Priority:** Low  
**Sprint:** Week 11

---

## Story Mapping Matrix

| Epic | Total Stories | Week 1 | Week 2 | Week 3 | Week 4 | Week 5 | Week 6 | Week 7 | Week 8 | Week 9 | Week 10 | Week 11 | Week 12 |
|------|---------------|---------|---------|---------|---------|---------|---------|---------|---------|---------|----------|----------|----------|----------|
| Auth & Onboarding | 3 | 2 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| Beacon Discovery | 5 | 0 | 3 | 0 | 0 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 |
| Joining & Participation | 4 | 0 | 0 | 3 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| Reliability System | 3 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | 0 | 0 |
| Real-time Communication | 3 | 0 | 0 | 0 | 0 | 3 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| Activity Suggestions | 2 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 |
| Corporate Features | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 0 | 0 | 0 | 0 | 0 |
| Booking & Payments | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 |
| Search & Discovery | 2 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | 0 | 0 | 0 | 0 |
| User Management | 2 | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| Performance & Offline | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | 0 | 0 |
| AI-Powered Features | 2 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 0 |
| **TOTAL** | **34** | **4** | **3** | **4** | **2** | **3** | **6** | **4** | **2** | **2** | **2** | **2** | **0** |

## Story Priority Breakdown

### High Priority (MVP - Weeks 1-4): 13 stories
- Authentication & profile management
- Core beacon functionality
- Join/leave system
- Basic reliability scoring
- Real-time chat
- Guest mode

### Medium Priority (Growth - Weeks 5-8): 15 stories
- Advanced filtering and search
- Activity suggestions
- Corporate features
- Enhanced reliability system
- Push notifications

### Low Priority (Optimization - Weeks 9-12): 6 stories
- Booking integrations
- AI-powered features
- Performance optimization
- Advanced analytics

## Acceptance Criteria Template

Each story includes detailed acceptance criteria with:
- [ ] Functional requirements
- [ ] UI/UX requirements
- [ ] Performance requirements
- [ ] Error handling
- [ ] Edge cases
- [ ] Accessibility considerations

## Definition of Done

A story is considered complete when:
- [ ] All acceptance criteria are met
- [ ] Code is reviewed and approved
- [ ] Unit tests are written and passing
- [ ] Integration tests are passing
- [ ] UI/UX is approved
- [ ] Documentation is updated
- [ ] Performance benchmarks are met
- [ ] Security requirements are satisfied

This comprehensive user story mapping ensures complete coverage of all Beacon Buddy features with clear acceptance criteria and sprint planning.
