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
  @media (prefers-color-scheme: dark) {
    .competition-item {
        background: #1e1e1e;
        border: 1px solid #333;
    }

    .competition-item a {
        color: #4db5ff; /* Adjust link color for visibility */
    }
    }
  .competition-item p strong {
    color: #007bff; /* Makes ranking visually pop */
  }
  @media (prefers-color-scheme: light) {
    .competition-item {
        background: #f8f9fa;
        border: 1px solid #000000;
    }
    }
---

<div class="competitions-container">
    {% for competition in site.data.competitions %}
    <div class="competition-item">
        <h2>{{ competition.name }}</h2>
        {% if competition.date %}
            <p><strong>Date:</strong> {{ competition.date }}</p>
        {% endif %}
        {% if competition.location %}
            <p><strong>Location:</strong> {{ competition.location }}</p>
        {% endif %}
        {% if competition.organizer %}
            <p><strong>Organizer:</strong> {{ competition.organizer }}</p>
        {% endif %}
        {% if competition.venue %}
            <p><strong>Venue:</strong> {{ competition.venue }}</p>
        {% endif %}
        {% if competition.team_members %}
            <p><strong>Team Members:</strong> {{ competition.team_members | join: ', ' }}</p>
        {% endif %}
        {% if competition.award %}
            <p><strong>Award:</strong> {{ competition.award }}</p>
        {% endif %}
        <p><strong>Ranking:</strong> {{ competition.ranking }}</p>
        <p>{{ competition.description }}</p>
        <a href="{{ competition.certificate }}" target="_blank">View Certificate</a>
    </div>
    {% endfor %}
</div>
