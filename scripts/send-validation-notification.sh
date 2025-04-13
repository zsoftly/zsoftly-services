#!/bin/bash

# Script to send simple notifications about documentation validation to Google Chat
# Usage: ./scripts/send-validation-notification.sh <webhook_url> <repo> <run_id> [pr_number] [branch_name]

# Exit on any error
set -e

WEBHOOK_URL="$1"
REPO="$2"
RUN_ID="$3"
PR_NUMBER="$4"
BRANCH_NAME="$5"

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

# Create Google Chat message JSON
if [ -n "$PR_NUMBER" ]; then
  # For PR validations
  THREAD_KEY="${REPO}-pr-${PR_NUMBER}"
  PR_URL="https://github.com/${REPO}/pull/${PR_NUMBER}"
  
  JSON_PAYLOAD=$(cat <<EOF
{
  "thread": {
    "threadKey": "${THREAD_KEY}"
  },
  "cards": [
    {
      "header": {
        "title": "✅ Documentation Validation Passed",
        "subtitle": "${REPO}"
      },
      "sections": [
        {
          "widgets": [
            {
              "textParagraph": {
                "text": "PR #${PR_NUMBER} is ready for review and can be merged."
              }
            },
            {
              "buttons": [
                {
                  "textButton": {
                    "text": "Review PR",
                    "onClick": {
                      "openLink": {
                        "url": "${PR_URL}"
                      }
                    }
                  }
                },
                {
                  "textButton": {
                    "text": "View Workflow",
                    "onClick": {
                      "openLink": {
                        "url": "https://github.com/${REPO}/actions/runs/${RUN_ID}"
                      }
                    }
                  }
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}
EOF
)
else
  # For branch push validations
  THREAD_KEY="${REPO}-branch-${BRANCH_NAME}"
  
  JSON_PAYLOAD=$(cat <<EOF
{
  "thread": {
    "threadKey": "${THREAD_KEY}"
  },
  "cards": [
    {
      "header": {
        "title": "✅ Documentation Validation Passed",
        "subtitle": "${REPO}"
      },
      "sections": [
        {
          "widgets": [
            {
              "textParagraph": {
                "text": "Branch '${BRANCH_NAME}' validation completed successfully."
              }
            },
            {
              "buttons": [
                {
                  "textButton": {
                    "text": "View Workflow",
                    "onClick": {
                      "openLink": {
                        "url": "https://github.com/${REPO}/actions/runs/${RUN_ID}"
                      }
                    }
                  }
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}
EOF
)
fi

# Send the notification to Google Chat
curl -s -X POST -H "Content-Type: application/json" \
  -d "$JSON_PAYLOAD" \
  "$WEBHOOK_URL"

echo "✅ Validation notification sent successfully"