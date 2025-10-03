#!/bin/bash

# Simple deployment script for GitHub Pages
# Run this script to manually deploy your site

echo "🚀 Deploying Sara's Cocina to GitHub Pages..."

# Check if we're in the right directory
if [ ! -f "index.html" ]; then
    echo "❌ Error: index.html not found. Please run this script from the project root."
    exit 1
fi

# Check if git is available
if ! command -v git &> /dev/null; then
    echo "❌ Error: Git is not installed or not in PATH."
    exit 1
fi

# Check git status
if [ -n "$(git status --porcelain)" ]; then
    echo "⚠️  Warning: You have uncommitted changes. Consider committing them first."
    read -p "Continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Deployment cancelled."
        exit 1
    fi
fi

# Create gh-pages branch if it doesn't exist
if ! git show-ref --verify --quiet refs/remotes/origin/gh-pages; then
    echo "📝 Creating gh-pages branch..."
    git checkout -b gh-pages
    git push -u origin gh-pages
else
    echo "📝 Switching to gh-pages branch..."
    git checkout gh-pages
fi

# Remove all files except .git
echo "🧹 Cleaning gh-pages branch..."
git rm -rf . || true

# Copy current files
echo "📁 Copying current files..."
git checkout main -- index.html css/ js/ assets/ .github/

# Add and commit
echo "💾 Committing changes..."
git add .
git commit -m "Deploy to GitHub Pages - $(date)"

# Push to gh-pages
echo "🚀 Pushing to gh-pages branch..."
git push origin gh-pages

# Switch back to main branch
echo "🔄 Switching back to main branch..."
git checkout main

echo "✅ Deployment complete!"
echo "🌐 Your site should be available at: https://dunosis.github.io/sarascocina/"
echo "⏱️  It may take a few minutes for changes to appear."
