<!DOCTYPE html>
<html>
<head>
  <title>About Us</title>
  <style>
    /* Add your CSS styles here */
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .about-us-container {
      display: grid;
      grid-template-columns: 1fr 1fr;
      grid-gap: 20px;
      max-width: 800px;
      background-color: #f9f9f9;
      border-radius: 6px;
      padding: 20px;
    }

    .about-us-intro {
      grid-column: 1 / 2;
      text-align: left;
    }

    .about-us-intro p {
      text-align: justify;
      color: brown;
    }

    .about-us-image {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      grid-gap: 20px;
      grid-column: 2 / 3;
    }

    .about-us-image img {
      width: 100%;
      height: auto;
      border-radius: 6px;
    }

    .about-us-image p {
      text-align: center;
      margin-top: 10px;
      font-weight: bold;
    }

    .btn-container {
      text-align: center;
      margin-top: 20px;
    }

    .btn {
      display: inline-block;
      padding: 10px 20px;
      background-color: #337ab7;
      color: #fff;
      text-decoration: none;
      border-radius: 6px;
      margin-right: 10px;
    }

    .video-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      margin-top: 20px;
    }

    #randomVideo {
      width: 560px;
      height: 315px;
    }

    h3 {
      text-align: center;
    }
  </style>
</head>
<body>
  <main>
    <section class="about-us-container">
      <div class="about-us-intro">
        <h2>Introduction</h2>
        <p>
          Hello there!
        </p>
        <p>
          I'm delighted to have discovered this page, and your warm greetings have made my day even better!
          Thank you for your kind words.
          I hope you're having an absolutely fantastic day as well!
        </p>
        <p>
          On the right is me and an incredible group of friends who have played an instrumental role in helping me significantly improve this project.
          They have gone above and beyond, demonstrating exceptional dedication, knowledge, and support throughout our journey together.
        </p>
        <p>
          Without their unwavering support and dedication, I might have been tempted to give up right from the start.
          Their contributions have been nothing short of invaluable, 
          and I am sincerely grateful for their unwavering commitment to both the project and our friendship.
        </p>
      </div>
      <div class="about-us-image">
        <div>
          <img src="./images/long.jpg">
          <p>Long báo</p>
        </div>
        <div>
          <img src="./images/binh.png">
          <p>Bệu Bệu (Bình)</p>
        </div>
        <div>
          <img src="./images/phong.jpg">
          <p>Firegod Phoenix (Phong)</p>
        </div>
      </div>
    </section>
    <div class="btn-container">
      <a href="/phpmvc/assets/cv.pdf" download class="btn">
        Download my CV
      </a>
      <a href="/phpmvc/" class="btn">
        Back to index
      </a>
    </div>
    <!-- <h3>Just random song to keep you entertained</h3> -->
    <div class="video-container">
      <iframe id="randomVideo" src="" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
    </div>
    <script>
      window.addEventListener('DOMContentLoaded', function() {
        var videoLinks = [
          'https://www.youtube.com/embed/Kkgp1-fHn6Y',
          'https://www.youtube.com/embed/omS6RswPv7I',
          'https://www.youtube.com/embed/OWOy5UKlIns',
          'https://www.youtube.com/embed/YjPMJf2Uhu0',
          'https://www.youtube.com/embed/NKdOUJOuv1k'
        ];

        var randomIndex = Math.floor(Math.random() * videoLinks.length);
        var randomVideoLink = videoLinks[randomIndex];
        var randomVideoFrame = document.getElementById('randomVideo');
        randomVideoFrame.src = randomVideoLink;
      });
    </script>
  </main>
</body>
</html>
