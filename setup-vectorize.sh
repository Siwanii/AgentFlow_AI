#!/bin/bash

# Setup script for Cloudflare Vectorize index
# Run this before deploying to create the Vectorize index

echo "🔧 Setting up Vectorize index for RAG..."

# Create Vectorize index
wrangler vectorize create rag-documents \
  --dimensions=384 \
  --metric=cosine \
  --description="RAG documents index for AI Agent"

# Index sessionId so queries can filter to one session's documents.
# Must exist BEFORE vectors are inserted - earlier vectors won't be filterable.
wrangler vectorize create-metadata-index rag-documents \
  --property-name=sessionId \
  --type=string

echo "✅ Vectorize index 'rag-documents' created successfully!"
echo ""
echo "Note: Make sure you have Vectorize enabled in your Cloudflare dashboard."

