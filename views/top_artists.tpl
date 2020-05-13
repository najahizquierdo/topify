% include('header.tpl')

<style type = "text/css">
  .items {
      float: left;
  }
  .text {
      float: right;
      margin-top: 10%;
  }
      .individual {
    background: linear-gradient(45deg, #FFAFBD, #ffc3a0 );
    font-family: 'Abril Fatface', cursive;
    border: none;
    color: black;
    width:20%;
    height:60px;
    font-weight: 200%;
    padding: 20px 20px;
    text-align: center;
    margin-top: 10px;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    border-radius: 5px;
    margin: 8px 4px;
    cursor: pointer;
  }
  }
</style>

<div class="tab">
  <button class="tablinks" onclick="openTime(event, 'fourweeks')">4 WEEKS</button>
  <button class="tablinks" onclick="openTime(event, 'sixmonths')">6 MONTHS</button>
  <button class="tablinks" onclick="openTime(event, 'lifetime')">LIFETIME</button>
</div>

<div class="column">
<div class="tabbed">
<div id="fourweeks" class="tabcontent">

%for artist, url in zip(artist_short, artist_short_url):
    <div class="individual"> 
    <img class="items" src='{{url}}' height="50" width="50">
    <div class="text">{{artist}} </div> 
    </div>
%end
</div>

<div id="sixmonths" class="tabcontent hide">
%for artist, url in zip(artist_med, artist_med_url):
    <div class="individual">
    <img class="items" src='{{url}}' height="50" width="50"><br> 
    <div style="float: right;">{{artist}} </div>
    </div>
%end
</div>

<div id="lifetime" class="tabcontent hide">
%for artist, url in zip(artist_long, artist_long_url):
    <div class="individual"> 
    <img class="items" src='{{url}}' height="50" width="50">
    <div class="text">{{artist}} </div>
    </div>
%end
</div>
</div>
</div>