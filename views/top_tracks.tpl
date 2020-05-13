% include('header.tpl')
 <style type = "text/css">
.items {
    margin-top: -10px;
    float: left;
  }
  .text {
      float: right;
      margin-top: 8%;
  }
      .individual {
    background: linear-gradient(45deg, #FFAFBD, #ffc3a0 );
    font-family: 'Abril Fatface', cursive;
    border: none;
    color: black;
    width:26%;
    height:60px;
    font-weight: 200%;
    padding: 20px 20px;
    text-align: center;
    margin-top: 8px;
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
        %for track, artist,album in zip(track_short, track_short_url, short_album_art):
            <div class="individual"> 
            <img class="items" src={{album}} height="80" width="80"> 
            <div class="text">
            {{track}} <br>
            {{artist}}
            </div>
            </div>
        %end
        </div>
        <div id="sixmonths" class="tabcontent hide">
        %for track, artist,album in zip(track_med, track_med_url, med_album_art):
            <div class="individual"> 
            <img class="items" src={{album}} height="80" width="80"> 
            <div class="text">
            {{track}} <br>
            {{artist}}
            </div>
            </div>
        %end
        </div>
        <div id="lifetime" class="tabcontent hide">
        %for track, artist,album in zip(track_long, track_long_url, long_album_art):
            <div class="individual"> 
            <img class="items" src={{album}} height="80" width="80"> 
            <div class="text">
            {{track}} <br>
            {{artist}}
            </div>
            </div>
        %end
    </div>
</div>



