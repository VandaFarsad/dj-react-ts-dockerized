#!/usr/bin/env bash

set -e

echo "Initializing Dev environment..."
npm install
npm run build
npm start