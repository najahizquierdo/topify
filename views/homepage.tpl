%import random
<head>
    <meta charset="UTF-8">
	<link rel="stylesheet" href="/static/spotipy.css">
</head>
<body>
 <style type = "text/css">
    
  @font-face {
  font-family: 'Abril Fatface';
  font-style: normal;
  font-weight: 400;
  font-display: swap;
  src: local('Abril Fatface'), local('AbrilFatface-Regular'), url(https://fonts.gstatic.com/s/abrilfatface/v11/zOL64pLDlL1D99S8g8PtiKchq-dmjQ.woff2) format('woff2');
  unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
  }
  @font-face {
  font-family: 'Montserrat';
  font-style: normal;
  font-weight: 200;
  font-display: swap;
  src: local('Montserrat Regular'), local('Montserrat-Regular'), url(https://fonts.gstatic.com/s/montserrat/v14/JTUSjIg1_i6t8kCHKm459WRhyzbi.woff2) format('woff2');
  unicode-range: U+0460-052F, U+1C80-1C88, U+20B4, U+2DE0-2DFF, U+A640-A69F, U+FE2E-FE2F;
  }
  h1 {
  font-family: 'Abril Fatface', cursive;
  font-size: 300%;
  }
  h2 {
  font-family: 'Abril Fatface', cursive;
  font-size: 200%;
  }
  h3 {
    font-family: 'Montserrat', sans-serif;
  }
  .overlay {
    position: absolute;
    top: 0;
    text-align=center;
    left: 0;
    opacity:70%;
    -webkit-filter: grayscale(1);
    width: 100%;
    height: 100%;
    z-index: 10;
    background-color: rgba(0,0,0,0.5); /*dim the background*/
  }
  .top {
    width: 550px;
    height: 550px;
    position: fixed;
    top: 20%; 
    left: 20%;
    margin-top: -30px;
    margin-left: 150px;
    background: linear-gradient(45deg, #FFAFBD, #ffc3a0 );
    border-radius: 8px;
    color:white;
    text-align: center;
    z-index: 11; /* 1px higher than the overlay layer */
    }

    .button {
    background-color: #C5C5C5;
    font-family: 'Abril Fatface', cursive;
    border: none;
    color: white;
    font-weight: 200%;
    padding: 20px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    border-radius: 5px;
    margin: 8px 4px;
    cursor: pointer;
    }
    .info {
      font-family: 'Abril Fatface', cursive;
      color:black;
    }
  }
 </style>
    <div class="overlay">
  <center>
 %for image in playlist:
    <img src='{{image}}' width='200'>
%end
</center>
</div>
<div class="top"> 

<h1><center> Hey, {{displayName}}!</h1>
<center class="info"> {{followers}} Followers </center>
   <p><img src={{icon}} height="250"></p>
<p>
<a class="button" href="/top_tracks">TOP TRACKS</a>
<a class="button" href="/top_artists">TOP ARTISTS</a>
</p>
</div>
</body>