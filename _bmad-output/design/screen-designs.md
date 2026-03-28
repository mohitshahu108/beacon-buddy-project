# Screen-by-Screen UI/UX Designs - Beacon Buddy

**Author:** Mohit_shahu  
**Date:** 2026-03-26  
**Integration:** React Native Components + User Stories  
**Current State:** Working with existing Google Sign-In implementation

---

## 📱 Screen Architecture Overview

### Navigation Structure
```
App (Tab Navigator)
├── Feed Stack
│   ├── BeaconFeedScreen
│   ├── BeaconDetailScreen
│   ├── CreateBeaconScreen
│   └── SearchScreen
├── Activity Stack
│   ├── MyBeaconsScreen
│   ├── JoinedBeaconsScreen
│   └── HistoryScreen
├── Profile Stack
│   ├── ProfileScreen
│   ├── SettingsScreen
│   └── ReliabilityScreen
└── Chat Stack
    ├── ChatListScreen
    └── ChatScreen
```

---

## 🏠 Authentication Flow Screens

### 1. Welcome Screen (Story 1.1 Integration)
**Current State:** Already has Google Sign-In button

```jsx
// screens/auth/WelcomeScreen.jsx
import React from 'react';
import { View, Text, StyleSheet, SafeAreaView, StatusBar, TouchableOpacity } from 'react-native';
import { GoogleSignin } from '@react-native-google-signin/google-signin';
import { SafeAreaProvider } from 'react-native-safe-area-context';

const WelcomeScreen = ({ navigation }) => {
  const signIn = async () => {
    try {
      await GoogleSignin.hasPlayServices();
      const userInfo = await GoogleSignin.signIn();
      const idToken = userInfo?.data?.idToken;

      const response = await fetch('http://10.0.2.2:3000/api/v1/auth/google', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id_token: idToken }),
      });

      const data = await response.json();
      
      // Navigate to main app or profile setup
      if (data.user.needs_profile_setup) {
        navigation.navigate('ProfileSetup', { user: data.user });
      } else {
        navigation.navigate('MainApp');
      }
    } catch (error) {
      console.error('Sign-in error:', error);
      // Show error toast
    }
  };

  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.container}>
        <StatusBar barStyle="dark-content" />
        
        {/* Logo Section */}
        <View style={styles.logoSection}>
          <View style={styles.logoContainer}>
            <Text style={styles.logo}>🔥</Text>
            <Text style={styles.appName}>Beacon Buddy</Text>
          </View>
          <Text style={styles.tagline}>Find activities, make connections</Text>
          <Text style={styles.subtagline}>The introvert-friendly way to socialize</Text>
        </View>
        
        {/* Features Preview */}
        <View style={styles.featuresSection}>
          <View style={styles.feature}>
            <Text style={styles.featureIcon}>🎯</Text>
            <Text style={styles.featureTitle}>Activity Discovery</Text>
            <Text style={styles.featureDesc}>Find activities that match your interests</Text>
          </View>
          <View style={styles.feature}>
            <Text style={styles.featureIcon}>🛡️</Text>
            <Text style={styles.featureTitle}>Safety First</Text>
            <Text style={styles.featureDesc}>Verified users and reliability scores</Text>
          </View>
          <View style={styles.feature}>
            <Text style={styles.featureIcon}>💬</Text>
            <Text style={styles.featureTitle}>Low Pressure</Text>
            <Text style={styles.featureDesc}>Join activities without social stress</Text>
          </View>
        </View>
        
        {/* Authentication Section */}
        <View style={styles.authSection}>
          <TouchableOpacity style={styles.googleButton} onPress={signIn}>
            <View style={styles.googleButtonContent}>
              <Text style={styles.googleIcon}>G</Text>
              <Text style={styles.googleButtonText}>Continue with Google</Text>
            </View>
          </TouchableOpacity>
          
          <TouchableOpacity 
            style={styles.guestButton}
            onPress={() => navigation.navigate('GuestFeed')}
          >
            <Text style={styles.guestButtonText}>Browse as Guest</Text>
          </TouchableOpacity>
        </View>
        
        {/* Trust Indicators */}
        <View style={styles.trustSection}>
          <Text style={styles.trustText}>
            🔒 Secure • 🛡️ Verified • ⭐ 4.8 Rating
          </Text>
        </View>
      </SafeAreaView>
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#FFFFFF',
    paddingHorizontal: 24,
  },
  logoSection: {
    alignItems: 'center',
    marginTop: 80,
    marginBottom: 60,
  },
  logoContainer: {
    alignItems: 'center',
    marginBottom: 16,
  },
  logo: {
    fontSize: 48,
    marginBottom: 8,
  },
  appName: {
    fontSize: 28,
    fontWeight: '700',
    color: '#3B82F6',
  },
  tagline: {
    fontSize: 18,
    color: '#374151',
    textAlign: 'center',
    marginBottom: 4,
  },
  subtagline: {
    fontSize: 14,
    color: '#6B7280',
    textAlign: 'center',
  },
  featuresSection: {
    marginBottom: 60,
  },
  feature: {
    alignItems: 'center',
    marginBottom: 24,
  },
  featureIcon: {
    fontSize: 32,
    marginBottom: 8,
  },
  featureTitle: {
    fontSize: 16,
    fontWeight: '600',
    color: '#111827',
    marginBottom: 4,
  },
  featureDesc: {
    fontSize: 14,
    color: '#6B7280',
    textAlign: 'center',
    paddingHorizontal: 20,
  },
  authSection: {
    gap: 16,
    marginBottom: 40,
  },
  googleButton: {
    backgroundColor: '#FFFFFF',
    borderWidth: 1,
    borderColor: '#D1D5DB',
    borderRadius: 8,
    paddingVertical: 12,
  },
  googleButtonContent: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
  },
  googleIcon: {
    fontSize: 18,
    fontWeight: '600',
    color: '#4285F4',
    marginRight: 12,
  },
  googleButtonText: {
    fontSize: 16,
    fontWeight: '500',
    color: '#374151',
  },
  guestButton: {
    backgroundColor: '#F3F4F6',
    borderRadius: 8,
    paddingVertical: 12,
  },
  guestButtonText: {
    fontSize: 16,
    fontWeight: '500',
    color: '#3B82F6',
    textAlign: 'center',
  },
  trustSection: {
    alignItems: 'center',
  },
  trustText: {
    fontSize: 12,
    color: '#9CA3AF',
  },
});

export default WelcomeScreen;
```

### 2. Profile Setup Screen (Story 1.2 Enhancement)

```jsx
// screens/auth/ProfileSetupScreen.jsx
import React, { useState } from 'react';
import { View, Text, ScrollView, StyleSheet, SafeAreaView, TouchableOpacity, TextInput } from 'react-native';
import { Image } from 'react-native';
import * as ImagePicker from 'expo-image-picker';

const ProfileSetupScreen = ({ navigation, route }) => {
  const { user } = route.params || {};
  const [step, setStep] = useState(1);
  const [profile, setProfile] = useState({
    name: user?.name || '',
    bio: '',
    interests: [],
    age_range: '25-35',
    location_sharing: true,
    photo: null,
  });
  
  const totalSteps = 4;
  
  const steps = [
    { title: "Add a photo", subtitle: "Help others recognize you" },
    { title: "Tell us about yourself", subtitle: "Share what makes you interesting" },
    { title: "Choose your interests", subtitle: "Get better activity recommendations" },
    { title: "Privacy settings", subtitle: "Control your information" },
  ];
  
  const handleNext = () => {
    if (step < totalSteps) {
      setStep(step + 1);
    } else {
      // Save profile and navigate to main app
      saveProfile();
    }
  };
  
  const handleBack = () => {
    if (step > 1) {
      setStep(step - 1);
    }
  };
  
  const pickImage = async () => {
    const result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.Images,
      allowsEditing: true,
      aspect: [1, 1],
      quality: 0.7,
    });

    if (!result.canceled) {
      setProfile({ ...profile, photo: result.assets[0].uri });
    }
  };
  
  const renderStepContent = () => {
    switch (step) {
      case 1:
        return (
          <View style={styles.stepContent}>
            <TouchableOpacity style={styles.photoUpload} onPress={pickImage}>
              {profile.photo ? (
                <Image source={{ uri: profile.photo }} style={styles.photoPreview} />
              ) : (
                <View style={styles.photoPlaceholder}>
                  <Text style={styles.photoIcon}>📷</Text>
                  <Text style={styles.photoText}>Tap to add photo</Text>
                </View>
              )}
            </TouchableOpacity>
            <TouchableOpacity style={styles.skipButton}>
              <Text style={styles.skipText}>Skip for now</Text>
            </TouchableOpacity>
          </View>
        );
        
      case 2:
        return (
          <View style={styles.stepContent}>
            <Text style={styles.inputLabel}>Your Name</Text>
            <TextInput
              style={styles.textInput}
              placeholder="How should people call you?"
              value={profile.name}
              onChangeText={(name) => setProfile({ ...profile, name })}
            />
            
            <Text style={styles.inputLabel}>Bio (Optional)</Text>
            <TextInput
              style={[styles.textInput, styles.textArea]}
              placeholder="Share a bit about yourself..."
              value={profile.bio}
              onChangeText={(bio) => setProfile({ ...profile, bio })}
              multiline
              numberOfLines={4}
            />
          </View>
        );
        
      case 3:
        return (
          <View style={styles.stepContent}>
            <InterestSelector
              selectedInterests={profile.interests}
              onInterestsChange={(interests) => setProfile({ ...profile, interests })}
            />
          </View>
        );
        
      case 4:
        return (
          <View style={styles.stepContent}>
            <View style={styles.privacyOption}>
              <Text style={styles.privacyTitle}>Location Sharing</Text>
              <Text style={styles.privacyDesc}>Help others find nearby activities</Text>
              <TouchableOpacity 
                style={[styles.toggle, profile.location_sharing && styles.toggleOn]}
                onPress={() => setProfile({ ...profile, location_sharing: !profile.location_sharing })}
              >
                <View style={[styles.toggleCircle, profile.location_sharing && styles.toggleCircleOn]} />
              </TouchableOpacity>
            </View>
            
            <View style={styles.privacyOption}>
              <Text style={styles.privacyTitle}>Age Range</Text>
              <Text style={styles.privacyDesc}>Help with activity matching</Text>
              <AgeRangeSelector
                selectedRange={profile.age_range}
                onRangeChange={(age_range) => setProfile({ ...profile, age_range })}
              />
            </View>
          </View>
        );
        
      default:
        return null;
    }
  };
  
  return (
    <SafeAreaView style={styles.container}>
      {/* Progress Header */}
      <View style={styles.progressHeader}>
        <TouchableOpacity onPress={handleBack} style={styles.backButton}>
          <Text style={styles.backText}>←</Text>
        </TouchableOpacity>
        
        <View style={styles.progressContainer}>
          <View style={styles.progressBar}>
            <View 
              style={[styles.progressFill, { width: `${(step / totalSteps) * 100}%` }]} 
            />
          </View>
          <Text style={styles.progressText}>Step {step} of {totalSteps}</Text>
        </View>
      </View>
      
      {/* Step Content */}
      <View style={styles.content}>
        <View style={styles.stepHeader}>
          <Text style={styles.stepTitle}>{steps[step - 1].title}</Text>
          <Text style={styles.stepSubtitle}>{steps[step - 1].subtitle}</Text>
        </View>
        
        <ScrollView style={styles.stepScroll}>
          {renderStepContent()}
        </ScrollView>
      </View>
      
      {/* Navigation */}
      <View style={styles.navigation}>
        <TouchableOpacity 
          style={[styles.nextButton, !isStepValid() && styles.nextButtonDisabled]}
          onPress={handleNext}
          disabled={!isStepValid()}
        >
          <Text style={styles.nextButtonText}>
            {step === totalSteps ? 'Complete Setup' : 'Continue'}
          </Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#FFFFFF',
  },
  progressHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    padding: 16,
    borderBottomWidth: 1,
    borderBottomColor: '#F3F4F6',
  },
  backButton: {
    padding: 8,
  },
  backText: {
    fontSize: 24,
    color: '#3B82F6',
  },
  progressContainer: {
    flex: 1,
    alignItems: 'center',
  },
  progressBar: {
    width: 100,
    height: 4,
    backgroundColor: '#E5E7EB',
    borderRadius: 2,
    marginBottom: 8,
  },
  progressFill: {
    height: '100%',
    backgroundColor: '#3B82F6',
    borderRadius: 2,
  },
  progressText: {
    fontSize: 12,
    color: '#6B7280',
  },
  content: {
    flex: 1,
    padding: 24,
  },
  stepHeader: {
    marginBottom: 32,
  },
  stepTitle: {
    fontSize: 24,
    fontWeight: '700',
    color: '#111827',
    marginBottom: 8,
  },
  stepSubtitle: {
    fontSize: 16,
    color: '#6B7280',
  },
  stepContent: {
    flex: 1,
  },
  stepScroll: {
    flex: 1,
  },
  photoUpload: {
    alignItems: 'center',
    marginBottom: 24,
  },
  photoPreview: {
    width: 120,
    height: 120,
    borderRadius: 60,
  },
  photoPlaceholder: {
    width: 120,
    height: 120,
    borderRadius: 60,
    backgroundColor: '#F3F4F6',
    justifyContent: 'center',
    alignItems: 'center',
    borderWidth: 2,
    borderColor: '#E5E7EB',
    borderStyle: 'dashed',
  },
  photoIcon: {
    fontSize: 32,
    marginBottom: 8,
  },
  photoText: {
    fontSize: 14,
    color: '#6B7280',
  },
  skipButton: {
    padding: 12,
  },
  skipText: {
    fontSize: 16,
    color: '#3B82F6',
  },
  inputLabel: {
    fontSize: 16,
    fontWeight: '500',
    color: '#374151',
    marginBottom: 8,
  },
  textInput: {
    borderWidth: 1,
    borderColor: '#E5E7EB',
    borderRadius: 8,
    padding: 12,
    fontSize: 16,
    marginBottom: 24,
  },
  textArea: {
    height: 100,
    textAlignVertical: 'top',
  },
  privacyOption: {
    marginBottom: 32,
  },
  privacyTitle: {
    fontSize: 18,
    fontWeight: '600',
    color: '#111827',
    marginBottom: 4,
  },
  privacyDesc: {
    fontSize: 14,
    color: '#6B7280',
    marginBottom: 16,
  },
  toggle: {
    width: 48,
    height: 28,
    backgroundColor: '#E5E7EB',
    borderRadius: 14,
    padding: 2,
  },
  toggleOn: {
    backgroundColor: '#3B82F6',
  },
  toggleCircle: {
    width: 24,
    height: 24,
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
  },
  toggleCircleOn: {
    alignSelf: 'flex-end',
  },
  navigation: {
    padding: 24,
    borderTopWidth: 1,
    borderTopColor: '#F3F4F6',
  },
  nextButton: {
    backgroundColor: '#3B82F6',
    borderRadius: 8,
    paddingVertical: 16,
    alignItems: 'center',
  },
  nextButtonDisabled: {
    backgroundColor: '#D1D5DB',
  },
  nextButtonText: {
    fontSize: 16,
    fontWeight: '600',
    color: '#FFFFFF',
  },
});
```

---

## 🔥 Main App Screens

### 3. Beacon Feed Screen (Story 2.2 Enhancement)

```jsx
// screens/beacons/BeaconFeedScreen.jsx
import React, { useState, useEffect, useCallback } from 'react';
import { 
  View, 
  FlatList, 
  StyleSheet, 
  RefreshControl, 
  TouchableOpacity, 
  Text,
  ActivityIndicator
} from 'react-native';
import { MaterialIcons } from '@expo/vector-icons';
import { useDispatch, useSelector } from 'react-redux';

// Components
import BeaconCard from '../../components/beacons/BeaconCard';
import SearchInput from '../../components/inputs/SearchInput';
import FilterModal from '../../components/filters/FilterModal';

// Redux
import { fetchBeacons, setFilters } from '../../store/slices/beaconSlice';

const BeaconFeedScreen = ({ navigation }) => {
  const dispatch = useDispatch();
  const { 
    beacons, 
    loading, 
    refreshing, 
    filters, 
    hasMore 
  } = useSelector(state => state.beacons);
  const { user } = useSelector(state => state.auth);
  
  const [searchQuery, setSearchQuery] = useState('');
  const [showFilters, setShowFilters] = useState(false);
  
  useEffect(() => {
    dispatch(fetchBeacons({ page: 1, filters, refresh: true }));
  }, [filters, searchQuery, dispatch]);
  
  const handleRefresh = useCallback(() => {
    dispatch(fetchBeacons({ page: 1, filters, refresh: true }));
  }, [dispatch, filters]);
  
  const handleLoadMore = useCallback(() => {
    if (!loading && hasMore) {
      dispatch(fetchBeacons({ page: 2, filters }));
    }
  }, [dispatch, loading, hasMore, filters]);
  
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
      <Text style={styles.emptyTitle}>No activities found</Text>
      <Text style={styles.emptyDescription}>
        Try adjusting your filters or create your own activity
      </Text>
      <TouchableOpacity 
        style={styles.createButton}
        onPress={handleCreateBeacon}
      >
        <Text style={styles.createButtonText}>Create Activity</Text>
      </TouchableOpacity>
    </View>
  );
  
  const renderHeader = () => (
    <View style={styles.header}>
      <View style={styles.searchSection}>
        <SearchInput
          value={searchQuery}
          onChangeText={setSearchQuery}
          placeholder="Search activities near you..."
          onFocus={() => navigation.navigate('Search')}
        />
        <TouchableOpacity 
          style={styles.filterButton}
          onPress={() => setShowFilters(true)}
        >
          <MaterialIcons name="filter-list" size={20} color="#3B82F6" />
        </TouchableOpacity>
      </View>
      
      {/* Active Filters */}
      {Object.values(filters).some(value => value) && (
        <View style={styles.activeFilters}>
          <Text style={styles.filterLabel}>Active filters:</Text>
          <ScrollView horizontal showsHorizontalScrollIndicator={false}>
            {renderActiveFilters()}
          </ScrollView>
        </View>
      )}
    </View>
  );
  
  const renderActiveFilters = () => {
    const activeFilters = [];
    
    if (filters.categories?.length) {
      filters.categories.forEach(cat => {
        activeFilters.push(
          <TouchableOpacity key={cat} style={styles.filterChip}>
            <Text style={styles.filterChipText}>{cat}</Text>
            <MaterialIcons name="close" size={16} color="#6B7280" />
          </TouchableOpacity>
        );
      });
    }
    
    if (filters.radius) {
      activeFilters.push(
        <TouchableOpacity key="radius" style={styles.filterChip}>
          <Text style={styles.filterChipText}>{filters.radius}km</Text>
          <MaterialIcons name="close" size={16} color="#6B7280" />
        </TouchableOpacity>
      );
    }
    
    return activeFilters;
  };
  
  return (
    <View style={styles.container}>
      <FlatList
        data={beacons}
        renderItem={renderBeacon}
        keyExtractor={(item) => item.id.toString()}
        refreshControl={
          <RefreshControl refreshing={refreshing} onRefresh={handleRefresh} />
        }
        onEndReached={handleLoadMore}
        onEndReachedThreshold={0.1}
        ListHeaderComponent={renderHeader()}
        ListEmptyComponent={!loading && renderEmptyState()}
        ListFooterComponent={
          loading ? (
            <View style={styles.footer}>
              <ActivityIndicator size="small" color="#3B82F6" />
            </View>
          ) : null
        }
        contentContainerStyle={beacons.length === 0 ? styles.emptyList : styles.list}
        showsVerticalScrollIndicator={false}
      />
      
      {/* Floating Action Button */}
      <TouchableOpacity 
        style={styles.fab}
        onPress={handleCreateBeacon}
      >
        <MaterialIcons name="add" size={24} color="#FFFFFF" />
      </TouchableOpacity>
      
      {/* Filter Modal */}
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
    backgroundColor: '#FFFFFF',
    borderBottomWidth: 1,
    borderBottomColor: '#E5E7EB',
  },
  searchSection: {
    flexDirection: 'row',
    alignItems: 'center',
    padding: 16,
    gap: 12,
  },
  filterButton: {
    width: 40,
    height: 40,
    borderRadius: 8,
    backgroundColor: '#F3F4F6',
    justifyContent: 'center',
    alignItems: 'center',
  },
  activeFilters: {
    paddingHorizontal: 16,
    paddingBottom: 12,
  },
  filterLabel: {
    fontSize: 12,
    color: '#6B7280',
    marginBottom: 8,
  },
  filterChip: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#F3F4F6',
    borderRadius: 16,
    paddingHorizontal: 12,
    paddingVertical: 6,
    marginRight: 8,
  },
  filterChipText: {
    fontSize: 12,
    color: '#374151',
    marginRight: 4,
  },
  list: {
    paddingBottom: 80,
  },
  emptyList: {
    flexGrow: 1,
    justifyContent: 'center',
  },
  emptyState: {
    alignItems: 'center',
    paddingHorizontal: 32,
  },
  emptyTitle: {
    fontSize: 20,
    fontWeight: '600',
    color: '#111827',
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
    backgroundColor: '#3B82F6',
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
    backgroundColor: '#3B82F6',
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

### 4. Beacon Detail Screen (Story 2.5 Integration)

```jsx
// screens/beacons/BeaconDetailScreen.jsx
import React, { useState, useEffect } from 'react';
import {
  View,
  Text,
  ScrollView,
  StyleSheet,
  SafeAreaView,
  TouchableOpacity,
  Alert,
  Share,
  Image,
} from 'react-native';
import { MaterialIcons } from '@expo/vector-icons';
import { useDispatch, useSelector } from 'react-redux';

// Components
import MapView from '../../components/maps/MapView';
import ParticipantList from '../../components/beacons/ParticipantList';
import SafetyIndicators from '../../components/safety/SafetyIndicators';
import ReliabilityBadge from '../../components/badges/ReliabilityBadge';

// Redux
import { joinBeacon, leaveBeacon } from '../../store/slices/beaconSlice';

const BeaconDetailScreen = ({ route, navigation }) => {
  const { beaconId } = route.params;
  const dispatch = useDispatch();
  const { user } = useSelector(state => state.auth);
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
      Alert.alert('Error', 'Failed to load beacon details');
    } finally {
      setLoading(false);
    }
  };
  
  const handleJoinBeacon = async () => {
    if (!user) {
      Alert.alert('Sign In Required', 'Please sign in to join this activity');
      return;
    }
    
    setJoining(true);
    try {
      const result = await dispatch(joinBeacon(beaconId));
      if (result.error) {
        Alert.alert('Error', result.error);
      } else {
        // Update local state
        setBeacon({
          ...beacon,
          participants: [...beacon.participants, user],
          joined_count: beacon.joined_count + 1,
          user_joined: true,
        });
        Alert.alert('Success', 'You\'ve joined this activity!');
      }
    } catch (error) {
      Alert.alert('Error', 'Failed to join activity');
    } finally {
      setJoining(false);
    }
  };
  
  const handleLeaveBeacon = async () => {
    Alert.alert(
      'Leave Activity',
      'Are you sure you want to leave this activity?',
      [
        { text: 'Cancel', style: 'cancel' },
        {
          text: 'Leave',
          style: 'destructive',
          onPress: async () => {
            try {
              await dispatch(leaveBeacon(beaconId));
              setBeacon({
                ...beacon,
                participants: beacon.participants.filter(p => p.user.id !== user.id),
                joined_count: beacon.joined_count - 1,
                user_joined: false,
              });
              Alert.alert('Success', 'You\'ve left this activity');
            } catch (error) {
              Alert.alert('Error', 'Failed to leave activity');
            }
          },
        },
      ]
    );
  };
  
  const handleShare = async () => {
    try {
      await Share.share({
        message: `Join me for "${beacon.title}" on Beacon Buddy!\n\nWhen: ${formatDateTime(beacon.event_time)}\nWhere: ${beacon.location_name}`,
        url: `beaconbuddy://beacon/${beacon.id}`,
      });
    } catch (error) {
      console.error('Share error:', error);
    }
  };
  
  const handleReport = () => {
    Alert.alert(
      'Report Activity',
      'Why do you want to report this activity?',
      [
        { text: 'Cancel', style: 'cancel' },
        { text: 'Inappropriate Content', onPress: () => submitReport('inappropriate') },
        { text: 'Spam', onPress: () => submitReport('spam') },
        { text: 'Safety Concern', onPress: () => submitReport('safety') },
      ]
    );
  };
  
  if (loading) {
    return (
      <SafeAreaView style={styles.loadingContainer}>
        <ActivityIndicator size="large" color="#3B82F6" />
      </SafeAreaView>
    );
  }
  
  if (!beacon) {
    return (
      <SafeAreaView style={styles.errorContainer}>
        <Text style={styles.errorText}>Activity not found</Text>
      </SafeAreaView>
    );
  }
  
  const isCreator = beacon.creator.id === user?.id;
  const hasJoined = beacon.user_joined || beacon.participants.some(p => p.user.id === user?.id);
  const canJoin = !isCreator && !hasJoined && !beacon.is_full;
  
  return (
    <SafeAreaView style={styles.container}>
      <ScrollView style={styles.content} showsVerticalScrollIndicator={false}>
        {/* Header with Creator Info */}
        <View style={styles.header}>
          <View style={styles.creatorSection}>
            <Image source={{ uri: beacon.creator.avatar_url }} style={styles.creatorAvatar} />
            <View style={styles.creatorInfo}>
              <Text style={styles.creatorName}>{beacon.creator.name}</Text>
              <View style={styles.creatorMeta}>
                <ReliabilityBadge score={beacon.creator.reliability_score} />
                <Text style={styles.creatorLevel}>{getReliabilityLevel(beacon.creator.reliability_score)}</Text>
              </View>
              <Text style={styles.creatorBio}>{beacon.creator.bio}</Text>
            </View>
          </View>
          
          {/* Action Buttons */}
          <View style={styles.headerActions}>
            <TouchableOpacity style={styles.actionButton} onPress={handleShare}>
              <MaterialIcons name="share" size={20} color="#6B7280" />
            </TouchableOpacity>
            <TouchableOpacity style={styles.actionButton} onPress={handleReport}>
              <MaterialIcons name="flag" size={20} color="#6B7280" />
            </TouchableOpacity>
          </View>
        </View>
        
        {/* Safety Indicators */}
        <SafetyIndicators 
          verificationLevel={beacon.creator.verification_level}
          reliabilityScore={beacon.creator.reliability_score}
          participantCount={beacon.joined_count}
        />
        
        {/* Beacon Info */}
        <View style={styles.infoSection}>
          <Text style={styles.title}>{beacon.title}</Text>
          <Text style={styles.description}>{beacon.description}</Text>
          
          {/* Category Badge */}
          <View style={styles.categoryBadge}>
            <Text style={styles.categoryText}>{beacon.category}</Text>
          </View>
        </View>
        
        {/* Meta Information */}
        <View style={styles.metaSection}>
          <View style={styles.metaItem}>
            <MaterialIcons name="schedule" size={20} color="#6B7280" />
            <View style={styles.metaContent}>
              <Text style={styles.metaLabel}>When</Text>
              <Text style={styles.metaValue}>{formatDateTime(beacon.event_time)}</Text>
            </View>
          </View>
          
          <View style={styles.metaItem}>
            <MaterialIcons name="location-on" size={20} color="#6B7280" />
            <View style={styles.metaContent}>
              <Text style={styles.metaLabel}>Where</Text>
              <Text style={styles.metaValue}>{beacon.location_name}</Text>
              <Text style={styles.metaAddress}>{beacon.location_address}</Text>
            </View>
          </View>
          
          <View style={styles.metaItem}>
            <MaterialIcons name="group" size={20} color="#6B7280" />
            <View style={styles.metaContent}>
              <Text style={styles.metaLabel}>Group Size</Text>
              <Text style={styles.metaValue}>{beacon.joined_count} of {beacon.max_participants}</Text>
              <View style={styles.progressBar}>
                <View 
                  style={[styles.progressFill, { width: `${(beacon.joined_count / beacon.max_participants) * 100}%` }]} 
                />
              </View>
            </View>
          </View>
          
          {beacon.cost_per_person > 0 && (
            <View style={styles.metaItem}>
              <MaterialIcons name="payments" size={20} color="#6B7280" />
              <View style={styles.metaContent}>
                <Text style={styles.metaLabel}>Cost</Text>
                <Text style={styles.metaValue}>₹{beacon.cost_per_person} per person</Text>
              </View>
            </View>
          )}
        </View>
        
        {/* Map */}
        <View style={styles.mapSection}>
          <Text style={styles.sectionTitle}>Location</Text>
          <MapView
            style={styles.map}
            location={{
              latitude: beacon.location_lat,
              longitude: beacon.location_lng,
            }}
            title={beacon.location_name}
            description={beacon.location_address}
          />
        </View>
        
        {/* Participants */}
        <View style={styles.participantsSection}>
          <Text style={styles.sectionTitle}>Participants ({beacon.joined_count})</Text>
          <ParticipantList 
            participants={beacon.participants}
            maxParticipants={beacon.max_participants}
            showJoinButton={!hasJoined && canJoin}
          />
        </View>
        
        {/* Activity Guidelines */}
        <View style={styles.guidelinesSection}>
          <Text style={styles.sectionTitle}>What to Expect</Text>
          <View style={styles.guidelineItem}>
            <MaterialIcons name="check-circle" size={16} color="#22C55E" />
            <Text style={styles.guidelineText}>Verified participants</Text>
          </View>
          <View style={styles.guidelineItem}>
            <MaterialIcons name="check-circle" size={16} color="#22C55E" />
            <Text style={styles.guidelineText}>Safe meeting location</Text>
          </View>
          <View style={styles.guidelineItem}>
            <MaterialIcons name="check-circle" size={16} color="#22C55E" />
            <Text style={styles.guidelineText}>Group chat for coordination</Text>
          </View>
        </View>
      </ScrollView>
      
      {/* Fixed Action Button */}
      {user && !isCreator && (
        <View style={styles.actionSection}>
          <TouchableOpacity
            style={[
              styles.joinButton,
              hasJoined && styles.leaveButton,
              !canJoin && !hasJoined && styles.disabledButton,
            ]}
            onPress={hasJoined ? handleLeaveBeacon : handleJoinBeacon}
            disabled={!canJoin && !hasJoined}
          >
            <Text style={[
              styles.joinButtonText,
              hasJoined && styles.leaveButtonText,
            ]}>
              {joining ? 'Loading...' : hasJoined ? 'Leave Activity' : 'Join Activity'}
            </Text>
          </TouchableOpacity>
        </View>
      )}
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#FFFFFF',
  },
  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  errorContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  errorText: {
    fontSize: 16,
    color: '#6B7280',
  },
  content: {
    flex: 1,
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
    padding: 20,
    borderBottomWidth: 1,
    borderBottomColor: '#F3F4F6',
  },
  creatorSection: {
    flexDirection: 'row',
    flex: 1,
  },
  creatorAvatar: {
    width: 48,
    height: 48,
    borderRadius: 24,
    marginRight: 12,
  },
  creatorInfo: {
    flex: 1,
  },
  creatorName: {
    fontSize: 18,
    fontWeight: '600',
    color: '#111827',
    marginBottom: 4,
  },
  creatorMeta: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 4,
  },
  creatorLevel: {
    fontSize: 12,
    color: '#6B7280',
    marginLeft: 8,
  },
  creatorBio: {
    fontSize: 14,
    color: '#6B7280',
  },
  headerActions: {
    flexDirection: 'row',
    gap: 8,
  },
  actionButton: {
    width: 36,
    height: 36,
    borderRadius: 18,
    backgroundColor: '#F3F4F6',
    justifyContent: 'center',
    alignItems: 'center',
  },
  infoSection: {
    padding: 20,
  },
  title: {
    fontSize: 24,
    fontWeight: '700',
    color: '#111827',
    marginBottom: 12,
  },
  description: {
    fontSize: 16,
    color: '#4B5563',
    lineHeight: 24,
    marginBottom: 16,
  },
  categoryBadge: {
    backgroundColor: '#EFF6FF',
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 16,
    alignSelf: 'flex-start',
  },
  categoryText: {
    fontSize: 14,
    color: '#3B82F6',
    fontWeight: '500',
  },
  metaSection: {
    padding: 20,
    paddingTop: 0,
  },
  metaItem: {
    flexDirection: 'row',
    marginBottom: 20,
  },
  metaContent: {
    marginLeft: 12,
    flex: 1,
  },
  metaLabel: {
    fontSize: 12,
    color: '#6B7280',
    marginBottom: 2,
  },
  metaValue: {
    fontSize: 16,
    color: '#111827',
    fontWeight: '500',
  },
  metaAddress: {
    fontSize: 14,
    color: '#6B7280',
    marginTop: 2,
  },
  progressBar: {
    width: '100%',
    height: 4,
    backgroundColor: '#E5E7EB',
    borderRadius: 2,
    marginTop: 8,
  },
  progressFill: {
    height: '100%',
    backgroundColor: '#22C55E',
    borderRadius: 2,
  },
  mapSection: {
    padding: 20,
    paddingTop: 0,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: '600',
    color: '#111827',
    marginBottom: 12,
  },
  map: {
    height: 200,
    borderRadius: 8,
  },
  participantsSection: {
    padding: 20,
    paddingTop: 0,
  },
  guidelinesSection: {
    padding: 20,
    paddingTop: 0,
    marginBottom: 80, // Space for fixed button
  },
  guidelineItem: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 12,
  },
  guidelineText: {
    fontSize: 14,
    color: '#4B5563',
    marginLeft: 8,
  },
  actionSection: {
    position: 'absolute',
    bottom: 0,
    left: 0,
    right: 0,
    padding: 20,
    backgroundColor: '#FFFFFF',
    borderTopWidth: 1,
    borderTopColor: '#E5E7EB',
  },
  joinButton: {
    backgroundColor: '#3B82F6',
    borderRadius: 8,
    paddingVertical: 16,
    alignItems: 'center',
  },
  leaveButton: {
    backgroundColor: '#EF4444',
  },
  disabledButton: {
    backgroundColor: '#D1D5DB',
  },
  joinButtonText: {
    fontSize: 16,
    fontWeight: '600',
    color: '#FFFFFF',
  },
  leaveButtonText: {
    color: '#FFFFFF',
  },
});

export default BeaconDetailScreen;
```

---

## 🎨 Component Integration Guide

### Integration with Current App.tsx

```jsx
// Enhanced App.tsx with navigation
import React, { useEffect } from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { StatusBar, StyleSheet } from 'react-native';
import { MaterialIcons } from '@expo/vector-icons';

// Screens
import WelcomeScreen from './screens/auth/WelcomeScreen';
import ProfileSetupScreen from './screens/auth/ProfileSetupScreen';
import BeaconFeedScreen from './screens/beacons/BeaconFeedScreen';
import BeaconDetailScreen from './screens/beacons/BeaconDetailScreen';
import CreateBeaconScreen from './screens/beacons/CreateBeaconScreen';
import ProfileScreen from './screens/profile/ProfileScreen';

// Auth Context
import { AuthProvider, useAuth } from './contexts/AuthContext';

const Stack = createNativeStackNavigator();
const Tab = createBottomTabNavigator();

const MainTabs = () => {
  return (
    <Tab.Navigator
      screenOptions={({ route }) => ({
        tabBarIcon: ({ focused, color, size }) => {
          let iconName;
          if (route.name === 'Feed') iconName = 'explore';
          else if (route.name === 'Create') iconName = 'add';
          else if (route.name === 'Activity') iconName = 'history';
          else if (route.name === 'Profile') iconName = 'person';
          
          return <MaterialIcons name={iconName} size={size} color={color} />;
        },
        tabBarActiveTintColor: '#3B82F6',
        tabBarInactiveTintColor: '#6B7280',
        tabBarStyle: {
          backgroundColor: '#FFFFFF',
          borderTopWidth: 1,
          borderTopColor: '#E5E7EB',
        },
      })}
    >
      <Tab.Screen 
        name="Feed" 
        component={BeaconFeedScreen}
        options={{ title: 'Discover' }}
      />
      <Tab.Screen 
        name="Create" 
        component={CreateBeaconScreen}
        options={{ title: 'Create' }}
      />
      <Tab.Screen 
        name="Activity" 
        component={ActivityScreen}
        options={{ title: 'My Activity' }}
      />
      <Tab.Screen 
        name="Profile" 
        component={ProfileScreen}
        options={{ title: 'Profile' }}
      />
    </Tab.Navigator>
  );
};

const AuthStack = () => {
  return (
    <Stack.Navigator screenOptions={{ headerShown: false }}>
      <Stack.Screen name="Welcome" component={WelcomeScreen} />
      <Stack.Screen name="ProfileSetup" component={ProfileSetupScreen} />
    </Stack.Navigator>
  );
};

const AppNavigator = () => {
  const { user, loading } = useAuth();
  
  if (loading) {
    return <LoadingScreen />;
  }
  
  return (
    <Stack.Navigator screenOptions={{ headerShown: false }}>
      {user ? (
        <Stack.Screen name="Main" component={MainTabs} />
      ) : (
        <Stack.Screen name="Auth" component={AuthStack} />
      )}
      <Stack.Screen name="BeaconDetail" component={BeaconDetailScreen} />
    </Stack.Navigator>
  );
};

const App = () => {
  return (
    <AuthProvider>
      <NavigationContainer>
        <StatusBar barStyle="dark-content" backgroundColor="#FFFFFF" />
        <AppNavigator />
      </NavigationContainer>
    </AuthProvider>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#FFFFFF',
  },
});

export default App;
```

---

## 🎯 Design System Usage Guidelines

### 1. Component Import Structure
```jsx
// Centralized component exports
export { default as PrimaryButton } from './buttons/PrimaryButton';
export { default as BeaconCard } from './cards/BeaconCard';
export { default as SearchInput } from './inputs/SearchInput';
export { default as ReliabilityBadge } from './badges/ReliabilityBadge';
```

### 2. Theme Provider Setup
```jsx
// Import theme system
import { ThemeProvider, useTheme } from '../design/theme';
```

### 3. Component Usage
```jsx
// Import components
import { PrimaryButton, BeaconCard, SearchInput } from '../design/components';
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
├── contexts/
│   └── ThemeContext.js
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

This comprehensive UI/UX design system provides complete screen designs that integrate with your existing React Native implementation while following the user stories and maintaining consistency across the application.
