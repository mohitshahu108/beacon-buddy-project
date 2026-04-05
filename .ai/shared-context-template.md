# Shared AI Context - Beacon Buddy

## Repository Coordination
- **Frontend Repo**: `beacon-buddy-frontend`
- **Backend Repo**: `beacon-buddy-backend`
- **Shared Repo**: `beacon-buddy-shared` (current)
- **Documentation Repo**: `beacon-buddy-docs`

## Cross-Repository Development Rules

### When Working on Frontend Repo
1. **Always check**: `beacon-buddy-shared/api-contracts.md`
2. **Reference**: Shared types from `beacon-buddy-shared/shared-types.md`
3. **Coordinate**: Backend changes may require frontend updates
4. **Testing**: Use shared integration test patterns

### When Working on Backend Repo
1. **Always check**: `beacon-buddy-shared/api-contracts.md`
2. **Update**: API contracts when endpoints change
3. **Notify**: Frontend team of breaking changes
4. **Testing**: Use shared contract tests

### When Working on Shared Repo
1. **API Contracts**: Single source of truth
2. **Shared Types**: TypeScript interfaces for both repos
3. **Integration Stories**: Cross-repo user stories
4. **Testing**: Contract testing utilities

## AI Prompt Templates for Separate Repos

### Frontend Development
```
I'm working on the Beacon Buddy frontend repo.

Context: 
- Frontend: React Native + Expo
- Backend: Rails API (separate repo)
- Shared Types: [paste from beacon-buddy-shared/shared-types.md]
- API Contracts: [paste from beacon-buddy-shared/api-contracts.md]

Task: [specific frontend task]
Requirements: Follow frontend patterns in .ai/coding-guidelines.md
```

### Backend Development
```
I'm working on the Beacon Buddy backend repo.

Context:
- Backend: Rails API
- Frontend: React Native (separate repo)
- API Contracts: [paste from beacon-buddy-shared/api-contracts.md]
- Shared Types: [paste from beacon-buddy-shared/shared-types.md]

Task: [specific backend task]
Requirements: Follow backend patterns in .ai/coding-guidelines.md
```

### Cross-Repository Features
```
I need to implement [feature] that spans frontend and backend.

Context:
- Frontend Repo: beacon-buddy-frontend
- Backend Repo: beacon-buddy-backend
- Shared Context: [paste from beacon-buddy-shared/]
- Integration Story: [paste relevant story]

Task: Implement end-to-end feature
Requirements: 
1. Update API contracts in shared repo
2. Implement backend changes
3. Implement frontend changes
4. Update shared types if needed
```

## BMAD Workflow Adaptation

### Story Planning
- **Location**: Use shared repo for cross-repo stories
- **Tracking**: Include repository dependencies
- **Implementation**: Plan across multiple repos

### Code Reviews
- **Cross-Repo**: Review API contract changes
- **Integration**: Test frontend-backend coordination
- **Deployment**: Ensure compatible releases

### Sprint Planning
- **Dependencies**: Track cross-repo dependencies
- **Release**: Coordinate frontend/backend releases
- **Testing**: Include integration testing
