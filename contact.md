---
layout: page
title: Contact Us
permalink: /contact/
---

# Contact Us

We're here to help you transform your IT capabilities. Reach out to discuss how our services can benefit your business.

## Get in Touch

<form action="{{ site.baseurl }}/thank-you/" method="get" class="contact-form">
  <div class="form-group">
    <label for="name">Name</label>
    <input type="text" id="name" name="name" class="form-control" required>
  </div>
  
  <div class="form-group">
    <label for="email">Email</label>
    <input type="email" id="email" name="email" class="form-control" required>
  </div>
  
  <div class="form-group">
    <label for="company">Company</label>
    <input type="text" id="company" name="company" class="form-control" required>
  </div>
  
  <div class="form-group">
    <label for="phone">Phone Number</label>
    <input type="tel" id="phone" name="phone" class="form-control">
  </div>
  
  <div class="form-group">
    <label for="message">Message</label>
    <textarea id="message" name="message" rows="5" class="form-control" required></textarea>
  </div>
  
  <div class="form-group">
    <label>Services of Interest</label>
    <div class="checkbox-group">
      <label>
        <input type="checkbox" name="services[]" value="security"> Security Services
      </label>
      <label>
        <input type="checkbox" name="services[]" value="devops"> DevOps Services
      </label>
      <label>
        <input type="checkbox" name="services[]" value="cloud"> Cloud Migration
      </label>
      <label>
        <input type="checkbox" name="services[]" value="digital"> Digital Transformation
      </label>
    </div>
  </div>
  
  <button type="submit" class="button button-primary">Submit</button>
</form>

## Contact Information

- **Email**: {{ site.company.email }}
- **Phone**: {{ site.company.phone }}
- **Address**: {{ site.company.address }}

## Connect With Us

- [LinkedIn](https://www.linkedin.com/company/zsoftly-technologies)
- [GitHub](https://github.com/zsoftly)