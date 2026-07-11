---
layout: page
title: Osteoarthritis ML Model
description: The "Osteoarthritis ML Model" aims to develop an AI/ML-based system for early detection of osteoarthritis using Indian-specific medical data and images. Guided by Dr. Bhaveshkumar C Dharmani and supported by an MOU between LPU, Jalandhar, and AIIMS, Bhatinda, this model will integrate with X-ray machines for enhanced diagnosis.
img: /assets/img/publication_preview/osteoarthirites.jpg
importance: 3
category: work
giscus_comments: true
_styles: >
  .containerpdf {
      position: relative;
      overflow: hidden;
      width: 100%;
      padding-top: 56.25%; /* 16:9 Aspect Ratio (divide 9 by 16 = 0.5625) */
  }

  /* Then style the iframe to fit in the container div with full height and width */
  .responsive-object-pdf {
      position: absolute;
      top: 0;
      left: 0;
      bottom: 0;
      right: 0;
      width: 100%;
      height: 100%;
  }
---

The "Osteoarthritis ML Model" is a groundbreaking project focused on creating a machine learning-based solution for the early detection of osteoarthritis, a degenerative joint disease that can lead to significant mobility issues. This project is being developed under the expert guidance of Dr. Bhaveshkumar C Dharmani, with collaboration facilitated by an MOU between LPU, Jalandhar, and AIIMS, Bhatinda, ensuring access to valuable medical resources and expertise.

The AI/ML model uses Indian-specific medical databases and images, recognizing the unique physiological differences of the Indian population. By training the model on this tailored data, the system aims to provide more accurate diagnoses for osteoarthritis in Indian patients.

Upon completion, the model will be deployed using Jetson Nano and integrated with X-ray machine hardware, allowing for seamless use in clinical settings. The primary goal of this project is to enable the early detection of osteoarthritis, ensuring that preventive measures and treatments are implemented at the right time to improve patient outcomes and quality of life.

- [Dataset used to train this model](https://www.kaggle.com/datasets/dhruvacube/osteoarthritis)
- [Trained Models](https://www.kaggle.com/models/dhruvacube/oa-xraynet)

<div class="containerpdf">
    <iframe src='{{ site.url }}/assets/pdf/osteoarthirities.pdf' class="responsive-object-pdf" type='application/pdf'></iframe>
</div>
