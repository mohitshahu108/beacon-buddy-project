# AI Development Commands

## Quick Start CommandOpen [https://github.com/login/device](https://github.com/login/device) in a new tab and paste your one-time code: 68BE-30B4s

### Frontend Development
```bash
# Create new component
ai "Create a React Native component for [feature] following .ai/coding-guidelines.md"

# Fix authentication issue
ai "Fix the Google Sign-In issue in authService.ts using .ai/project-context.md"

# Add new screen
ai "Create a new screen for [feature] using existing patterns in app/(tabs)/"
```

### Backend Development
```bash
# Create API endpoint
ai "Create API endpoint for [resource] following .ai/coding-guidelines.md and .ai/api-contracts.md"

# Fix service issue
ai "Fix the token service issue using .ai/project-context.md"

# Add model
ai "Create model for [resource] with proper validations"
```

### Full Stack Development
```bash
# Implement feature end-to-end
ai "Implement [feature] for both frontend and backend using .ai/project-context.md"

# Fix integration issue
ai "Fix the API integration issue between frontend and backend using .ai/api-contracts.md"
```

## AI Prompt Optimization

### Always Include
1. Project context from `.ai/project-context.md`
2. Relevant API contracts from `.ai/api-contracts.md`
3. Specific coding guidelines from `.ai/coding-guidelines.md`
4. Current file context when fixing issues

### Example Complete Prompt
```
I need to implement user profile editing for Beacon Buddy.

Context: [paste .ai/project-context.md]
API Contract: [paste .ai/api-contracts.md]
Coding Guidelines: [paste .ai/coding-guidelines.md]

Requirements:
- Frontend: Create profile editing screen
- Backend: Add PUT /api/v1/users/profile endpoint
- Use existing patterns
- Include proper error handling
- Follow TypeScript interfaces

Current files:
- Frontend: beacon-buddy-frontend/app/(tabs)/profile.tsx
- Backend: beacon-buddy-api/app/models/user.rb
```

## Best Practices
1. **Always reference AI context files**
2. **Use specific, detailed prompts**
3. **Include current file context**
4. **Follow existing patterns exactly**
5. **Test after AI implementation**
6. **Review AI code for security**
