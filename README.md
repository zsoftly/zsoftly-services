# ZSoftly Documentation

This repository contains the official documentation for ZSoftly services, deployed using GitHub Pages with MkDocs Material theme.

## About This Repository

This repository houses Markdown documentation for ZSoftly's service portfolio. The documentation is built and deployed to GitHub Pages using a CI/CD pipeline implemented with GitHub Actions.

## CI/CD Pipeline

The documentation site is built and deployed using a streamlined GitHub Actions workflow:

- **Trigger**: Manual-only via workflow dispatch (optimized from auto-triggers for controlled releases)
- **Build & Deploy**: Single job that builds the documentation using MkDocs with the Material theme and deploys to GitHub Pages
- **Features**: Dark/light theme switching, responsive design, search functionality
- **Notifications**: Google Chat webhook notifications for deployment status updates

The deployment process has been optimized to require manual triggering through GitHub's workflow dispatch feature, giving you complete control over when documentation is published to production. This deliberate approach ensures that documentation is only updated when explicitly approved, rather than automatically deploying with every push to the main branch. Once the deployment is complete, a notification is sent to the configured Google Chat space to inform the team.

### Google Chat Webhook Setup

To receive deployment notifications in Google Chat:

1. In Google Chat, create a space or use an existing one for deployment notifications
2. Click on the space name > "Apps & Integrations" > "Add webhooks"
3. Name your webhook (e.g., "ZSoftly Docs Deployment")
4. Copy the webhook URL provided
5. Encode the webhook URL in base64:
   ```bash
   # On macOS/Linux
   echo -n "YOUR_WEBHOOK_URL" | base64
   
   # On Windows (PowerShell)
   [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes("YOUR_WEBHOOK_URL"))
   ```
6. In your GitHub repository, go to Settings > Secrets and Variables > Actions
7. Add a new repository secret with name `GOOGLE_CHAT_WEBHOOK_URL` and paste the base64-encoded webhook URL as the value

Note: If you need to update the webhook URL in the future, remember to encode the new URL in base64 before updating the GitHub secret.

Once configured, the CI/CD pipeline will send notifications to the Google Chat space when deployment succeeds.

## Local Development Setup

### Prerequisites

- Python 3.9 or higher (recommended: Python 3.11)
- Git

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/zsoftly/zsoftly-services.git
   cd zsoftly-services
   ```

2. Set up a virtual environment (recommended):
   ```bash
   # Create a virtual environment
   python -m venv venv

   # Activate the virtual environment
   # On Windows:
   venv\Scripts\activate
   # On macOS/Linux:
   source venv/bin/activate
   ```

3. Install the required packages within the virtual environment:
   ```bash
   pip install --upgrade pip
   pip install mkdocs-material mkdocs-glightbox mkdocs-minify-plugin
   ```

4. Start the local development server:
   ```bash
   mkdocs serve
   ```

5. Open your browser and visit `http://127.0.0.1:8000/` to view the documentation site.

### Troubleshooting

If you encounter issues with the paths not showing:

```bash
# If mkdocs is installed in ~/.local/bin
export PATH="$HOME/.local/bin:$PATH"

# Or run with the full path
~/.local/bin/mkdocs serve
```

## Adding or Updating Content

1. Create or edit Markdown files in the `docs/` directory
2. Preview changes locally using `mkdocs serve`
3. Commit and push changes to the `main` branch
4. Manually trigger the GitHub Actions workflow to build and deploy the updated documentation
5. A notification will be sent to Google Chat when the deployment is complete

## Folder Structure

- `mkdocs.yml`: Configuration file for MkDocs
- `docs/`: Main documentation directory containing all Markdown files
  - `index.md`: Home page content
  - `security-services.md`, `devops-services.md`, etc.: Service-specific documentation
  - `assets/`: Contains images and brand resources
  - `stylesheets/`: Contains CSS customizations

## Technology Stack

- **MkDocs**: Documentation site generator
- **Material for MkDocs**: Theme for professional documentation
- **GitHub Actions**: CI/CD pipeline automation (optimized for manual control)
- **GitHub Pages**: Hosting platform
- **Google Chat Webhooks**: Deployment notifications

## Contact

For questions or issues related to this documentation repository, please contact:

- **Email**: info@zsoftly.com
- **GitHub**: [ZSoftly](https://github.com/zsoftly)

---

© 2025 ZSoftly. All rights reserved.