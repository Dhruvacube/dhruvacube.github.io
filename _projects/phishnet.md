---
title: "Announcing PhishNet: A Proactive AI Solution for Phishing Detection"
date: 2025-09-06 12:52:39 +0530
tags: [project, cybersecurity, AI, machine learning]
excerpt: "We're excited to announce PhishNet, a comprehensive AI-based solution developed by Creative Net to combat sophisticated phishing attacks."
---

We are thrilled to announce the official launch of PhishNet, a cutting-edge AI solution for the detection of phishing and suspected domains. Developed as a solution for the NTRO hackathon, PhishNet represents our team's commitment to creating impactful, real-world solutions for a critical cybersecurity challenge.

PhishNet is designed to address the growing threat of sophisticated phishing attacks that target Critical Sector Entities (CSEs). Our system moves beyond traditional passive detection methods by actively identifying potential threats before they can cause harm.

### Key Features and Technology

Our solution is built on a robust, scalable architecture and a unique dual-model AI approach:

- **Proactive Threat Identification**: We use a powerful fuzzy permutation method with the `dnstwist` package to generate and check for malicious domains in near real-time.
- **Dual-Model AI Engine**: Our core is a pipeline of two **Random Forest Classifiers**. One model analyzes structural features of a URL, while the second, more accurate model, also incorporates the raw URL string itself to learn intricate patterns.
- **Scalable Backend**: PhishNet is built using **Django** and **PostgreSQL** for a secure, scalable foundation. We handle all asynchronous tasks and user-submitted requests using **Celery** to ensure efficiency.
- **Automated Reporting**: The system processes submitted URLs and automatically generates and emails detailed reports to the user.

### Looking Ahead

This is just the beginning for PhishNet. We have a clear roadmap for future improvements, including:

- Integrating the `subfinder` module for advanced subdomain discovery.
- Performing historical data analysis using `cdx_toolkit`.
- Incorporating **LSTM networks** to further enhance our AI model's accuracy.

We're excited to continue developing PhishNet and contribute to a safer digital landscape. For more information, please explore our project repository.
[PhishNet Project Repository](https://thecreativenet.in/projects/phishnet/)
