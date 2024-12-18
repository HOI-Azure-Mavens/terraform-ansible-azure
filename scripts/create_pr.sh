#!/bin/bash

# Script to push changes and create a pull request systematically

# Input parameters
BRANCH_NAME=$1
PR_TITLE=$2
PR_BODY=$3
BASE_BRANCH=${4:-"main"}  # Default to 'main'

# Check for required arguments
if [ -z "$BRANCH_NAME" ] || [ -z "$PR_TITLE" ] || [ -z "$PR_BODY" ]; then
    echo "Usage: ./create_pr.sh <branch-name> <pr-title> <pr-body> [<base-branch>]"
    exit 1
fi

# Ensure the branch exists
echo "Checking out to branch '$BRANCH_NAME'..."
git checkout -b "$BRANCH_NAME" || git checkout "$BRANCH_NAME"

# Push branch to remote
echo "Pushing branch '$BRANCH_NAME' to origin..."
git push -u origin "$BRANCH_NAME"

# Create a PR using GitHub CLI
echo "Creating Pull Request..."
gh pr create --base "$BASE_BRANCH" --head "$BRANCH_NAME" --title "$PR_TITLE" --body "$PR_BODY"

echo "Pull request successfully created!"
