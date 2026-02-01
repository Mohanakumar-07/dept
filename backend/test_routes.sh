#!/bin/bash
# Quick test script for all routes

API_URL="http://localhost:4567"

echo "🧪 Testing DS Evaluator Backend Routes..."
echo "=========================================="

# Test public route
echo "✓ Testing /api/config/extensions (public)"
curl -s "$API_URL/api/config/extensions" | head -c 50
echo ""

# Test analytics route
echo "✓ Testing /analytics (redirects to login if not authenticated)"
curl -s -I "$API_URL/analytics" | grep "HTTP\|Location"

# Test analytics.html route
echo "✓ Testing /analytics.html (redirects to login if not authenticated)"
curl -s -I "$API_URL/analytics.html" | grep "HTTP\|Location"

# Test export route
echo "✓ Testing /api/admin/export-submissions (requires auth)"
curl -s -I "$API_URL/api/admin/export-submissions" | grep "HTTP\|Location"

echo ""
echo "=========================================="
echo "✅ Route test complete!"
echo ""
echo "Next steps:"
echo "1. Start production server: gunicorn -c gunicorn_config.py server:app"
echo "2. Test with real authentication from frontend"
echo "3. Monitor logs for any issues"
