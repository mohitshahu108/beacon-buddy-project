#!/bin/bash

# Sync AI Context Across Repositories

echo "🔄 Syncing AI context across Beacon Buddy repositories..."

# Configuration
FRONTEND_REPO="../beacon-buddy-frontend"
BACKEND_REPO="../beacon-buddy-backend"
SHARED_REPO="."

# Function to sync file to repo
sync_file() {
    local source=$1
    local target_repo=$2
    local target_path=$3
    
    if [ -d "$target_repo" ]; then
        echo "📋 Syncing $source to $target_repo"
        mkdir -p "$target_repo/.ai"
        cp "$source" "$target_repo/$target_path"
    else
        echo "⚠️  Repository $target_repo not found"
    fi
}

# Sync shared context to all repos
echo "🤖 Syncing shared AI context..."
sync_file "$SHARED_REPO/.ai/shared-context-template.md" "$FRONTEND_REPO" ".ai/shared-context.md"
sync_file "$SHARED_REPO/.ai/shared-context-template.md" "$BACKEND_REPO" ".ai/shared-context.md"

# Sync API contracts
echo "📡 Syncing API contracts..."
sync_file "$SHARED_REPO/.ai/api-contracts.md" "$FRONTEND_REPO" ".ai/api-contracts.md"
sync_file "$SHARED_REPO/.ai/api-contracts.md" "$BACKEND_REPO" ".ai/api-contracts.md"

# Sync shared types
echo "📝 Syncing shared types..."
sync_file "$SHARED_REPO/.ai/shared-types.md" "$FRONTEND_REPO" ".ai/shared-types.md"
sync_file "$SHARED_REPO/.ai/shared-types.md" "$BACKEND_REPO" ".ai/shared-types.md"

echo "✅ AI context synchronized across repositories!"
echo ""
echo "📝 Next steps:"
echo "1. Commit and push changes in each repository"
echo "2. Update AI prompts to reference shared context"
echo "3. Test cross-repo development workflow"
