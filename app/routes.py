import sys
import json
import spotipy
import spotipy.util as util
from app import app
from json.decoder import JSONDecodeError
from spotipy import oauth2
from spotipy.oauth2 import SpotifyClientCredentials
from flask import render_template
from urllib.parse import quote


username = sys.argv[1]
scope = 'user-top-read, user-read-private'
token = util.prompt_for_user_token(username, scope)
username = sys.argv[1]
token = util.prompt_for_user_token(username, scope)
try:
    token = util.prompt_for_user_token(username, scope) # add scope
except (AttributeError, JSONDecodeError):
    os.remove(f".cache-{username}")
    token = util.prompt_for_user_token(username, scope) # add scope

spotifyObject = spotipy.Spotify(auth=token)
user = spotifyObject.current_user()
displayName = user['display_name']

@app.route('/')
def login():

    return render_template('home.html', user=displayName)

@app.route('/top_tracks')
def top_tracks():
    if len(sys.argv) > 1:
        username = sys.argv[1]
        print("Hello," + username)
    else:
        print("Usage: %s username" % (sys.argv[0],))
        sys.exit()
    if token:
        sp = spotipy.Spotify(auth=token)
        sp.trace = False
        ranges = ['short_term', 'medium_term', 'long_term']
        tracks = []
        images = []
        for range in ranges:
            print("range:", range)
            results2 = sp.current_user_top_tracks(time_range=range, limit=20)
            for i, item in enumerate(results2['items']):
                tracks.insert(i, item['name'] + ' // ' + item['artists'][0]['name'])
                images.insert(i,item['artists']['images']['url'])
            print(tracks)
                
                
    else:
        print("Can't get token for", username)
    return render_template('top_tracks.html', track_results=tracks, image=images)

@app.route('/top_artists')
def top_artists():
    if len(sys.argv) > 1:
        username = sys.argv[1]
        print("Hello," + username)
    else:
        print("Usage: %s username" % (sys.argv[0],))
        sys.exit()
    if token:
        sp = spotipy.Spotify(auth=token)
        sp.trace = False
        ranges = ['short_term', 'medium_term', 'long_term']
        artists = []
        artist_art = []
        for range in ranges:
            print("range:", range)
            results = sp.current_user_top_artists(time_range=range, limit=20)
            for i, item in enumerate(results['items']):
                artists.insert(i, item['name'])
                artist_art.insert(i, item['images'][0]['url'][0])
                print(artists + artist_art)
                
                
    else:
        print("Can't get token for", username)
    return render_template('top_artists.html', range=range, user=displayName, art=artist_art, artists_results=artists)