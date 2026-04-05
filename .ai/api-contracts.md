# Frontend-Backend API Contracts

## Authentication Endpoints

### POST /api/v1/auth/google
**Request**: `{ google_id_token: string }`
**Response**: 
```json
{
  "data": {
    "user": User,
    "access_token": string,
    "refresh_token": string,
    "expires_in": number
  }
}
```

### POST /api/v1/auth/refresh
**Request**: `{ refresh_token: string }`
**Response**:
```json
{
  "data": {
    "access_token": string,
    "refresh_token": string,
    "expires_in": number
  }
}
```

## User Types (Shared)

```typescript
interface User {
  id: string;
  googleId: string;
  email: string;
  name: string;
  avatarUrl?: string;
  reliabilityScore: number;
  createdAt: string;
  updatedAt: string;
}
```

## AI Development Rules
1. **Frontend**: Use these types for API responses
2. **Backend**: Ensure responses match these contracts exactly
3. **Testing**: Test contract compliance
4. **Versioning**: Update contracts when API changes
