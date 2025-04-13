#!/bin/bash

# Script to send rich notifications about documentation deployments to Google Chat
# Usage: ./scripts/send-notification.sh <webhook_url> <repo> <run_id>

# Exit on any error
set -e

WEBHOOK_URL="$1"
REPO="$2"
RUN_ID="$3"

if [ -z "$WEBHOOK_URL" ]; then
  echo "❌ Error: Webhook URL is required"
  exit 1
fi

if [ -z "$REPO" ]; then
  echo "❌ Error: Repository name is required"
  exit 1
fi

if [ -z "$RUN_ID" ]; then
  echo "❌ Error: Run ID is required"
  exit 1
fi

# Extract organization and repository name
IFS='/' read -r ORG REPO_NAME <<< "$REPO"

# Setup URLs
ACTIONS_URL="https://github.com/${REPO}/actions"
GH_PAGES_URL="https://${ORG}.github.io/${REPO_NAME}/"
CURRENT_RUN_URL="${ACTIONS_URL}/runs/${RUN_ID}"
PAGES_WORKFLOW_URL="${ACTIONS_URL}/workflows/pages/pages-build-deployment"

# Get the logo URL - using color logo with no background
LOGO_URL="https://raw.githubusercontent.com/${REPO}/main/docs/assets/images/217183861/Logo%20Files/png/Color%20logo%20-%20no%20background.png"

# Create Google Chat card format JSON
JSON_PAYLOAD=$(cat <<EOF
{
  "cards": [
    {
      "header": {
        "title": "🚀 Documentation Deployment Process",
        "subtitle": "${REPO}",
        "imageUrl": "${LOGO_URL}"
      },
      "sections": [
        {
          "header": "Step 1: Documentation Build & Push ✅",
          "widgets": [
            {
              "textParagraph": {
                "text": "The documentation has been built and pushed to the gh-pages branch."
              }
            }
          ]
        },
        {
          "widgets": [
            {
              "buttons": [
                {
                  "textButton": {
                    "text": "View Build Details",
                    "onClick": {
                      "openLink": {
                        "url": "${CURRENT_RUN_URL}"
                      }
                    }
                  }
                }
              ]
            }
          ]
        },
        {
          "header": "Step 2: GitHub Pages Deployment ⏳",
          "widgets": [
            {
              "textParagraph": {
                "text": "The GitHub Pages workflow has been triggered and will deploy shortly."
              }
            }
          ]
        },
        {
          "widgets": [
            {
              "buttons": [
                {
                  "textButton": {
                    "text": "Check Pages Workflow",
                    "onClick": {
                      "openLink": {
                        "url": "${PAGES_WORKFLOW_URL}"
                      }
                    }
                  }
                },
                {
                  "textButton": {
                    "text": "View Documentation",
                    "onClick": {
                      "openLink": {
                        "url": "${GH_PAGES_URL}"
                      }
                    }
                  }
                }
              ]
            }
          ]
        },
        {
          "widgets": [
            {
              "textParagraph": {
                "text": "⚠️ Please verify the GitHub Pages deployment completed successfully"
              }
            }
          ]
        }
      ]
    }
  ]
}
EOF
)

# Send the notification to Google Chat
curl -s -X POST -H "Content-Type: application/json" \
  -d "$JSON_PAYLOAD" \
  "$WEBHOOK_URL"

echo "✅ Notification sent successfully"