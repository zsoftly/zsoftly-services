# ZSoftly Services Website

This repository contains the ZSoftly website built with Jekyll.

## Overview

The ZSoftly website showcases our enterprise-grade IT solutions for mid-market businesses, focusing on security services, DevOps services, cloud migration, and digital transformation.

## Technology Stack

- **Framework**: Jekyll
- **Theme**: Modified Minima theme
- **Styling**: Custom SCSS
- **JavaScript**: Vanilla JS for theme switching and interactivity
- **Icons**: Font Awesome

## Local Development

### Prerequisites

- Ruby version 2.7.0 or higher
- Bundler
- Jekyll

### Installation

1. Clone this repository
   ```bash
   git clone https://github.com/zsoftly/zsoftly-services.git
   cd zsoftly-services
   ```

2. Install dependencies
   ```bash
   bundle install
   ```

3. Run the development server
   ```bash
   bundle exec jekyll serve
   ```

4. View the site at http://localhost:4000/zsoftly-services/

## Site Structure

- `_config.yml` - Jekyll configuration
- `_layouts/` - Custom layout templates
- `_includes/` - Reusable components
- `_services/` - Service page collection
- `assets/` - Static files (CSS, JS, images)
- Various markdown files for content pages

## Deployment

The site is deployed to GitHub Pages. Any push to the main branch will trigger a build and deployment.

## Content Updates

### Adding a New Service

1. Create a new markdown file in the `_services` directory
2. Add proper front matter:
   ```yaml
   ---
   layout: service
   title: Service Name
   permalink: /services/service-name/
   excerpt: Brief description of the service
   ---
   ```
3. Add your content in markdown format

### Updating Existing Content

Edit the relevant markdown file in the repository.

## License

Copyright © 2025 ZSoftly Technologies Inc. All rights reserved.