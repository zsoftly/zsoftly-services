# ZSoftly Documentation

This repository contains the official documentation for ZSoftly services, deployed using GitHub Pages with MkDocs Material theme.

## About This Repository

This repository houses Markdown documentation for ZSoftly's service portfolio. The documentation is automatically built and deployed to GitHub Pages using a CI/CD pipeline implemented with GitHub Actions.

## CI/CD Pipeline

The documentation site is built and deployed using a multi-stage GitHub Actions workflow:

- **Trigger**: Automatically on push to the `main` branch or manually via workflow dispatch
- **Build**: First job that builds the documentation using MkDocs with the Material theme
- **Prepare**: Second job that prepares the deployment and creates a staging environment
- **Deploy**: Final job with manual approval requirement for deploying to GitHub Pages
- **Features**: Dark/light theme switching, responsive design, search functionality

The deployment process requires manual approval through GitHub's environment protection feature, giving you control over when documentation is published to production.

## Local Development Setup

### Prerequisites

- Python 3.x
- Git

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/zsoftly/zsoftly-services.git
   cd zsoftly-services
   ```

2. Install the required packages:
   ```bash
   pip install mkdocs-material
   ```

3. Start the local development server:
   ```bash
   mkdocs serve
   ```

4. Open your browser and visit `http://127.0.0.1:8000/` to view the documentation site.

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
4. GitHub Actions will automatically build and deploy the updated site

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
- **GitHub Actions**: CI/CD pipeline automation
- **GitHub Pages**: Hosting platform

## Contact

For questions or issues related to this documentation repository, please contact:

- **Email**: info@zsoftly.com
- **GitHub**: [ZSoftly](https://github.com/zsoftly)

---

© 2025 ZSoftly. All rights reserved.