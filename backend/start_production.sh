#!/bin/bash
# Production deployment script for DS Evaluator Backend

echo "🚀 Starting DS Evaluator Backend Deployment..."

# Install dependencies
echo "📦 Installing dependencies..."
pip install -r requirements.txt

# Check environment variables
echo "🔍 Checking environment configuration..."
if [ -z "$DATABASE_URL" ]; then
    echo "❌ ERROR: DATABASE_URL not set"
    exit 1
fi

if [ -z "$FRONTEND_URL" ]; then
    echo "❌ ERROR: FRONTEND_URL not set"
    exit 1
fi

if [ -z "$GROQ_API_KEY" ]; then
    echo "❌ ERROR: GROQ_API_KEY not set"
    exit 1
fi

echo "✅ Environment configured correctly"

# Start server with Gunicorn (2 workers)
echo " Starting Gunicorn with 2 workers..."
gunicorn -c gunicorn_config.py server:app
