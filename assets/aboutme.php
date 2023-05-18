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
      display: flex;
      align-items: center;
      max-width: 800px;
      background-color: #f9f9f9;
      border-radius: 6px;
      padding: 20px;
    }

    .about-us-intro {
      flex: 1;
      padding: 20px;
    }

    .about-us-image {
      flex: 1;
      text-align: center;
    }

    .about-us-image img {
      width: 300px;
      height: auto;
      border-radius: 6px;
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
    }

    /* Add snowflake styles */
    .snowflake {
      position: absolute;
      width: 10px;
      height: 10px;
      background-color: #fff;
      border-radius: 50%;
      border: 2px solid #000;
      pointer-events: none;
      animation: snowfall linear infinite;
    }
    .video-container {
      display: flex;
      justify-content: center;
      margin-bottom: 20px;
    }

    h3 {
      text-align: center;
    }
  </style>
</head>
<body>
  <audio src="path/to/your/music.mp3" autoplay loop></audio>
  <div id="snow-container"></div>
  <main>
    <section class="about-us-container">
      <div class="about-us-intro">
        <h2>Introduction</h2>
        <p>
          Hi!
        </p>
        <p>
          So you managed to find this page! Hope you have a great day!
        </p>
        <div class="btn-container">
          <a href="/phpmvc/assets/cv.pdf" download class="btn">
            Download my CV
          </a>
          <a href="/phpmvc/" class="btn">
            Back to index
          </a>
        </div>
      </div>
      <div class="about-us-image">
        <img src="https://firebasestorage.googleapis.com/v0/b/project-motel.appspot.com/o/1684378867662.jpg?alt=media&token=5b45c1ba-1dd9-40bc-a836-4676c834bba2" alt="Company Image">
        <br>Long báo
      </div>
    </section>
    <h3>Just random song to keep you entertained</h3><br>
    <div class="video-container">
      <iframe width="560" height="315" src="https://www.youtube.com/embed/Kkgp1-fHn6Y" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
    </div>
  </main>
</body>
</html>
