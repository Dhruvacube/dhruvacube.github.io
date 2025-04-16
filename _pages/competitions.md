---
layout: page
title: Competitions
permalink: /competitions/
description: This page list all the competitions I have been part of.
nav: false
nav_order: 15
_styles: >
  .competitions-container {
    display: flex;
    flex-direction: column;
    gap: 20px;
  }

  .competition-item {
    background: #f8f9fa;
    padding: 15px;
    border-radius: 8px;
  }
  .competition-item p strong {
    color: #007bff; /* Makes ranking visually pop */
  }

---

<div class="competitions-container">
    {% for competition in site.data.competitions %}
    <div class="competition-item">
        <h2>{{ competition.name }}</h2>
        <p><strong>Date:</strong> {{ competition.date }}</p>
        <p><strong>Ranking:</strong> {{ competition.ranking }}</p>
        <p>{{ competition.description }}</p>
        <a href="{{ competition.certificate }}" target="_blank">View Certificate</a>
    </div>
    {% endfor %}
</div>
