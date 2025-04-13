---
layout: page
title: Services
permalink: /services/
---

# Our Services

At ZSoftly, we provide a comprehensive suite of IT services designed specifically for mid-market businesses. Our expertise spans security, DevOps, cloud migration, and digital transformation.

## Service Portfolio

<div class="grid cards">
  <ul>
    {% for service in site.services %}
    <li>
      <div class="card-content">
        <h3>{{ service.title }}</h3>
        <p>{{ service.excerpt | strip_html | truncatewords: 25 }}</p>
        <a href="{{ service.url | relative_url }}" class="button">Learn More</a>
      </div>
    </li>
    {% endfor %}
  </ul>
</div>

## Tailored Solutions for Your Business

Every business has unique challenges and requirements. We work closely with you to understand your specific needs and goals before recommending solutions. Our approach ensures that you receive services that align perfectly with your business objectives and budget constraints.

## Ready to Get Started?

Contact us today to discuss how our services can help your business thrive in the digital landscape.

<a href="{{ '/contact/' | relative_url }}" class="button button-primary">
  <i class="fas fa-envelope"></i> Contact Us
</a>