# UI/UX Design System - Beacon Buddy

**Author:** Mohit_shahu  
**Date:** 2026-03-26  
**Version:** 1.0 - Comprehensive Design System  
**Integration:** React Native + User Stories Mapping

---

## 🎨 Design Philosophy

### Core Principles
1. **Introvert-First Design** - Low social pressure, gradual engagement
2. **Trust & Safety** - Clear safety indicators, verification badges
3. **Accessibility** - WCAG 2.1 AA compliance, inclusive design
4. **Performance** - Fast loading, smooth interactions
5. **Consistency** - Unified visual language across all screens

### User Experience Goals
- **Reduce Anxiety**: Clear information, predictable interactions
- **Build Confidence**: Reliability scores, verification status
- **Enable Discovery**: Easy browsing, smart recommendations
- **Facilitate Connection**: Low-pressure joining, optional social features

---

## 🎯 Design Tokens

### Color Palette

#### Primary Colors
```css
/* Primary Brand Colors */
--primary-50: #EFF6FF;  /* Light blue */
--primary-100: #DBEAFE;
--primary-200: #BFDBFE;
--primary-300: #93C5FD;
--primary-400: #60A5FA;
--primary-500: #3B82F6;  /* Main brand color */
--primary-600: #2563EB;
--primary-700: #1D4ED8;
--primary-800: #1E40AF;
--primary-900: #1E3A8A;  /* Dark blue */
```

#### Secondary Colors
```css
/* Secondary Colors */
--secondary-50: #F0FDF4;  /* Green */
--secondary-100: #DCFCE7;
--secondary-200: #BBF7D0;
--secondary-300: #86EFAC;
--secondary-400: #4ADE80;
--secondary-500: #22C55E;  /* Success green */
--secondary-600: #16A34A;
--secondary-700: #15803D;
--secondary-800: #166534;
--secondary-900: #14532D;

/* Accent Colors */
--accent-50: #FEF3C7;  /* Amber */
--accent-100: #FDE68A;
--accent-200: #FCD34D;
--accent-300: #FBBF24;
--accent-400: #F59E0B;
--accent-500: #F97316;  /* Warning amber */
--accent-600: #EA580C;
--accent-700: #C2410C;
--accent-800: #9A3412;
--accent-900: #78350F;
```

#### Semantic Colors
```css
/* Status Colors */
--success: #22C55E;
--warning: #F97316;
--error: #EF4444;
--info: #3B82F6;
--neutral: #6B7280;

/* Reliability Score Colors */
--reliability-excellent: #10B981;  /* 900-1000 */
--reliability-good: #22C55E;       /* 800-899 */
--reliability-fair: #F59E0B;       /* 700-799 */
--reliability-poor: #EF4444;       /* 600-699 */
--reliability-needs-improvement: #991B1B; /* 0-599 */
```

#### Neutral Colors
```css
/* Neutral Palette */
--gray-50: #F9FAFB;
--gray-100: #F3F4F6;
--gray-200: #E5E7EB;
--gray-300: #D1D5DB;
--gray-400: #9CA3AF;
--gray-500: #6B7280;
--gray-600: #4B5563;
--gray-700: #374151;
--gray-800: #1F2937;
--gray-900: #111827;
```

### Typography

#### Font System
```css
/* Font Family */
--font-family-primary: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
--font-family-mono: 'JetBrains Mono', 'Fira Code', monospace;

/* Font Sizes */
--text-xs: 0.75rem;    /* 12px */
--text-sm: 0.875rem;   /* 14px */
--text-base: 1rem;      /* 16px */
--text-lg: 1.125rem;    /* 18px */
--text-xl: 1.25rem;     /* 20px */
--text-2xl: 1.5rem;    /* 24px */
--text-3xl: 1.875rem;   /* 30px */
--text-4xl: 2.25rem;    /* 36px */
--text-5xl: 3rem;       /* 48px */

/* Font Weights */
--font-weight-light: 300;
--font-weight-normal: 400;
--font-weight-medium: 500;
--font-weight-semibold: 600;
--font-weight-bold: 700;

/* Line Heights */
--leading-tight: 1.25;
--leading-normal: 1.5;
--leading-relaxed: 1.75;
```

### Spacing System

#### Scale
```css
/* Spacing Scale (4px base) */
--space-1: 0.25rem;  /* 4px */
--space-2: 0.5rem;   /* 8px */
--space-3: 0.75rem;  /* 12px */
--space-4: 1rem;     /* 16px */
--space-5: 1.25rem;   /* 20px */
--space-6: 1.5rem;    /* 24px */
--space-8: 2rem;      /* 32px */
--space-10: 2.5rem;    /* 40px */
--space-12: 3rem;      /* 48px */
--space-16: 4rem;      /* 64px */
--space-20: 5rem;      /* 80px */
--space-24: 6rem;      /* 96px */
```

### Border Radius

```css
/* Border Radius */
--radius-none: 0;
--radius-sm: 0.125rem;    /* 2px */
--radius-base: 0.25rem;   /* 4px */
--radius-md: 0.375rem;     /* 6px */
--radius-lg: 0.5rem;       /* 8px */
--radius-xl: 0.75rem;      /* 12px */
--radius-2xl: 1rem;        /* 16px */
--radius-full: 9999px;
```

### Shadows

```css
/* Shadow System */
--shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
--shadow-base: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
--shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
--shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
--shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
```

---

## 🧩 Component Library

### 1. Buttons

#### Primary Button
```jsx
// components/buttons/PrimaryButton.jsx
import React from 'react';
import { TouchableOpacity, Text, StyleSheet, ActivityIndicator } from 'react-native';

const PrimaryButton = ({ 
  title, 
  onPress, 
  loading = false, 
  disabled = false,
  size = 'md',
  variant = 'solid' 
}) => {
  const buttonStyle = [
    styles.button,
    styles[size],
    styles[variant],
    disabled && styles.disabled,
    loading && styles.loading
  ];

  return (
    <TouchableOpacity 
      style={buttonStyle}
      onPress={onPress}
      disabled={disabled || loading}
      activeOpacity={0.8}
    >
      {loading ? (
        <ActivityIndicator size="small" color="#FFFFFF" />
      ) : (
        <Text style={styles.text}>{title}</Text>
      )}
    </TouchableOpacity>
  );
};

const styles = StyleSheet.create({
  button: {
    backgroundColor: '#3B82F6',
    borderRadius: 8,
    alignItems: 'center',
    justifyContent: 'center',
    borderWidth: 0,
  },
  solid: {
    backgroundColor: '#3B82F6',
  },
  outline: {
    backgroundColor: 'transparent',
    borderWidth: 1,
    borderColor: '#3B82F6',
  },
  ghost: {
    backgroundColor: 'transparent',
  },
  sm: {
    paddingHorizontal: 16,
    paddingVertical: 8,
    minHeight: 36,
  },
  md: {
    paddingHorizontal: 24,
    paddingVertical: 12,
    minHeight: 44,
  },
  lg: {
    paddingHorizontal: 32,
    paddingVertical: 16,
    minHeight: 52,
  },
  text: {
    fontFamily: 'Inter',
    fontWeight: '600',
    fontSize: 16,
    color: '#FFFFFF',
  },
  disabled: {
    opacity: 0.5,
  },
  loading: {
    opacity: 0.8,
  },
});
```

#### Secondary Button
```jsx
// Similar structure with different colors
const SecondaryButton = ({ title, onPress, ...props }) => (
  <PrimaryButton 
    title={title} 
    onPress={onPress} 
    variant="outline"
    {...props} 
  />
);
```

### 2. Cards

#### Beacon Card
```jsx
// components/cards/BeaconCard.jsx
import React from 'react';
import { View, Text, Image, StyleSheet } from 'react-native';
import { MaterialIcons } from '@expo/vector-icons';

const BeaconCard = ({ beacon, onPress, userRole }) => {
  const reliabilityColor = getReliabilityColor(beacon.creator.reliability_score);
  
  return (
    <TouchableOpacity style={styles.card} onPress={() => onPress(beacon)}>
      {/* Header */}
      <View style={styles.header}>
        <View style={styles.categoryIcon}>
          <MaterialIcons name={getCategoryIcon(beacon.category)} size={24} color="#3B82F6" />
        </View>
        <View style={styles.titleContainer}>
          <Text style={styles.title}>{beacon.title}</Text>
          <Text style={styles.category}>{beacon.category}</Text>
        </View>
        <ReliabilityBadge score={beacon.creator.reliability_score} />
      </View>
      
      {/* Content */}
      <Text style={styles.description} numberOfLines={2}>
        {beacon.description}
      </Text>
      
      {/* Meta Info */}
      <View style={styles.metaContainer}>
        <View style={styles.metaItem}>
          <MaterialIcons name="schedule" size={16} color="#6B7280" />
          <Text style={styles.metaText}>{formatTime(beacon.event_time)}</Text>
        </View>
        <View style={styles.metaItem}>
          <MaterialIcons name="group" size={16} color="#6B7280" />
          <Text style={styles.metaText}>{beacon.joined_count}/{beacon.max_participants}</Text>
        </View>
        <View style={styles.metaItem}>
          <MaterialIcons name="location-on" size={16} color="#6B7280" />
          <Text style={styles.metaText}>{beacon.location_name}</Text>
        </View>
      </View>
      
      {/* Footer */}
      <View style={styles.footer}>
        <View style={styles.creatorInfo}>
          <Image source={{ uri: beacon.creator.avatar_url }} style={styles.avatar} />
          <View>
            <Text style={styles.creatorName}>{beacon.creator.name}</Text>
            <Text style={[styles.reliabilityScore, { color: reliabilityColor }]}>
              {beacon.creator.reliability_score}
            </Text>
          </View>
        </View>
        <JoinStatusBadge beacon={beacon} userRole={userRole} />
      </View>
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
    backgroundColor: '#EFF6FF',
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
    color: '#111827',
    marginBottom: 2,
  },
  category: {
    fontSize: 14,
    color: '#6B7280',
  },
  description: {
    fontSize: 14,
    color: '#4B5563',
    lineHeight: 20,
    marginBottom: 12,
  },
  metaContainer: {
    marginBottom: 12,
  },
  metaItem: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 4,
  },
  metaText: {
    fontSize: 14,
    color: '#6B7280',
    marginLeft: 4,
  },
  footer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingTop: 12,
    borderTopWidth: 1,
    borderTopColor: '#F3F4F6',
  },
  creatorInfo: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  avatar: {
    width: 32,
    height: 32,
    borderRadius: 16,
    marginRight: 8,
  },
  creatorName: {
    fontSize: 14,
    fontWeight: '500',
    color: '#111827',
  },
  reliabilityScore: {
    fontSize: 12,
    fontWeight: '600',
  },
});
```

### 3. Input Components

#### Search Input
```jsx
// components/inputs/SearchInput.jsx
import React from 'react';
import { View, TextInput, StyleSheet } from 'react-native';
import { MaterialIcons } from '@expo/vector-icons';

const SearchInput = ({ 
  value, 
  onChangeText, 
  placeholder = "Search beacons...",
  onFocus,
  onBlur 
}) => {
  return (
    <View style={styles.container}>
      <MaterialIcons name="search" size={20} color="#6B7280" style={styles.icon} />
      <TextInput
        style={styles.input}
        value={value}
        onChangeText={onChangeText}
        placeholder={placeholder}
        placeholderTextColor="#9CA3AF"
        onFocus={onFocus}
        onBlur={onBlur}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#F3F4F6',
    borderRadius: 8,
    paddingHorizontal: 12,
    paddingVertical: 8,
  },
  icon: {
    marginRight: 8,
  },
  input: {
    flex: 1,
    fontSize: 16,
    color: '#111827',
  },
});
```

### 4. Badges

#### Reliability Badge
```jsx
// components/badges/ReliabilityBadge.jsx
import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

const ReliabilityBadge = ({ score, size = 'sm' }) => {
  const level = getReliabilityLevel(score);
  const color = getReliabilityColor(score);
  
  const badgeStyle = [
    styles.badge,
    styles[size],
    { backgroundColor: color }
  ];
  
  return (
    <View style={badgeStyle}>
      <Text style={styles.text}>{score}</Text>
    </View>
  );
};

const getReliabilityLevel = (score) => {
  if (score >= 900) return 'Excellent';
  if (score >= 800) return 'Very Good';
  if (score >= 700) return 'Good';
  if (score >= 600) return 'Fair';
  return 'Needs Improvement';
};

const styles = StyleSheet.create({
  badge: {
    borderRadius: 12,
    paddingHorizontal: 8,
    paddingVertical: 4,
    alignItems: 'center',
  },
  sm: {
    paddingHorizontal: 6,
    paddingVertical: 2,
  },
  text: {
    fontSize: 12,
    fontWeight: '600',
    color: '#FFFFFF',
  },
});
```

---

## 📱 Screen Designs & User Story Integration

### 1. Authentication Screens (Stories 1.1, 1.2, 1.3)

#### Welcome Screen
```jsx
// screens/auth/WelcomeScreen.jsx
import React from 'react';
import { View, Text, StyleSheet, SafeAreaView } from 'react-native';
import { PrimaryButton } from '../../components/buttons/PrimaryButton';
import { GoogleSigninButton } from '../../components/auth/GoogleSigninButton';

const WelcomeScreen = ({ navigation }) => {
  return (
    <SafeAreaView style={styles.container}>
      {/* Logo and Welcome Message */}
      <View style={styles.header}>
        <Text style={styles.logo}>🔥 Beacon Buddy</Text>
        <Text style={styles.tagline}>Find activities, make connections</Text>
      </View>
      
      {/* Authentication Options */}
      <View style={styles.authContainer}>
        <GoogleSigninButton 
          onSuccess={() => navigation.navigate('Main')}
          onError={(error) => console.error('Auth error:', error)}
        />
        
        <PrimaryButton 
          title="Browse as Guest"
          onPress={() => navigation.navigate('GuestFeed')}
          variant="outline"
          style={styles.guestButton}
        />
      </View>
      
      {/* Trust Indicators */}
      <View style={styles.trustContainer}>
        <Text style={styles.trustText}>
          🔒 Secure authentication • 
          🛡️ Verified users • 
          ⭐ 4.8 rating
        </Text>
      </View>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#FFFFFF',
    paddingHorizontal: 24,
  },
  header: {
    alignItems: 'center',
    marginTop: 80,
    marginBottom: 60,
  },
  logo: {
    fontSize: 32,
    fontWeight: '700',
    color: '#3B82F6',
    marginBottom: 8,
  },
  tagline: {
    fontSize: 16,
    color: '#6B7280',
    textAlign: 'center',
  },
  authContainer: {
    gap: 16,
  },
  guestButton: {
    marginTop: 8,
  },
  trustContainer: {
    position: 'absolute',
    bottom: 40,
    left: 24,
    right: 24,
  },
  trustText: {
    fontSize: 12,
    color: '#9CA3AF',
    textAlign: 'center',
  },
});
```

#### Profile Setup Screen
```jsx
// screens/auth/ProfileSetupScreen.jsx
import React, { useState } from 'react';
import { View, Text, ScrollView, StyleSheet, SafeAreaView } from 'react-native';
import { PrimaryButton } from '../../components/buttons/PrimaryButton';
import { ProfilePhotoUpload } from '../../components/profile/ProfilePhotoUpload';
import { InterestSelector } from '../../components/profile/InterestSelector';

const ProfileSetupScreen = ({ navigation, route }) => {
  const [profile, setProfile] = useState({
    name: route.params?.user?.name || '',
    bio: '',
    interests: [],
    ageRange: '25-35',
    locationSharing: true,
  });
  
  const [step, setStep] = useState(1);
  const totalSteps = 3;
  
  const handleNext = () => {
    if (step < totalSteps) {
      setStep(step + 1);
    } else {
      // Save profile and navigate to main app
      navigation.navigate('Main');
    }
  };
  
  return (
    <SafeAreaView style={styles.container}>
      {/* Progress Indicator */}
      <View style={styles.progressContainer}>
        <View style={styles.progressBar}>
          <View style={[styles.progressFill, { width: `${(step / totalSteps) * 100}%` }]} />
        </View>
        <Text style={styles.progressText}>Step {step} of {totalSteps}</Text>
      </View>
      
      <ScrollView style={styles.content}>
        {step === 1 && (
          <View>
            <Text style={styles.stepTitle}>Let's start with your photo</Text>
            <ProfilePhotoUpload 
              onPhotoSelected={(photo) => setProfile({...profile, photo})}
              initialPhoto={profile.photo}
            />
          </View>
        )}
        
        {step === 2 && (
          <View>
            <Text style={styles.stepTitle}>Tell us about yourself</Text>
            <TextInput
              style={styles.bioInput}
              placeholder="Share a bit about yourself..."
              value={profile.bio}
              onChangeText={(bio) => setProfile({...profile, bio})}
              multiline
              numberOfLines={4}
            />
          </View>
        )}
        
        {step === 3 && (
          <View>
            <Text style={styles.stepTitle}>What interests you?</Text>
            <InterestSelector
              selectedInterests={profile.interests}
              onInterestsChange={(interests) => setProfile({...profile, interests})}
            />
          </View>
        )}
      </ScrollView>
      
      {/* Navigation */}
      <View style={styles.navigation}>
        <PrimaryButton 
          title={step === totalSteps ? "Complete Setup" : "Continue"}
          onPress={handleNext}
          disabled={!isStepValid(step, profile)}
        />
        {step > 1 && (
          <PrimaryButton 
            title="Back"
            onPress={() => setStep(step - 1)}
            variant="ghost"
          />
        )}
      </View>
    </SafeAreaView>
  );
};
```

### 2. Beacon Discovery Screens (Stories 2.1, 2.2, 2.3)

#### Beacon Feed Screen
```jsx
// screens/beacons/BeaconFeedScreen.jsx
import React, { useState, useEffect } from 'react';
import { View, FlatList, StyleSheet, RefreshControl } from 'react-native';
import { BeaconCard } from '../../components/cards/BeaconCard';
import { SearchInput } from '../../components/inputs/SearchInput';
import { FilterButton } from '../../components/filters/FilterButton';
import { FloatingActionButton } from '../../components/buttons/FloatingActionButton';

const BeaconFeedScreen = ({ navigation }) => {
  const [beacons, setBeacons] = useState([]);
  const [loading, setLoading] = useState(false);
  const [refreshing, setRefreshing] = useState(false);
  const [filters, setFilters] = useState({});
  const [searchQuery, setSearchQuery] = useState('');
  
  useEffect(() => {
    loadBeacons();
  }, [filters, searchQuery]);
  
  const loadBeacons = async () => {
    setLoading(true);
    try {
      const response = await api.get('/beacons', { params: { ...filters, q: searchQuery } });
      setBeacons(response.data.data);
    } catch (error) {
      console.error('Failed to load beacons:', error);
    } finally {
      setLoading(false);
    }
  };
  
  const handleRefresh = async () => {
    setRefreshing(true);
    await loadBeacons();
    setRefreshing(false);
  };
  
  const renderBeacon = ({ item }) => (
    <BeaconCard 
      beacon={item} 
      onPress={(beacon) => navigation.navigate('BeaconDetail', { beaconId: beacon.id })}
      userRole={getCurrentUserRole()}
    />
  );
  
  return (
    <View style={styles.container}>
      {/* Search and Filters */}
      <View style={styles.header}>
        <SearchInput
          value={searchQuery}
          onChangeText={setSearchQuery}
          placeholder="Search activities near you..."
        />
        <FilterButton 
          filters={filters}
          onFiltersChange={setFilters}
        />
      </View>
      
      {/* Beacon List */}
      <FlatList
        data={beacons}
        renderItem={renderBeacon}
        keyExtractor={(item) => item.id.toString()}
        refreshControl={
          <RefreshControl refreshing={refreshing} onRefresh={handleRefresh} />
        }
        contentContainerStyle={styles.listContainer}
        ListEmptyComponent={<EmptyState />}
      />
      
      {/* FAB */}
      <FloatingActionButton 
        icon="add"
        onPress={() => navigation.navigate('CreateBeacon')}
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
    padding: 16,
    backgroundColor: '#FFFFFF',
    borderBottomWidth: 1,
    borderBottomColor: '#E5E7EB',
    gap: 12,
  },
  listContainer: {
    padding: 8,
  },
});
```

### 3. Beacon Detail Screen (Story 2.5)

```jsx
// screens/beacons/BeaconDetailScreen.jsx
import React, { useState } from 'react';
import { View, Text, ScrollView, StyleSheet, SafeAreaView } from 'react-native';
import { PrimaryButton } from '../../components/buttons/PrimaryButton';
import { MapView } from '../../components/maps/MapView';
import { ParticipantList } from '../../components/beacons/ParticipantList';
import { SafetyIndicators } from '../../components/safety/SafetyIndicators';

const BeaconDetailScreen = ({ route, navigation }) => {
  const { beaconId } = route.params;
  const [beacon, setBeacon] = useState(null);
  const [loading, setLoading] = useState(true);
  const [joining, setJoining] = useState(false);
  
  useEffect(() => {
    loadBeaconDetail();
  }, [beaconId]);
  
  const loadBeaconDetail = async () => {
    try {
      const response = await api.get(`/beacons/${beaconId}`);
      setBeacon(response.data.data);
    } catch (error) {
      console.error('Failed to load beacon:', error);
    } finally {
      setLoading(false);
    }
  };
  
  const handleJoinBeacon = async () => {
    setJoining(true);
    try {
      await api.post(`/beacons/${beaconId}/join`);
      // Update beacon state
      setBeacon({
        ...beacon,
        participants: [...beacon.participants, getCurrentUser()],
        joined_count: beacon.joined_count + 1
      });
    } catch (error) {
      console.error('Failed to join beacon:', error);
    } finally {
      setJoining(false);
    }
  };
  
  if (loading) {
    return <LoadingScreen />;
  }
  
  return (
    <SafeAreaView style={styles.container}>
      <ScrollView style={styles.content}>
        {/* Header with Creator Info */}
        <View style={styles.header}>
          <View style={styles.creatorSection}>
            <Image source={{ uri: beacon.creator.avatar_url }} style={styles.creatorAvatar} />
            <View style={styles.creatorInfo}>
              <Text style={styles.creatorName}>{beacon.creator.name}</Text>
              <ReliabilityBadge score={beacon.creator.reliability_score} />
              <Text style={styles.creatorBio}>{beacon.creator.bio}</Text>
            </View>
          </View>
          
          {/* Safety Indicators */}
          <SafetyIndicators 
            verificationLevel={beacon.creator.verification_level}
            reliabilityScore={beacon.creator.reliability_score}
          />
        </View>
        
        {/* Beacon Info */}
        <View style={styles.infoSection}>
          <Text style={styles.title}>{beacon.title}</Text>
          <Text style={styles.description}>{beacon.description}</Text>
          
          <View style={styles.metaGrid}>
            <View style={styles.metaItem}>
              <MaterialIcons name="schedule" size={20} color="#6B7280" />
              <Text style={styles.metaLabel}>When</Text>
              <Text style={styles.metaValue}>{formatDateTime(beacon.event_time)}</Text>
            </View>
            
            <View style={styles.metaItem}>
              <MaterialIcons name="location-on" size={20} color="#6B7280" />
              <Text style={styles.metaLabel}>Where</Text>
              <Text style={styles.metaValue}>{beacon.location_name}</Text>
            </View>
            
            <View style={styles.metaItem}>
              <MaterialIcons name="group" size={20} color="#6B7280" />
              <Text style={styles.metaLabel}>Group Size</Text>
              <Text style={styles.metaValue}>{beacon.joined_count}/{beacon.max_participants}</Text>
            </View>
          </View>
        </View>
        
        {/* Map */}
        <MapView 
          style={styles.map}
          location={{
            latitude: beacon.location_lat,
            longitude: beacon.location_lng,
          }}
          title={beacon.location_name}
        />
        
        {/* Participants */}
        <ParticipantList 
          participants={beacon.participants}
          maxParticipants={beacon.max_participants}
        />
        
        {/* Action Button */}
        <View style={styles.actionSection}>
          <PrimaryButton 
            title={getJoinButtonText(beacon)}
            onPress={handleJoinBeacon}
            loading={joining}
            disabled={!canJoinBeacon(beacon)}
            style={styles.joinButton}
          />
          
          {beacon.cost_per_person && (
            <Text style={styles.costText}>
              💰 {beacon.cost_per_person} per person
            </Text>
          )}
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};
```

### 4. Create Beacon Screen (Story 2.1)

```jsx
// screens/beacons/CreateBeaconScreen.jsx
import React, { useState } from 'react';
import { View, Text, ScrollView, StyleSheet, SafeAreaView } from 'react-native';
import { PrimaryButton } from '../../components/buttons/PrimaryButton';
import { LocationPicker } from '../../components/location/LocationPicker';
import { DateTimePicker } from '../../components/datetime/DateTimePicker';
import { CategorySelector } from '../../components/beacons/CategorySelector';
import { ParticipantSettings } from '../../components/beacons/ParticipantSettings';

const CreateBeaconScreen = ({ navigation }) => {
  const [beacon, setBeacon] = useState({
    title: '',
    description: '',
    category: '',
    event_time: new Date(),
    location: null,
    max_participants: 4,
    join_policy: 'open',
    age_restriction: 18,
    cost_per_person: 0,
  });
  
  const [step, setStep] = useState(1);
  const [creating, setCreating] = useState(false);
  
  const handleCreateBeacon = async () => {
    setCreating(true);
    try {
      const response = await api.post('/beacons', { beacon });
      navigation.navigate('BeaconDetail', { beaconId: response.data.data.id });
    } catch (error) {
      console.error('Failed to create beacon:', error);
    } finally {
      setCreating(false);
    }
  };
  
  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.header}>
        <Text style={styles.title}>Create Activity</Text>
        <Text style={styles.subtitle}>Bring people together for an experience</Text>
      </View>
      
      <ScrollView style={styles.content}>
        {/* Basic Info */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Basic Information</Text>
          
          <TextInput
            style={styles.input}
            placeholder="Activity title"
            value={beacon.title}
            onChangeText={(title) => setBeacon({...beacon, title})}
          />
          
          <TextInput
            style={[styles.input, styles.textArea]}
            placeholder="Describe your activity..."
            value={beacon.description}
            onChangeText={(description) => setBeacon({...beacon, description})}
            multiline
            numberOfLines={4}
          />
          
          <CategorySelector
            selectedCategory={beacon.category}
            onCategoryChange={(category) => setBeacon({...beacon, category})}
          />
        </View>
        
        {/* Date & Time */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>When</Text>
          <DateTimePicker
            value={beacon.event_time}
            onChange={(event_time) => setBeacon({...beacon, event_time})}
            minimumDate={new Date()}
          />
        </View>
        
        {/* Location */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Where</Text>
          <LocationPicker
            location={beacon.location}
            onLocationChange={(location) => setBeacon({...beacon, location})}
          />
        </View>
        
        {/* Participant Settings */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Who Can Join</Text>
          <ParticipantSettings
            settings={{
              max_participants: beacon.max_participants,
              join_policy: beacon.join_policy,
              age_restriction: beacon.age_restriction,
            }}
            onChange={(settings) => setBeacon({...beacon, ...settings})}
          />
        </View>
        
        {/* Pricing */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Pricing (Optional)</Text>
          <TextInput
            style={styles.input}
            placeholder="Cost per person (leave 0 for free)"
            value={beacon.cost_per_person?.toString()}
            onChangeText={(cost) => setBeacon({...beacon, cost_per_person: parseFloat(cost) || 0})}
            keyboardType="numeric"
          />
        </View>
      </ScrollView>
      
      {/* Create Button */}
      <View style={styles.footer}>
        <PrimaryButton 
          title="Create Beacon"
          onPress={handleCreateBeacon}
          loading={creating}
          disabled={!isBeaconValid(beacon)}
          style={styles.createButton}
        />
      </View>
    </SafeAreaView>
  );
};
```

---

## 🎯 Design System Integration with User Stories

### Story Mapping to Components

| User Story | Primary Components | Key Design Considerations |
|-------------|-------------------|-------------------------|
| 1.1 Google Sign-In | GoogleSigninButton, WelcomeScreen | Trust indicators, social proof |
| 1.2 Profile Setup | ProfilePhotoUpload, InterestSelector, ProgressIndicator | Step-by-step flow, gamification |
| 2.1 Create Beacon | CategorySelector, DateTimePicker, LocationPicker | Form validation, progressive disclosure |
| 2.2 Beacon Feed | BeaconCard, SearchInput, FilterButton | Infinite scroll, real-time updates |
| 2.5 Beacon Details | MapView, ParticipantList, SafetyIndicators | Trust signals, clear CTAs |
| 3.1 Join Beacon | JoinButton, ConfirmationModal | Low-friction joining, clear status |
| 4.1 Reliability Score | ReliabilityBadge, ScoreChart | Visual feedback, progress tracking |

### Accessibility Integration

#### Screen Reader Support
```jsx
// Accessibility wrapper for components
const AccessibleButton = ({ title, onPress, ...props }) => (
  <TouchableOpacity
    onPress={onPress}
    accessible={true}
    accessibilityLabel={title}
    accessibilityRole="button"
    accessibilityHint={`Double tap to ${title}`}
    {...props}
  >
    <Text>{title}</Text>
  </TouchableOpacity>
);
```

#### High Contrast Mode
```css
/* High contrast theme */
@media (prefers-contrast: high) {
  :root {
    --primary-500: #1D4ED8;
    --gray-100: #000000;
    --gray-800: #FFFFFF;
    --text-primary: #000000;
    --text-secondary: #FFFFFF;
  }
}
```

---

## 📱 Responsive Design Guidelines

### Screen Size Adaptation

```jsx
// hooks/useResponsive.js
import { useWindowDimensions } from 'react-native';

export const useResponsive = () => {
  const { width } = useWindowDimensions();
  
  const breakpoints = {
    sm: width < 375,
    md: width >= 375 && width < 768,
    lg: width >= 768 && width < 1024,
    xl: width >= 1024,
  };
  
  return {
    ...breakpoints,
    isMobile: breakpoints.sm || breakpoints.md,
    isTablet: breakpoints.lg,
    isDesktop: breakpoints.xl,
  };
};
```

### Component Adaptation
```jsx
// Responsive beacon card
const ResponsiveBeaconCard = ({ beacon, ...props }) => {
  const { isMobile, isTablet } = useResponsive();
  
  const cardStyle = [
    styles.card,
    isMobile && styles.mobileCard,
    isTablet && styles.tabletCard,
  ];
  
  return (
    <BeaconCard 
      beacon={beacon}
      style={cardStyle}
      compact={isMobile}
      {...props} 
    />
  );
};
```

---

## 🎨 Animation & Micro-interactions

### Loading States
```jsx
// Skeleton loading for beacon cards
const BeaconCardSkeleton = () => (
  <View style={styles.skeleton}>
    <View style={styles.skeletonHeader} />
    <View style={styles.skeletonContent} />
    <View style={styles.skeletonFooter} />
  </View>
);
```

### Pull to Refresh
```jsx
// Custom refresh animation
const RefreshAnimation = ({ refreshing }) => (
  <View style={styles.refreshContainer}>
    {refreshing && (
      <LottieView 
        source={require('../../animations/refresh.json')}
        autoPlay
        loop
        style={styles.refreshAnimation}
      />
    )}
  </View>
);
```

---

## 🚀 Implementation Guidelines

### Component Naming Convention
- **Screens**: `Screen` suffix (e.g., `BeaconFeedScreen`)
- **Components**: PascalCase (e.g., `BeaconCard`, `PrimaryButton`)
- **Hooks**: `use` prefix (e.g., `useResponsive`, `useAuth`)
- **Utils**: camelCase (e.g., `formatDate`, `validateBeacon`)

### File Structure
```
src/
├── components/
│   ├── buttons/
│   ├── cards/
│   ├── inputs/
│   ├── badges/
│   ├── filters/
│   └── index.js
├── screens/
│   ├── auth/
│   ├── beacons/
│   ├── profile/
│   └── index.js
├── hooks/
├── utils/
├── constants/
└── styles/
    ├── colors.js
    ├── typography.js
    ├── spacing.js
    └── index.js
```

### State Management Integration
```jsx
// Redux integration example
import { useDispatch, useSelector } from 'react-redux';
import { joinBeacon } from '../store/slices/beaconSlice';

const BeaconJoinButton = ({ beaconId }) => {
  const dispatch = useDispatch();
  const { loading } = useSelector(state => state.beacons);
  
  const handleJoin = () => {
    dispatch(joinBeacon(beaconId));
  };
  
  return (
    <PrimaryButton 
      title="Join Beacon"
      onPress={handleJoin}
      loading={loading.joining}
    />
  );
};
```

This comprehensive design system provides a solid foundation for implementing Beacon Buddy with consistent, accessible, and user-friendly interfaces that align with the user stories and React Native architecture.
