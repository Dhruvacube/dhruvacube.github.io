---
layout: page
title: Patents
description: This page showcases the patents I have developed, highlighting my contributions and work.
permalink: /patents/
nav: true
nav_order: 3
horizontal: false
---

<!-- pages/patents.md -->
<div class="projects">

{% assign sorted_projects = site.patents | sort: "importance" %}

  <!-- Generate cards for each project -->

{% if page.horizontal %}

  <div class="container">
    <div class="row row-cols-1 row-cols-md-2">
    {% for project in sorted_projects %}
      {% include projects_horizontal.liquid %}
    {% endfor %}
    </div>
  </div>
  {% else %}
  <div class="row row-cols-1 row-cols-md-3">
    {% for project in sorted_projects %}
      {% include projects.liquid %}
    {% endfor %}
  </div>
{% endif %}
</div>
