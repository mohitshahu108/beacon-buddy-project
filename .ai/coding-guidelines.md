# AI Coding Guidelines for Beacon Buddy

## Frontend Development Prompts

### Component Creation Template
```
Create a React Native component for Beacon Buddy following these patterns:
- Use TypeScript with strict mode
- Follow existing component structure in components/
- Use Zustand for state management
- Include proper error handling
- Add accessibility labels
- Follow the design system patterns

Context: [Paste relevant .ai/project-context.md]
API Contract: [Paste relevant .ai/api-contracts.md]
```

### Service Creation Template
```
Create a service for Beacon Buddy API integration:
- Use existing service patterns in services/
- Handle all error cases properly
- Include TypeScript interfaces
- Add retry logic for network failures
- Use the API contracts from .ai/api-contracts.md

Context: [Paste .ai/project-context.md]
```

## Backend Development Prompts

### Controller Template
```
Create a Rails API controller for Beacon Buddy:
- Follow JSON:API specification
- Include proper error handling
- Add authentication middleware
- Use strong parameters
- Follow existing controller patterns

Context: [Paste .ai/project-context.md]
API Contract: [Paste .ai/api-contracts.md]
```

### Service Template
```
Create a Rails service for Beacon Buddy:
- Include proper error handling
- Add logging for debugging
- Follow existing service patterns
- Include transaction handling
- Use dependency injection

Context: [Paste .ai/project-context.md]
```

## AI Development Rules
1. **Always reference project context**
2. **Follow existing patterns exactly**
3. **Include comprehensive error handling**
4. **Add TypeScript types/interfaces**
5. **Test all edge cases**
6. **Follow deployment requirements**
