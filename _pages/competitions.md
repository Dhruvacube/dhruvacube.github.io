---
layout: page
title: Competitions
permalink: /competitions/
description: This page list all the competitions I have been part of.
nav: true
nav_order: 4
_styles: >
  .competitions-container {
    display: flex;
    flex-direction: column;
    gap: 20px;
  }

  .competition-item {
    padding: 15px;
    border-radius: 8px;
  }

  .competition-item p strong {
    color: #007bff; /* Makes ranking visually pop */
  }
---

<div class="competitions-container">
    {% for competition in site.data.competitions %}
    <div class="competition-item"  data-bs-theme="light" style="border: 1px solid #333;">
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
        {% if competition.ranking %}
            <p><strong>Ranking:</strong> {{ competition.ranking }}</p>
        {% endif %}
        {% if competition.description %}
            <p>{{ competition.description }}</p>
        {% endif %}
        {% if competition.certificate %}
            <a href="assets/certificates/{{ competition.certificate }}" target="_blank">View Certificate</a>
        {% elsif competition.drive_link %}
            <a href="{{ competition.drive_link }}" target="_blank">View Certificate</a>
        {% endif %}
    </div>
    <hr/>
    {% endfor %}
</div>
