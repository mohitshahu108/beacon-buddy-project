# Development Templates & Code Samples - Beacon Buddy

**Author:** Mohit_shahu  
**Date:** 2026-03-26  
**Purpose**: Ready-to-use code templates for rapid development

---

## Database Migration Templates

### 1. Users Table Enhancements

```ruby
# db/migrate/20260326000001_enhance_users_for_beacon_buddy.rb
class EnhanceUsersForBeaconBuddy < ActiveRecord::Migration[8.1]
  def change
    change_table :users, bulk: true do |t|
      t.integer :reliability_score, default: 750, null: false
      t.decimal :location_lat, precision: 10, scale: 8
      t.decimal :location_lng, precision: 11, scale: 8
      t.string :city
      t.string :phone
      t.date :date_of_birth
      t.text :interests, array: true, default: []
      t.boolean :location_sharing_enabled, default: true
      t.boolean :is_corporate, default: false
      t.bigint :corporate_id
      t.boolean :is_corporate_admin, default: false
      t.string :avatar_url
      t.text :bio
      t.string :gender
      t.integer :age_restriction_preference, default: 18
    end

    add_index :users, :reliability_score
    add_index :users, :location_lat
    add_index :users, :location_lng
    add_index :users, :city
    add_index :users, :corporate_id
    add_index :users, [:location_lat, :location_lng], name: 'index_users_on_location'
  end
end
```

### 2. Beacons Table Enhancements

```ruby
# db/migrate/20260326000002_enhance_beacons_for_beacon_buddy.rb
class EnhanceBeaconsForBeaconBuddy < ActiveRecord::Migration[8.1]
  def change
    change_table :beacons, bulk: true do |t|
      t.decimal :location_lat, precision: 10, scale: 8
      t.decimal :location_lng, precision: 11, scale: 8
      t.string :location_name
      t.string :location_address
      t.integer :age_restriction, default: 18
      t.string :gender_restriction
      t.text :hobby_filters, array: true, default: []
      t.text :description
      t.string :meeting_point
      t.boolean :is_corporate, default: false
      t.bigint :corporate_id
      t.text :cancellation_reason
      t.datetime :cancelled_at
      t.integer :min_participants, default: 2
      t.text :tags, array: true, default: []
      t.string :external_booking_id
      t.string :external_booking_provider
      t.decimal :cost_per_person, precision: 8, scale: 2
      t.string :currency, default: 'INR'
    end

    add_index :beacons, :location_lat
    add_index :beacons, :location_lng
    add_index :beacons, :event_time
    add_index :beacons, :status
    add_index :beacons, :category
    add_index :beacons, :corporate_id
    add_index :beacons, [:location_lat, :location_lng], name: 'index_beacons_on_location'
    add_index :beacons, [:status, :event_time], name: 'index_beacons_on_status_time'
  end
end
```

### 3. Beacon Participants Enhancements

```ruby
# db/migrate/20260326000003_enhance_beacon_participants.rb
class EnhanceBeaconParticipants < ActiveRecord::Migration[8.1]
  def change
    change_table :beacon_participants, bulk: true do |t|
      t.integer :reliability_impact, default: 0
      t.datetime :attended_at
      t.text :status_change_reason
      t.text :no_show_reason
      t.boolean :is_corporate, default: false
      t.bigint :corporate_id
      t.string :payment_status, default: 'pending'
      t.decimal :amount_paid, precision: 8, scale: 2
      t.datetime :payment_completed_at
      t.text :notes
    end

    add_index :beacon_participants, :user_id
    add_index :beacon_participants, :beacon_id
    add_index :beacon_participants, :status
    add_index :beacon_participants, :corporate_id
    add_index :beacon_participants, [:beacon_id, :user_id], unique: true
  end
end
```

### 4. Additional Tables

```ruby
# db/migrate/20260326000004_create_reliability_histories.rb
class CreateReliabilityHistories < ActiveRecord::Migration[8.1]
  def change
    create_table :reliability_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :beacon, null: false, foreign_key: true
      t.integer :score_change, default: 0
      t.integer :previous_score
      t.integer :new_score
      t.string :reason
      t.string :change_type # 'join', 'complete', 'no_show', 'dispute'
      t.text :notes
      t.timestamps
    end

    add_index :reliability_histories, :user_id
    add_index :reliability_histories, :beacon_id
    add_index :reliability_histories, :created_at
  end
end

# db/migrate/20260326000005_create_messages.rb
class CreateMessages < ActiveRecord::Migration[8.1]
  def change
    create_table :messages do |t|
      t.references :beacon, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content, null: false
      t.string :message_type, default: 'text' # 'text', 'location', 'system'
      t.boolean :is_deleted, default: false
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :messages, :beacon_id
    add_index :messages, :user_id
    add_index :messages, :created_at
    add_index :messages, [:beacon_id, :created_at]
  end
end

# db/migrate/20260326000006_create_corporate_accounts.rb
class CreateCorporateAccounts < ActiveRecord::Migration[8.1]
  def change
    create_table :corporate_accounts do |t|
      t.string :name, null: false
      t.string :domain
      t.string :industry
      t.text :address
      t.string :phone
      t.string :email
      t.json :settings, default: {}
      t.string :subscription_plan, default: 'basic'
      t.date :subscription_start_date
      t.date :subscription_end_date
      t.boolean :is_active, default: true
      t.text :billing_address
      t.string :payment_method
      t.timestamps
    end

    add_index :corporate_accounts, :domain
    add_index :corporate_accounts, :subscription_plan
    add_index :corporate_accounts, :is_active
  end
end

# db/migrate/20260326000007_create_disputes.rb
class CreateDisputes < ActiveRecord::Migration[8.1]
  def change
    create_table :disputes do |t|
      t.references :reporter, null: false, foreign_key: { to_table: :users }
      t.references :reported_user, null: false, foreign_key: { to_table: :users }
      t.references :beacon, null: false, foreign_key: true
      t.references :beacon_participant, null: false, foreign_key: true
      t.string :dispute_type, null: false # 'no_show', 'behavior', 'other'
      t.text :description, null: false
      t.string :status, default: 'pending' # 'pending', 'under_review', 'resolved', 'rejected'
      t.text :admin_notes
      t.references :resolved_by, foreign_key: { to_table: :users }
      t.datetime :resolved_at
      t.integer :score_adjustment, default: 0
      t.timestamps
    end

    add_index :disputes, :status
    add_index :disputes, :dispute_type
    add_index :disputes, :created_at
  end
end
```

---

## Model Templates

### 1. Enhanced User Model

```ruby
# app/models/user.rb
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :google_uid, presence: true, uniqueness: true
  validates :reliability_score, numericality: { in: 0..1000 }
  
  has_many :created_beacons, class_name: "Beacon", foreign_key: "creator_id", dependent: :destroy
  has_many :beacon_participants, dependent: :destroy
  has_many :joined_beacons, through: :beacon_participants, source: :beacon
  has_many :reliability_histories, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :created_disputes, class_name: "Dispute", foreign_key: "reporter_id", dependent: :destroy
  has_many :disputes_against, class_name: "Dispute", foreign_key: "reported_user_id", dependent: :nullify
  has_many :resolved_disputes, class_name: "Dispute", foreign_key: "resolved_by_id", dependent: :nullify
  
  belongs_to :corporate_account, optional: true, class_name: "CorporateAccount", foreign_key: "corporate_id"
  
  scope :nearby, ->(lat, lng, radius_km = 25) {
    where(
      "ST_DWithin(ST_MakePoint(location_lng, location_lat)::geography, ST_MakePoint(?, ?)::geography, ?)",
      lng, lat, radius_km * 1000
    )
  }
  
  scope :by_reliability, ->(min_score = 700) { where("reliability_score >= ?", min_score) }
  scope :corporate, -> { where(is_corporate: true) }
  scope :individual, -> { where(is_corporate: false) }
  
  def full_name
    name || email.split('@').first
  end
  
  def reliability_level
    case reliability_score
    when 900..1000 then "Excellent"
    when 800..899 then "Very Good"
    when 700..799 then "Good"
    when 600..699 then "Fair"
    when 0..599 then "Needs Improvement"
    end
  end
  
  def can_join_beacon?(beacon)
    return false if beacon.creator_id == id
    return false if beacon.participants.include?(self)
    return false if beacon.age_restriction && age && age < beacon.age_restriction
    return false if beacon.gender_restriction && gender != beacon.gender_restriction
    return false if beacon.max_participants <= beacon.joined_count
    true
  end
  
  def age
    return nil unless date_of_birth
    ((Date.current - date_of_birth) / 365.25).to_i
  end
  
  def corporate_admin?
    is_corporate && is_corporate_admin
  end
  
  def update_reliability_score!(change, reason, beacon = nil)
    old_score = reliability_score
    new_score = [0, [1000, reliability_score + change].min].max
    
    update!(reliability_score: new_score)
    
    reliability_histories.create!(
      beacon: beacon,
      score_change: change,
      previous_score: old_score,
      new_score: new_score,
      reason: reason,
      change_type: determine_change_type(reason)
    )
    
    new_score
  end
  
  private
  
  def determine_change_type(reason)
    case reason.downcase
    when /join/ then 'join'
    when /complete|attend/ then 'complete'
    when /no.show|absent/ then 'no_show'
    when /dispute/ then 'dispute'
    else 'other'
    end
  end
end
```

### 2. Enhanced Beacon Model

```ruby
# app/models/beacon.rb
class Beacon < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :corporate_account, optional: true, class_name: "CorporateAccount", foreign_key: "corporate_id"
  
  has_many :beacon_participants, dependent: :destroy
  has_many :participants, through: :beacon_participants, source: :user
  has_many :messages, dependent: :destroy
  has_many :disputes, dependent: :destroy
  has_many :reliability_histories, dependent: :nullify
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :category, presence: true
  validates :beacon_type, presence: true
  validates :join_policy, presence: true
  validates :event_time, presence: true
  validates :max_participants, numericality: { greater_than: 0 }
  validates :min_participants, numericality: { greater_than: 0 }
  validates :cost_per_person, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  
  validate :event_time_cannot_be_in_the_past
  validate :min_participants_less_than_max
  
  enum :category, {
    movie: 0,
    sports: 1,
    park: 2,
    food: 3,
    other: 4,
    gaming: 5,
    cultural: 6,
    educational: 7,
    fitness: 8,
    social: 9
  }
  
  enum :beacon_type, {
    two_person: 0,
    group: 1
  }, prefix: :type
  
  enum :join_policy, {
    open: 0,
    personal: 1,
    filtered: 2
  }
  
  enum :status, {
    draft: 0,
    published: 1,
    active: 2,
    completed: 3,
    cancelled: 4,
    archived: 5
  }
  
  scope :active, -> { where(status: :active) }
  scope :published, -> { where(status: :published) }
  scope :upcoming, -> { where("event_time > ?", Time.current) }
  scope :past, -> { where("event_time <= ?", Time.current) }
  scope :nearby, ->(lat, lng, radius_km = 25) {
    where(
      "ST_DWithin(ST_MakePoint(location_lng, location_lat)::geography, ST_MakePoint(?, ?)::geography, ?)",
      lng, lat, radius_km * 1000
    )
  }
  scope :by_category, ->(categories) { where(category: categories) }
  scope :by_reliability, ->(min_score = 700) { joins(:creator).where("users.reliability_score >= ?", min_score) }
  scope :corporate, -> { where(is_corporate: true) }
  scope :individual, -> { where(is_corporate: false) }
  
  def joined_count
    beacon_participants.where(status: :joined).count
  end
  
  def attended_count
    beacon_participants.where(status: :attended).count
  end
  
  def no_show_count
    beacon_participants.where(status: :no_show).count
  end
  
  def is_full?
    joined_count >= max_participants
  end
  
  def can_join?(user)
    return false if user.nil?
    return false if creator_id == user.id
    return false if participants.include?(user)
    return false if is_full?
    return false if event_time.past?
    return false unless user.can_join_beacon?(self)
    true
  end
  
  def join_user!(user)
    return false unless can_join?(user)
    
    beacon_participants.create!(
      user: user,
      status: :joined,
      joined_at: Time.current
    )
    
    update!(current_participants: joined_count) if responded_to?(:current_participants)
    
    # Send notification to creator
    NotificationService.new_beacon_participant(self, user)
    
    true
  end
  
  def complete_user!(user, attended = true)
    participant = beacon_participants.find_by(user: user)
    return false unless participant
    
    status = attended ? :attended : :no_show
    participant.update!(
      status: status,
      attended_at: Time.current
    )
    
    # Update reliability score
    if attended
      user.update_reliability_score!(10, "Attended beacon: #{title}", self)
    else
      user.update_reliability_score!(-50, "No-show for beacon: #{title}", self)
    end
    
    # Check if beacon should be marked as completed
    check_completion_status!
    
    true
  end
  
  def cancel!(reason = nil)
    update!(
      status: :cancelled,
      cancelled_at: Time.current,
      cancellation_reason: reason
    )
    
    # Notify all participants
    participants.each do |participant|
      NotificationService.beacon_cancelled(self, participant)
    end
  end
  
  def upcoming?
    event_time > Time.current
  end
  
  def past?
    event_time <= Time.current
  end
  
  def duration_hours
    return nil unless end_time
    ((end_time - event_time) / 1.hour).round(1)
  end
  
  private
  
  def event_time_cannot_be_in_the_past
    errors.add(:event_time, "can't be in the past") if event_time.present? && event_time.past?
  end
  
  def min_participants_less_than_max
    return unless min_participants && max_participants
    errors.add(:min_participants, "must be less than or equal to max participants") if min_participants > max_participants
  end
  
  def check_completion_status!
    return unless event_time.past?
    return if status.in?([:completed, :cancelled])
    
    if joined_count >= min_participants
      update!(status: :completed)
    else
      update!(status: :cancelled, cancellation_reason: "Insufficient participants")
    end
  end
end
```

### 3. Beacon Participant Model

```ruby
# app/models/beacon_participant.rb
class BeaconParticipant < ApplicationRecord
  belongs_to :beacon
  belongs_to :user
  belongs_to :corporate_account, optional: true, class_name: "CorporateAccount", foreign_key: "corporate_id"
  
  has_many :disputes, dependent: :nullify
  
  validates :beacon_id, uniqueness: { scope: :user_id }
  validates :status, presence: true
  
  enum :status, {
    requested: 0,
    joined: 1,
    attended: 2,
    no_show: 3,
    cancelled: 4
  }
  
  enum :payment_status, {
    pending: 0,
    paid: 1,
    refunded: 2,
    failed: 3
  }
  
  scope :active, -> { where(status: [:requested, :joined]) }
  scope :attended, -> { where(status: :attended) }
  scope :no_shows, -> { where(status: :no_show) }
  
  def approve!
    update!(status: :joined, joined_at: Time.current)
    NotificationService.beacon_join_approved(beacon, user)
  end
  
  def reject!(reason = nil)
    update!(status: :cancelled, status_change_reason: reason)
    NotificationService.beacon_join_rejected(beacon, user, reason)
  end
  
  def mark_attended!
    update!(status: :attended, attended_at: Time.current)
    user.update_reliability_score!(10, "Attended beacon: #{beacon.title}", beacon)
  end
  
  def mark_no_show!(reason = nil)
    update!(status: :no_show, no_show_reason: reason)
    user.update_reliability_score!(-50, "No-show for beacon: #{beacon.title}", beacon)
  end
  
  def can_be_disputed?
    status.in?([:attended, :no_show]) && created_at > 7.days.ago
  end
end
```

---

## Service Object Templates

### 1. Reliability Service

```ruby
# app/services/reliability_service.rb
class ReliabilityService
  class << self
    def calculate_score_change(user, beacon_participant, attended)
      return 0 if beacon_participant.status == 'cancelled'
      
      base_change = attended ? 10 : -50
      
      # Modifiers based on various factors
      modifiers = 0
      
      # Time-based modifier (earlier join = better)
      join_time_diff = beacon_participant.beacon.event_time - beacon_participant.created_at
      if join_time_diff > 24.hours
        modifiers += 5
      elsif join_time_diff > 1.hour
        modifiers += 2
      end
      
      # Beacon type modifier
      if beacon_participant.beacon.type_two_person?
        modifiers += attended ? 5 : -10
      end
      
      # User history modifier
      recent_history = user.beacon_participants.where(created_at: 30.days.ago..)
      attendance_rate = recent_history.attended.count.to_f / recent_history.count
      if attendance_rate > 0.9
        modifiers += 3
      elsif attendance_rate < 0.5
        modifiers -= 5
      end
      
      base_change + modifiers
    end
    
    def update_user_score(user, beacon_participant, attended)
      score_change = calculate_score_change(user, beacon_participant, attended)
      old_score = user.reliability_score
      new_score = [0, [1000, old_score + score_change].min].max
      
      user.update!(reliability_score: new_score)
      
      user.reliability_histories.create!(
        beacon: beacon_participant.beacon,
        score_change: score_change,
        previous_score: old_score,
        new_score: new_score,
        reason: attended ? "Attended beacon" : "No-show for beacon",
        change_type: attended ? "complete" : "no_show"
      )
      
      # Check for level changes
      check_level_achievement(user, old_score, new_score)
      
      new_score
    end
    
    def dispute_adjustment(user, dispute, adjustment_amount)
      old_score = user.reliability_score
      new_score = [0, [1000, old_score + adjustment_amount].min].max
      
      user.update!(reliability_score: new_score)
      
      user.reliability_histories.create!(
        beacon: dispute.beacon,
        score_change: adjustment_amount,
        previous_score: old_score,
        new_score: new_score,
        reason: "Dispute resolution: #{dispute.description}",
        change_type: "dispute"
      )
    end
    
    private
    
    def check_level_achievement(user, old_score, new_score)
      old_level = get_reliability_level(old_score)
      new_level = get_reliability_level(new_score)
      
      if new_level != old_level
        NotificationService.reliability_level_up(user, new_level)
      end
    end
    
    def get_reliability_level(score)
      case score
      when 900..1000 then "Excellent"
      when 800..899 then "Very Good"
      when 700..799 then "Good"
      when 600..699 then "Fair"
      when 0..599 then "Needs Improvement"
      end
    end
  end
end
```

### 2. Beacon Service

```ruby
# app/services/beacon_service.rb
class BeaconService
  class << self
    def discover_beacons(user, filters = {})
      beacons = Beacon.published.upcoming
      
      # Location filtering
      if filters[:lat] && filters[:lng]
        radius = filters[:radius] || 25
        beacons = beacons.nearby(filters[:lat], filters[:lng], radius)
      end
      
      # Category filtering
      if filters[:categories].present?
        beacons = beacons.by_category(filters[:categories])
      end
      
      # Reliability filtering
      if filters[:min_reliability].present?
        beacons = beacons.by_reliability(filters[:min_reliability])
      end
      
      # Time filtering
      if filters[:start_time].present?
        beacons = beacons.where("event_time >= ?", filters[:start_time])
      end
      
      if filters[:end_time].present?
        beacons = beacons.where("event_time <= ?", filters[:end_time])
      end
      
      # Exclude user's own beacons
      beacons = beacons.where.not(creator_id: user&.id) if user.present?
      
      # Exclude beacons user already joined
      beacons = beacons.where.not(id: user&.joined_beacons&.active&.pluck(:id)) if user.present?
      
      # Order by relevance (distance, time, reliability)
      beacons = order_by_relevance(beacons, filters)
      
      beacons.includes(:creator, :participants)
    end
    
    def suggest_activities(user, limit = 10)
      # Get user's interests and history
      user_categories = user.interests || []
      user_history = user.joined_beacons.includes(:beacon)
      
      # Analyze preferences
      category_preferences = analyze_category_preferences(user_history)
      
      # Get potential activities
      suggested_beacons = []
      
      # 1. Based on user's interests
      if user_categories.present?
        interest_beacons = Beacon.published.upcoming
          .by_category(user_categories)
          .where.not(creator_id: user.id)
          .where.not(id: user.joined_beacons.active.pluck(:id))
          .limit(5)
        suggested_beacons.concat(interest_beacons)
      end
      
      # 2. Based on past activity
      if category_preferences.present?
        preferred_categories = category_preferences.sort_by { |_, score| -score }.first(3).map(&:first)
        preference_beacons = Beacon.published.upcoming
          .by_category(preferred_categories)
          .where.not(creator_id: user.id)
          .where.not(id: user.joined_beacons.active.pluck(:id))
          .where.not(id: suggested_beacons.map(&:id))
          .limit(5)
        suggested_beacons.concat(preference_beacons)
      end
      
      # 3. Popular activities in user's area
      if user.location_lat && user.location_lng
        popular_beacons = Beacon.published.upcoming
          .nearby(user.location_lat, user.location_lng, 25)
          .where("joined_count >= ?", 2)
          .where.not(creator_id: user.id)
          .where.not(id: user.joined_beacons.active.pluck(:id))
          .where.not(id: suggested_beacons.map(&:id))
          .limit(3)
        suggested_beacons.concat(popular_beacons)
      end
      
      suggested_beacons.first(limit)
    end
    
    def create_beacon(user, beacon_params)
      beacon = user.created_beacons.build(beacon_params)
      
      # Set default values
      beacon.status = :published
      beacon.current_participants = 0
      
      # Validate business rules
      if beacon.event_time.past?
        return { success: false, errors: ["Event time cannot be in the past"] }
      end
      
      if beacon.save
        # Notify interested users (if location-based)
        if beacon.location_lat && beacon.location_lng
          notify_nearby_users(beacon)
        end
        
        { success: true, beacon: beacon }
      else
        { success: false, errors: beacon.errors.full_messages }
      end
    end
    
    def join_beacon(user, beacon)
      return { success: false, errors: ["Beacon not found"] } unless beacon
      return { success: false, errors: ["Cannot join your own beacon"] } if beacon.creator_id == user.id
      return { success: false, errors: ["Beacon is full"] } if beacon.is_full?
      return { success: false, errors: ["Beacon is not active"] } unless beacon.can_join?(user)
      
      existing_participation = beacon.beacon_participants.find_by(user: user)
      if existing_participation
        return { success: false, errors: ["Already joined this beacon"] }
      end
      
      participant = beacon.beacon_participants.build(
        user: user,
        status: beacon.join_policy == 'open' ? :joined : :requested,
        joined_at: Time.current
      )
      
      if participant.save
        # Update beacon participant count
        beacon.update!(current_participants: beacon.joined_count)
        
        # Send notifications
        if beacon.join_policy == 'open'
          NotificationService.new_beacon_participant(beacon, user)
        else
          NotificationService.beacon_join_request(beacon, user)
        end
        
        { success: true, participant: participant }
      else
        { success: false, errors: participant.errors.full_messages }
      end
    end
    
    private
    
    def order_by_relevance(beacons, filters)
      # Complex ordering based on multiple factors
      if filters[:lat] && filters[:lng]
        # Order by distance first, then by time
        beacons.order(
          "ST_Distance(ST_MakePoint(location_lng, location_lat)::geography, ST_MakePoint(#{filters[:lng]}, #{filters[:lat]})::geography) ASC",
          "event_time ASC"
        )
      else
        beacons.order(event_time: :asc)
      end
    end
    
    def analyze_category_preferences(user_history)
      category_counts = Hash.new(0)
      
      user_history.each do |participation|
        next unless participation.attended?
        category_counts[participation.beacon.category] += 1
      end
      
      category_counts
    end
    
    def notify_nearby_users(beacon)
      nearby_users = User.nearby(beacon.location_lat, beacon.location_lng, 25)
        .where(location_sharing_enabled: true)
        .where.not(id: beacon.creator_id)
      
      nearby_users.each do |user|
        # Check if user might be interested based on preferences
        if should_notify_user?(user, beacon)
          NotificationService.new_nearby_beacon(user, beacon)
        end
      end
    end
    
    def should_notify_user?(user, beacon)
      # Simple logic - can be enhanced with ML
      return true if user.interests.include?(beacon.category.to_s)
      return true if user.joined_beacons.where(category: beacon.category).exists?
      false
    end
  end
end
```

### 3. Notification Service

```ruby
# app/services/notification_service.rb
class NotificationService
  class << self
    def new_beacon_participant(beacon, user)
      # In-app notification
      create_notification(
        recipient: beacon.creator,
        title: "New Beacon Participant",
        message: "#{user.full_name} joined your beacon: #{beacon.title}",
        data: { type: 'beacon_participant', beacon_id: beacon.id, user_id: user.id }
      )
      
      # Push notification
      send_push_notification(
        user: beacon.creator,
        title: "New Beacon Participant",
        message: "#{user.full_name} joined your beacon: #{beacon.title}",
        data: { beacon_id: beacon.id }
      )
    end
    
    def beacon_join_request(beacon, user)
      create_notification(
        recipient: beacon.creator,
        title: "Beacon Join Request",
        message: "#{user.full_name} wants to join your beacon: #{beacon.title}",
        data: { type: 'join_request', beacon_id: beacon.id, user_id: user.id }
      )
      
      send_push_notification(
        user: beacon.creator,
        title: "Join Request",
        message: "#{user.full_name} wants to join your beacon",
        data: { beacon_id: beacon.id }
      )
    end
    
    def beacon_join_approved(beacon, user)
      create_notification(
        recipient: user,
        title: "Join Request Approved",
        message: "You've been approved to join: #{beacon.title}",
        data: { type: 'join_approved', beacon_id: beacon.id }
      )
      
      send_push_notification(
        user: user,
        title: "Join Approved",
        message: "You're in! Join the beacon: #{beacon.title}",
        data: { beacon_id: beacon.id }
      )
    end
    
    def beacon_join_rejected(beacon, user, reason)
      create_notification(
        recipient: user,
        title: "Join Request Rejected",
        message: "Your request to join #{beacon.title} was rejected#{reason ? ": #{reason}" : ""}",
        data: { type: 'join_rejected', beacon_id: beacon.id }
      )
    end
    
    def beacon_cancelled(beacon, user)
      create_notification(
        recipient: user,
        title: "Beacon Cancelled",
        message: "#{beacon.title} has been cancelled",
        data: { type: 'beacon_cancelled', beacon_id: beacon.id }
      )
      
      send_push_notification(
        user: user,
        title: "Beacon Cancelled",
        message: "#{beacon.title} has been cancelled",
        data: { beacon_id: beacon.id }
      )
    end
    
    def beacon_reminder(beacon, user, hours_before)
      create_notification(
        recipient: user,
        title: "Beacon Reminder",
        message: "#{beacon.title} starts in #{hours_before} hours",
        data: { type: 'beacon_reminder', beacon_id: beacon.id }
      )
      
      send_push_notification(
        user: user,
        title: "Beacon Reminder",
        message: "#{beacon.title} starts in #{hours_before} hours",
        data: { beacon_id: beacon.id }
      )
    end
    
    def reliability_level_up(user, new_level)
      create_notification(
        recipient: user,
        title: "Reliability Level Up!",
        message: "Your reliability score is now #{new_level}!",
        data: { type: 'reliability_level_up', level: new_level }
      )
      
      send_push_notification(
        user: user,
        title: "Reliability Level Up!",
        message: "Congratulations! Your reliability level is now #{new_level}",
        data: { type: 'reliability_level_up' }
      )
    end
    
    def new_nearby_beacon(user, beacon)
      create_notification(
        recipient: user,
        title: "New Nearby Beacon",
        message: "#{beacon.title} is happening near you",
        data: { type: 'nearby_beacon', beacon_id: beacon.id }
      )
      
      send_push_notification(
        user: user,
        title: "New Nearby Beacon",
        message: "#{beacon.title} is happening near you",
        data: { beacon_id: beacon.id }
      )
    end
    
    private
    
    def create_notification(recipient:, title:, message:, data:)
      Notification.create!(
        recipient: recipient,
        title: title,
        message: message,
        data: data,
        read: false
      )
    end
    
    def send_push_notification(user:, title:, message:, data: {})
      # Integration with FCM/APNS would go here
      # For now, just log the notification
      Rails.logger.info "Push notification to #{user.email}: #{title} - #{message}"
    end
  end
end
```

---

## Controller Templates

### 1. Enhanced Beacons Controller

```ruby
# app/controllers/api/v1/beacons_controller.rb
class Api::V1::BeaconsController < Api::V1::BaseController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_beacon, only: [:show, :update, :destroy, :join, :leave, :complete]
  before_action :authorize_beacon!, only: [:update, :destroy]
  
  def index
    filters = beacon_filters
    @beacons = BeaconService.discover_beacons(current_user, filters)
    
    render json: {
      success: true,
      data: @beacons.map { |beacon| BeaconSerializer.new(beacon, current_user: current_user).as_json },
      meta: {
        count: @beacons.count,
        filters: filters
      }
    }
  end
  
  def show
    render json: {
      success: true,
      data: BeaconSerializer.new(@beacon, current_user: current_user).as_json
    }
  end
  
  def create
    result = BeaconService.create_beacon(current_user, beacon_params)
    
    if result[:success]
      render json: {
        success: true,
        data: BeaconSerializer.new(result[:beacon], current_user: current_user).as_json
      }, status: :created
    else
      render json: {
        success: false,
        error: {
          code: 'VALIDATION_ERROR',
          message: 'Invalid beacon data',
          details: result[:errors]
        }
      }, status: :unprocessable_entity
    end
  end
  
  def update
    if @beacon.update(beacon_update_params)
      render json: {
        success: true,
        data: BeaconSerializer.new(@beacon, current_user: current_user).as_json
      }
    else
      render json: {
        success: false,
        error: {
          code: 'VALIDATION_ERROR',
          message: 'Invalid beacon data',
          details: @beacon.errors.full_messages
        }
      }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @beacon.cancel!(params[:reason])
    
    render json: {
      success: true,
      message: 'Beacon cancelled successfully'
    }
  end
  
  def join
    result = BeaconService.join_beacon(current_user, @beacon)
    
    if result[:success]
      render json: {
        success: true,
        data: BeaconParticipantSerializer.new(result[:participant]).as_json
      }
    else
      render json: {
        success: false,
        error: {
          code: 'JOIN_ERROR',
          message: 'Cannot join beacon',
          details: result[:errors]
        }
      }, status: :unprocessable_entity
    end
  end
  
  def leave
    participant = @beacon.beacon_participants.find_by(user: current_user)
    
    if participant&.destroy
      render json: {
        success: true,
        message: 'Left beacon successfully'
      }
    else
      render json: {
        success: false,
        error: {
          code: 'LEAVE_ERROR',
          message: 'Cannot leave beacon'
        }
      }, status: :unprocessable_entity
    end
  end
  
  def complete
    participant = @beacon.beacon_participants.find_by(user: current_user)
    attended = params[:attended] == 'true'
    
    if participant&.mark_attended! if attended || participant&.mark_no_show!(params[:reason])
      render json: {
        success: true,
        message: "Beacon marked as #{attended ? 'attended' : 'no-show'}"
      }
    else
      render json: {
        success: false,
        error: {
          code: 'COMPLETE_ERROR',
          message: 'Cannot complete beacon'
        }
      }, status: :unprocessable_entity
    end
  end
  
  def suggestions
    @suggested_beacons = BeaconService.suggest_activities(current_user)
    
    render json: {
      success: true,
      data: @suggested_beacons.map { |beacon| BeaconSerializer.new(beacon, current_user: current_user).as_json }
    }
  end
  
  private
  
  def set_beacon
    @beacon = Beacon.find(params[:id])
  end
  
  def authorize_beacon!
    authorize @beacon, :update?
  end
  
  def beacon_params
    params.require(:beacon).permit(
      :title,
      :description,
      :category,
      :beacon_type,
      :join_policy,
      :event_time,
      :location_lat,
      :location_lng,
      :location_name,
      :location_address,
      :max_participants,
      :min_participants,
      :age_restriction,
      :gender_restriction,
      :hobby_filters,
      :tags,
      :cost_per_person,
      :currency,
      :meeting_point
    )
  end
  
  def beacon_update_params
    params.require(:beacon).permit(
      :title,
      :description,
      :event_time,
      :location_lat,
      :location_lng,
      :location_name,
      :location_address,
      :max_participants,
      :min_participants,
      :age_restriction,
      :gender_restriction,
      :hobby_filters,
      :tags,
      :cost_per_person,
      :currency,
      :meeting_point
    )
  end
  
  def beacon_filters
    params.permit(
      :lat,
      :lng,
      :radius,
      :start_time,
      :end_time,
      :min_reliability,
      categories: []
    )
  end
end
```

---

## React Native Component Templates

### 1. Beacon Card Component

```jsx
// src/components/beacon/BeaconCard.jsx
import React from 'react';
import { View, Text, TouchableOpacity, StyleSheet, Image } from 'react-native';
import { MaterialIcons } from '@expo/vector-icons';
import { formatDistanceToNow } from 'date-fns';

const BeaconCard = ({ beacon, onPress, currentUserId }) => {
  const isCreator = beacon.creator.id === currentUserId;
  const hasJoined = beacon.participants.some(p => p.user.id === currentUserId);
  const isFull = beacon.joined_count >= beacon.max_participants;
  
  const getCategoryIcon = (category) => {
    const icons = {
      movie: 'movie',
      sports: 'sports-soccer',
      food: 'restaurant',
      park: 'park',
      other: 'event'
    };
    return icons[category] || 'event';
  };
  
  const getReliabilityColor = (score) => {
    if (score >= 800) return '#4CAF50';
    if (score >= 600) return '#FF9800';
    return '#F44336';
  };
  
  return (
    <TouchableOpacity style={styles.card} onPress={() => onPress(beacon)}>
      <View style={styles.header}>
        <View style={styles.categoryIcon}>
          <MaterialIcons 
            name={getCategoryIcon(beacon.category)} 
            size={24} 
            color="#6366F1" 
          />
        </View>
        <View style={styles.titleContainer}>
          <Text style={styles.title} numberOfLines={1}>
            {beacon.title}
          </Text>
          <Text style={styles.category}>
            {beacon.category.charAt(0).toUpperCase() + beacon.category.slice(1)}
          </Text>
        </View>
        <View style={styles.statusContainer}>
          {(isCreator || hasJoined) && (
            <View style={[styles.statusBadge, styles.joined]}>
              <Text style={styles.statusText}>
                {isCreator ? 'Created' : 'Joined'}
              </Text>
            </View>
          )}
          {isFull && !isCreator && !hasJoined && (
            <View style={[styles.statusBadge, styles.full]}>
              <Text style={styles.statusText}>Full</Text>
            </View>
          )}
        </View>
      </View>
      
      <Text style={styles.description} numberOfLines={2}>
        {beacon.description}
      </Text>
      
      <View style={styles.infoRow}>
        <View style={styles.infoItem}>
          <MaterialIcons name="schedule" size={16} color="#666" />
          <Text style={styles.infoText}>
            {formatDistanceToNow(new Date(beacon.event_time), { addSuffix: true })}
          </Text>
        </View>
        <View style={styles.infoItem}>
          <MaterialIcons name="group" size={16} color="#666" />
          <Text style={styles.infoText}>
            {beacon.joined_count}/{beacon.max_participants}
          </Text>
        </View>
      </View>
      
      <View style={styles.locationRow}>
        <MaterialIcons name="location-on" size={16} color="#666" />
        <Text style={styles.locationText} numberOfLines={1}>
          {beacon.location_name || 'Location not specified'}
        </Text>
      </View>
      
      <View style={styles.creatorRow}>
        <Image 
          source={{ uri: beacon.creator.avatar_url || 'https://via.placeholder.com/40' }} 
          style={styles.creatorAvatar} 
        />
        <View style={styles.creatorInfo}>
          <Text style={styles.creatorName}>{beacon.creator.full_name}</Text>
          <View style={styles.reliabilityContainer}>
            <Text style={[
              styles.reliabilityScore,
              { color: getReliabilityColor(beacon.creator.reliability_score) }
            ]}>
              {beacon.creator.reliability_score}
            </Text>
            <Text style={styles.reliabilityLabel}>Reliability</Text>
          </View>
        </View>
      </View>
      
      {beacon.cost_per_person && (
        <View style={styles.costRow}>
          <MaterialIcons name="payments" size={16} color="#666" />
          <Text style={styles.costText}>
            ₹{beacon.cost_per_person} per person
          </Text>
        </View>
      )}
    </TouchableOpacity>
  );
};

const styles = StyleSheet.create({
  card: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    marginVertical: 8,
    marginHorizontal: 16,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 12,
  },
  categoryIcon: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: '#F3F4F6',
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 12,
  },
  titleContainer: {
    flex: 1,
  },
  title: {
    fontSize: 18,
    fontWeight: '600',
    color: '#1F2937',
    marginBottom: 2,
  },
  category: {
    fontSize: 14,
    color: '#6B7280',
  },
  statusContainer: {
    marginLeft: 8,
  },
  statusBadge: {
    paddingHorizontal: 8,
    paddingVertical: 4,
    borderRadius: 12,
  },
  joined: {
    backgroundColor: '#D1FAE5',
  },
  full: {
    backgroundColor: '#FEE2E2',
  },
  statusText: {
    fontSize: 12,
    fontWeight: '500',
  },
  description: {
    fontSize: 14,
    color: '#4B5563',
    marginBottom: 12,
    lineHeight: 20,
  },
  infoRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: 8,
  },
  infoItem: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  infoText: {
    fontSize: 14,
    color: '#6B7280',
    marginLeft: 4,
  },
  locationRow: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 12,
  },
  locationText: {
    fontSize: 14,
    color: '#6B7280',
    marginLeft: 4,
    flex: 1,
  },
  creatorRow: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 8,
  },
  creatorAvatar: {
    width: 32,
    height: 32,
    borderRadius: 16,
    marginRight: 8,
  },
  creatorInfo: {
    flex: 1,
  },
  creatorName: {
    fontSize: 14,
    fontWeight: '500',
    color: '#1F2937',
  },
  reliabilityContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    marginTop: 2,
  },
  reliabilityScore: {
    fontSize: 12,
    fontWeight: '600',
    marginRight: 4,
  },
  reliabilityLabel: {
    fontSize: 12,
    color: '#6B7280',
  },
  costRow: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingTop: 8,
    borderTopWidth: 1,
    borderTopColor: '#F3F4F6',
  },
  costText: {
    fontSize: 14,
    color: '#6B7280',
    marginLeft: 4,
    fontWeight: '500',
  },
});

export default BeaconCard;
```

### 2. Beacon Feed Screen

```jsx
// src/screens/BeaconFeedScreen.jsx
import React, { useState, useEffect, useCallback } from 'react';
import {
  View,
  Text,
  FlatList,
  RefreshControl,
  TouchableOpacity,
  StyleSheet,
  ActivityIndicator,
  TextInput,
} from 'react-native';
import { MaterialIcons } from '@expo/vector-icons';
import { useDispatch, useSelector } from 'react-redux';
import BeaconCard from '../components/beacon/BeaconCard';
import FilterModal from '../components/beacon/FilterModal';
import { fetchBeacons, setFilters } from '../store/slices/beaconSlice';
import { useNavigation } from '@react-navigation/native';

const BeaconFeedScreen = () => {
  const dispatch = useDispatch();
  const navigation = useNavigation();
  const { 
    beacons, 
    loading, 
    filters, 
    hasMore, 
    page 
  } = useSelector(state => state.beacons);
  const { user } = useSelector(state => state.auth);
  
  const [refreshing, setRefreshing] = useState(false);
  const [showFilters, setShowFilters] = useState(false);
  const [searchQuery, setSearchQuery] = useState('');
  
  useEffect(() => {
    dispatch(fetchBeacons({ page: 1, filters, refresh: true }));
  }, [filters]);
  
  const handleRefresh = useCallback(() => {
    setRefreshing(true);
    dispatch(fetchBeacons({ page: 1, filters, refresh: true }))
      .finally(() => setRefreshing(false));
  }, [dispatch, filters]);
  
  const handleLoadMore = useCallback(() => {
    if (!loading && hasMore) {
      dispatch(fetchBeacons({ page: page + 1, filters }));
    }
  }, [dispatch, loading, hasMore, page, filters]);
  
  const handleBeaconPress = useCallback((beacon) => {
    navigation.navigate('BeaconDetail', { beaconId: beacon.id });
  }, [navigation]);
  
  const handleCreateBeacon = useCallback(() => {
    navigation.navigate('CreateBeacon');
  }, [navigation]);
  
  const handleFilterApply = useCallback((newFilters) => {
    dispatch(setFilters(newFilters));
    setShowFilters(false);
  }, [dispatch]);
  
  const renderBeacon = useCallback(({ item }) => (
    <BeaconCard 
      beacon={item} 
      onPress={handleBeaconPress}
      currentUserId={user?.id}
    />
  ), [handleBeaconPress, user?.id]);
  
  const renderEmptyState = () => (
    <View style={styles.emptyState}>
      <MaterialIcons name="explore" size={64} color="#9CA3AF" />
      <Text style={styles.emptyTitle}>No beacons found</Text>
      <Text style={styles.emptyDescription}>
        Try adjusting your filters or create your own beacon
      </Text>
      <TouchableOpacity 
        style={styles.createButton}
        onPress={handleCreateBeacon}
      >
        <Text style={styles.createButtonText}>Create Beacon</Text>
      </TouchableOpacity>
    </View>
  );
  
  const renderFooter = () => {
    if (!loading) return null;
    return (
      <View style={styles.footer}>
        <ActivityIndicator size="small" color="#6366F1" />
      </View>
    );
  };
  
  return (
    <View style={styles.container}>
      <View style={styles.header}>
        <View style={styles.searchContainer}>
          <MaterialIcons name="search" size={20} color="#6B7280" />
          <TextInput
            style={styles.searchInput}
            placeholder="Search beacons..."
            value={searchQuery}
            onChangeText={setSearchQuery}
            placeholderTextColor="#9CA3AF"
          />
        </View>
        <TouchableOpacity 
          style={styles.filterButton}
          onPress={() => setShowFilters(true)}
        >
          <MaterialIcons name="filter-list" size={20} color="#6366F1" />
        </TouchableOpacity>
      </View>
      
      <FlatList
        data={beacons}
        renderItem={renderBeacon}
        keyExtractor={(item) => item.id.toString()}
        refreshControl={
          <RefreshControl refreshing={refreshing} onRefresh={handleRefresh} />
        }
        onEndReached={handleLoadMore}
        onEndReachedThreshold={0.1}
        ListEmptyComponent={renderEmptyState}
        ListFooterComponent={renderFooter}
        contentContainerStyle={beacons.length === 0 ? styles.emptyList : styles.list}
        showsVerticalScrollIndicator={false}
      />
      
      <TouchableOpacity 
        style={styles.fab}
        onPress={handleCreateBeacon}
      >
        <MaterialIcons name="add" size={24} color="#FFFFFF" />
      </TouchableOpacity>
      
      <FilterModal
        visible={showFilters}
        filters={filters}
        onApply={handleFilterApply}
        onClose={() => setShowFilters(false)}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F9FAFB',
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    padding: 16,
    backgroundColor: '#FFFFFF',
    borderBottomWidth: 1,
    borderBottomColor: '#E5E7EB',
  },
  searchContainer: {
    flex: 1,
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#F3F4F6',
    borderRadius: 8,
    paddingHorizontal: 12,
    paddingVertical: 8,
    marginRight: 12,
  },
  searchInput: {
    flex: 1,
    marginLeft: 8,
    fontSize: 16,
    color: '#1F2937',
  },
  filterButton: {
    width: 40,
    height: 40,
    borderRadius: 8,
    backgroundColor: '#F3F4F6',
    justifyContent: 'center',
    alignItems: 'center',
  },
  list: {
    paddingBottom: 80,
  },
  emptyList: {
    flexGrow: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  emptyState: {
    alignItems: 'center',
    paddingHorizontal: 32,
  },
  emptyTitle: {
    fontSize: 20,
    fontWeight: '600',
    color: '#1F2937',
    marginTop: 16,
    marginBottom: 8,
  },
  emptyDescription: {
    fontSize: 16,
    color: '#6B7280',
    textAlign: 'center',
    marginBottom: 24,
  },
  createButton: {
    backgroundColor: '#6366F1',
    paddingHorizontal: 24,
    paddingVertical: 12,
    borderRadius: 8,
  },
  createButtonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: '600',
  },
  footer: {
    paddingVertical: 20,
    alignItems: 'center',
  },
  fab: {
    position: 'absolute',
    bottom: 24,
    right: 24,
    width: 56,
    height: 56,
    borderRadius: 28,
    backgroundColor: '#6366F1',
    justifyContent: 'center',
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.25,
    shadowRadius: 4,
    elevation: 5,
  },
});

export default BeaconFeedScreen;
```

---

## Redux Store Templates

### 1. Beacon Slice

```javascript
// src/store/slices/beaconSlice.js
import { createSlice, createAsyncThunk } from '@reduxjs/toolkit';
import { api } from '../services/api';

// Async thunks
export const fetchBeacons = createAsyncThunk(
  'beacons/fetchBeacons',
  async ({ page = 1, filters = {}, refresh = false }, { rejectWithValue }) => {
    try {
      const params = new URLSearchParams();
      
      if (filters.lat) params.append('lat', filters.lat);
      if (filters.lng) params.append('lng', filters.lng);
      if (filters.radius) params.append('radius', filters.radius);
      if (filters.categories?.length) {
        filters.categories.forEach(cat => params.append('categories[]', cat));
      }
      if (filters.min_reliability) params.append('min_reliability', filters.min_reliability);
      if (filters.start_time) params.append('start_time', filters.start_time);
      if (filters.end_time) params.append('end_time', filters.end_time);
      
      params.append('page', page);
      
      const response = await api.get(`/beacons?${params}`);
      
      return {
        beacons: response.data.data,
        page,
        hasMore: response.data.data.length > 0,
        refresh,
      };
    } catch (error) {
      return rejectWithValue(error.response?.data?.error?.message || 'Failed to fetch beacons');
    }
  }
);

export const joinBeacon = createAsyncThunk(
  'beacons/joinBeacon',
  async (beaconId, { rejectWithValue }) => {
    try {
      const response = await api.post(`/beacons/${beaconId}/join`);
      return { beaconId, participant: response.data.data };
    } catch (error) {
      return rejectWithValue(error.response?.data?.error?.message || 'Failed to join beacon');
    }
  }
);

export const leaveBeacon = createAsyncThunk(
  'beacons/leaveBeacon',
  async (beaconId, { rejectWithValue }) => {
    try {
      await api.post(`/beacons/${beaconId}/leave`);
      return beaconId;
    } catch (error) {
      return rejectWithValue(error.response?.data?.error?.message || 'Failed to leave beacon');
    }
  }
);

export const createBeacon = createAsyncThunk(
  'beacons/createBeacon',
  async (beaconData, { rejectWithValue }) => {
    try {
      const response = await api.post('/beacons', { beacon: beaconData });
      return response.data.data;
    } catch (error) {
      return rejectWithValue(error.response?.data?.error?.message || 'Failed to create beacon');
    }
  }
);

export const fetchBeaconSuggestions = createAsyncThunk(
  'beacons/fetchSuggestions',
  async (_, { rejectWithValue }) => {
    try {
      const response = await api.get('/beacons/suggestions');
      return response.data.data;
    } catch (error) {
      return rejectWithValue(error.response?.data?.error?.message || 'Failed to fetch suggestions');
    }
  }
);

// Initial state
const initialState = {
  beacons: [],
  suggestions: [],
  loading: false,
  refreshing: false,
  error: null,
  page: 1,
  hasMore: true,
  filters: {
    lat: null,
    lng: null,
    radius: 25,
    categories: [],
    min_reliability: null,
    start_time: null,
    end_time: null,
  },
};

// Slice
const beaconSlice = createSlice({
  name: 'beacons',
  initialState,
  reducers: {
    setFilters: (state, action) => {
      state.filters = { ...state.filters, ...action.payload };
      state.page = 1;
      state.hasMore = true;
    },
    clearFilters: (state) => {
      state.filters = initialState.filters;
      state.page = 1;
      state.hasMore = true;
    },
    updateBeacon: (state, action) => {
      const { beaconId, updates } = action.payload;
      const index = state.beacons.findIndex(beacon => beacon.id === beaconId);
      if (index !== -1) {
        state.beacons[index] = { ...state.beacons[index], ...updates };
      }
    },
    removeBeacon: (state, action) => {
      const beaconId = action.payload;
      state.beacons = state.beacons.filter(beacon => beacon.id !== beaconId);
    },
    clearError: (state) => {
      state.error = null;
    },
  },
  extraReducers: (builder) => {
    builder
      // Fetch beacons
      .addCase(fetchBeacons.pending, (state, action) => {
        if (action.meta.arg.refresh) {
          state.refreshing = true;
        } else {
          state.loading = true;
        }
        state.error = null;
      })
      .addCase(fetchBeacons.fulfilled, (state, action) => {
        const { beacons, page, hasMore, refresh } = action.payload;
        
        if (refresh || page === 1) {
          state.beacons = beacons;
        } else {
          state.beacons = [...state.beacons, ...beacons];
        }
        
        state.page = page;
        state.hasMore = hasMore;
        state.loading = false;
        state.refreshing = false;
      })
      .addCase(fetchBeacons.rejected, (state, action) => {
        state.loading = false;
        state.refreshing = false;
        state.error = action.payload;
      })
      
      // Join beacon
      .addCase(joinBeacon.pending, (state) => {
        state.loading = true;
        state.error = null;
      })
      .addCase(joinBeacon.fulfilled, (state, action) => {
        const { beaconId, participant } = action.payload;
        const beacon = state.beacons.find(b => b.id === beaconId);
        if (beacon) {
          beacon.participants.push(participant);
          beacon.joined_count += 1;
        }
        state.loading = false;
      })
      .addCase(joinBeacon.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload;
      })
      
      // Leave beacon
      .addCase(leaveBeacon.pending, (state) => {
        state.loading = true;
        state.error = null;
      })
      .addCase(leaveBeacon.fulfilled, (state, action) => {
        const beaconId = action.payload;
        const beacon = state.beacons.find(b => b.id === beaconId);
        if (beacon) {
          beacon.participants = beacon.participants.filter(
            p => p.user.id !== state.auth.user.id
          );
          beacon.joined_count -= 1;
        }
        state.loading = false;
      })
      .addCase(leaveBeacon.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload;
      })
      
      // Create beacon
      .addCase(createBeacon.pending, (state) => {
        state.loading = true;
        state.error = null;
      })
      .addCase(createBeacon.fulfilled, (state, action) => {
        state.beacons.unshift(action.payload);
        state.loading = false;
      })
      .addCase(createBeacon.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload;
      })
      
      // Fetch suggestions
      .addCase(fetchBeaconSuggestions.pending, (state) => {
        state.loading = true;
        state.error = null;
      })
      .addCase(fetchBeaconSuggestions.fulfilled, (state, action) => {
        state.suggestions = action.payload;
        state.loading = false;
      })
      .addCase(fetchBeaconSuggestions.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload;
      });
  },
});

export const {
  setFilters,
  clearFilters,
  updateBeacon,
  removeBeacon,
  clearError,
} = beaconSlice.actions;

export default beaconSlice.reducer;
```

---

## Testing Templates

### 1. Model Tests

```ruby
# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  
  describe 'associations' do
    it { should have_many(:created_beacons).class_name('Beacon').dependent(:destroy) }
    it { should have_many(:beacon_participants).dependent(:destroy) }
    it { should have_many(:joined_beacons).through(:beacon_participants).source(:beacon) }
    it { should have_many(:reliability_histories).dependent(:destroy) }
    it { should belong_to(:corporate_account).optional }
  end
  
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:google_uid) }
    it { should validate_uniqueness_of(:google_uid) }
    it { should validate_numericality_of(:reliability_score).is_in(0..1000) }
  end
  
  describe 'scopes' do
    let!(:user1) { create(:user, reliability_score: 850, location_lat: 21.1463, location_lng: 79.0849) }
    let!(:user2) { create(:user, reliability_score: 650, location_lat: 21.1563, location_lng: 79.0949) }
    let!(:user3) { create(:user, reliability_score: 750, location_lat: 19.0760, location_lng: 72.8777) }
    
    it 'returns users by reliability score' do
      reliable_users = User.by_reliability(700)
      expect(reliable_users).to include(user1, user3)
      expect(reliable_users).not_to include(user2)
    end
    
    it 'returns nearby users' do
      nearby_users = User.nearby(21.1463, 79.0849, 25)
      expect(nearby_users).to include(user1, user2)
      expect(nearby_users).not_to include(user3)
    end
  end
  
  describe 'methods' do
    describe '#full_name' do
      it 'returns name if present' do
        user.update!(name: 'John Doe')
        expect(user.full_name).to eq('John Doe')
      end
      
      it 'returns email prefix if name is blank' do
        user.update!(name: nil, email: 'john@example.com')
        expect(user.full_name).to eq('john')
      end
    end
    
    describe '#reliability_level' do
      it 'returns correct level for different scores' do
        user.update!(reliability_score: 950)
        expect(user.reliability_level).to eq('Excellent')
        
        user.update!(reliability_score: 750)
        expect(user.reliability_level).to eq('Good')
        
        user.update!(reliability_score: 550)
        expect(user.reliability_level).to eq('Needs Improvement')
      end
    end
    
    describe '#can_join_beacon?' do
      let(:beacon) { create(:beacon, max_participants: 2) }
      
      it 'returns false for beacon creator' do
        expect(user.can_join_beacon?(beacon)).to be false
      end
      
      it 'returns false for already joined beacon' do
        create(:beacon_participant, beacon: beacon, user: user)
        expect(user.can_join_beacon?(beacon)).to be false
      end
      
      it 'returns false for full beacon' do
        create(:beacon_participant, beacon: beacon)
        create(:beacon_participant, beacon: beacon)
        expect(user.can_join_beacon?(beacon)).to be false
      end
      
      it 'returns true for valid beacon' do
        expect(user.can_join_beacon?(beacon)).to be true
      end
    end
    
    describe '#update_reliability_score!' do
      it 'updates score and creates history record' do
        old_score = user.reliability_score
        new_score = user.update_reliability_score!(10, 'Test reason')
        
        expect(new_score).to eq(old_score + 10)
        expect(user.reliability_score).to eq(new_score)
        
        history = user.reliability_histories.last
        expect(history.score_change).to eq(10)
        expect(history.reason).to eq('Test reason')
        expect(history.previous_score).to eq(old_score)
        expect(history.new_score).to eq(new_score)
      end
      
      it 'caps score at 1000' do
        user.update!(reliability_score: 995)
        new_score = user.update_reliability_score!(10, 'Test reason')
        expect(new_score).to eq(1000)
      end
      
      it 'does not go below 0' do
        user.update!(reliability_score: 5)
        new_score = user.update_reliability_score!(-10, 'Test reason')
        expect(new_score).to eq(0)
      end
    end
  end
end
```

---

## Deployment Templates

### 1. Kamal Configuration

```yaml
# config/deploy.yml
service: beacon-buddy

image: mohitshahu/beacon-buddy

servers:
  web:
    hosts:
      - 192.168.1.100
    options:
      add-host:
        - db:192.168.1.101

registry:
  username: mohitshahu
  password:
    - KAMAL_REGISTRY_PASSWORD

env:
  clear:
    RAILS_ENV: production
    RAILS_LOG_TO_STDOUT: true
    RAILS_SERVE_STATIC_FILES: true
  secret:
    - RAILS_MASTER_KEY
    - DATABASE_URL
    - REDIS_URL
    - JWT_SECRET
    - GOOGLE_OAUTH_CLIENT_ID
    - GOOGLE_OAUTH_CLIENT_SECRET

accessories:
  db:
    image: postgres:15
    host: 192.168.1.101
    port: 5432
    env:
      clear:
        POSTGRES_DB: beacon_buddy_production
        POSTGRES_USER: beacon_buddy
      secret:
        - POSTGRES_PASSWORD
    directories:
      - data:/var/lib/postgresql/data

  redis:
    image: redis:7-alpine
    host: 192.168.1.102
    port: 6379
    options:
      cpus: 0.5
      memory: 512m

builder:
  arch:
    - amd64
    - arm64

healthcheck:
  path: /up
  port: 3000
  max_attempts: 5
  interval: 5s

traefik:
  options:
    publish:
      - "443:443"
      - "80:80"
    volume:
      - "/letsencrypt:/letsencrypt"
    args:
      - "--entrypoints.web.address=:80"
      - "--entrypoints.websecure.address=:443"
      - "--certificatesresolvers.letsencrypt.acme.tlschallenge=true"
      - "--certificatesresolvers.letsencrypt.acme.email=admin@beaconbuddy.com"
      - "--certificatesresolvers.letsencrypt.acme.storage=/letsencrypt/acme.json"
      - "--entrypoints.websecure.http.tls.certresolver=letsencrypt"

ssl:
  options:
    - "traefik.http.routers.#{service}-web.rule=Host(`beaconbuddy.com`)"
    - "traefik.http.routers.#{service}-web.tls=true"
    - "traefik.http.routers.#{service}-web.tls.certresolver=letsencrypt"
```

---

This comprehensive template collection provides:

1. **Database migrations** for all required tables
2. **Enhanced models** with business logic
3. **Service objects** for complex operations
4. **API controllers** with proper error handling
5. **React Native components** for mobile UI
6. **Redux store** for state management
7. **Testing templates** for quality assurance
8. **Deployment configuration** for production

These templates will significantly accelerate development while maintaining code quality and architectural consistency.
