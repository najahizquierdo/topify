<html>
<script>
function openTime(evt, timeName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(timeName).style.display = "block";
  evt.currentTarget.className += " active";
}
</script>
 <style type = "text/css">
    .nav {
        width: 101%;
        height: 75px;
        background: linear-gradient(45deg, #FFAFBD, #ffc3a0);
        top: 0;
        margin-left: -1%;
        position:fixed;
        z-index: 11;
    }
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
    .image {
    margin-right: 10px;

    float: right;
    }
    .information {
    font-family: 'Abril Fatface', cursive;
    float: right;
    font-size: 15px;
    margin-right: 1%;
    margin-top: -7px;
    text-align:right;
    }
    h2 {
    font-family: 'Abril Fatface', cursive;
    font-size: 200%;
    }
    h1 {
    font-family: 'Abril Fatface', cursive;
    font-size: 300%;
    }
    .tab {
    position: fixed;
    margin-left: 9%;
    align:center;  
    z-index: 11;
    width: 80%;
    margin-top:8%;
    overflow: hidden;
    align:center;
    position: fixed;
    background-color: white;
    }

    .tab button {
    background-color: #C5C5C5;
    font-family: 'Abril Fatface', cursive;
    border: none;
    color: white;
    width:33.3%;
    height:60px;
    font-weight: 200%;
    padding: 20px 20px;
    text-align: center;
    border-radius: 5px;
    float: left;
    border: none;
    outline: none;
    transition: 0.3s;
    font-size: 17px;
    }
    .tabbed {
    margin-top: 5%;
    }

    .tab button:hover {
    background-color: #ddd;
    }

    .tab button.active {
    background: linear-gradient(45deg, #FFAFBD, #ffc3a0);
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
    .column { 
      position: fixed;
      margin-left: 9%;
      align:center;  
      z-index: 11;
      width: 80%;
      overflow:hidden;
      background: white;
      text-align:center;
      margin-top: 12%;
      height: 600px;
  }
  .hide {
    display: none;
}
  .button {
    float:left;
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


  }
 </style>
    <header class="nav">
    <a class="button" href="/">HOME</a>
    <img class="image" src='{{icon}}' height="75" width="75">
    <br> <div class="information"> 
    {{displayName}} 
    <br> Followers : {{followers}}
    <br> Membership Type: {{mem_type}} 
    </div>
    </header>

<div class="overlay">
  <center>
  %for image in playlist:
      <img src='{{image}}' width='200'>
  %end
  </center>
</div>

</html>