#!/bin/bash

# Script to send notifications about documentation validation to Google Chat
# Usage: ./scripts/send-validation-notification.sh <webhook_url> <repo> <run_id> <pr_number> <pr_title> <pr_author>

# Exit on any error
set -e

WEBHOOK_URL="$1"
REPO="$2"
RUN_ID="$3"
PR_NUMBER="$4"
PR_TITLE="$5"
PR_AUTHOR="$6"

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

# Get the logo URL - using color logo with no background
LOGO_URL="https://raw.githubusercontent.com/${REPO}/main/docs/assets/images/217183861/Logo%20Files/png/Color%20logo%20-%20no%20background.png"

# Create Google Chat card format JSON for validation results
if [ -z "$PR_NUMBER" ]; then
  # For branch push validations
  JSON_PAYLOAD=$(cat <<EOF
{
  "cards": [
    {
      "header": {
        "title": "📋 Documentation Validation",
        "subtitle": "${REPO}",
        "imageUrl": "${LOGO_URL}"
      },
      "sections": [
        {
          "header": "✅ Validation Successful",
          "widgets": [
            {
              "textParagraph": {
                "text": "Documentation validation has successfully completed for branch push."
              }
            },
            {
              "buttons": [
                {
                  "textButton": {
                    "text": "View Workflow Run",
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
  # For PR validations
  JSON_PAYLOAD=$(cat <<EOF
{
  "cards": [
    {
      "header": {
        "title": "📋 Documentation Validation",
        "subtitle": "${REPO}",
        "imageUrl": "${LOGO_URL}"
      },
      "sections": [
        {
          "header": "✅ Validation Successful",
          "widgets": [
            {
              "textParagraph": {
                "text": "Documentation validation has successfully completed for PR #${PR_NUMBER}."
              }
            },
            {
              "textParagraph": {
                "text": "<b>Pull Request:</b> ${PR_INFO:-#${PR_NUMBER}: ${PR_TITLE}}"
              }
            },
            {
              "textParagraph": {
                "text": "<b>Author:</b> ${PR_AUTHOR}"
              }
            },
            {
              "buttons": [
                {
                  "textButton": {
                    "text": "View Pull Request",
                    "onClick": {
                      "openLink": {
                        "url": "https://github.com/${REPO}/pull/${PR_NUMBER}"
                      }
                    }
                  }
                },
                {
                  "textButton": {
                    "text": "View Workflow Run",
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