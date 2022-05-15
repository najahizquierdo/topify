import spotipy
import sys
import logging
import pandas as pd
import spotipy.util as util
import random
from bottle import route, run, template, static_file
from spotipy import oauth2
import json
import time

username = 'sanvu20' ### if you are running this program, please find your URI on the spotify desktop app and paste it in here.

scope = 'user-top-read, user-read-private, playlist-modify-public'
token = util.prompt_for_user_token(username, scope,
                           client_id='cf8a89c08632413c9f957895820a8db5',
                           client_secret='d34f5f0b7fc842c19d49831402b0ab83',
                           redirect_uri='http://www.google.com')


token = util.prompt_for_user_token(username, scope)
try:
    token = util.prompt_for_user_token(username, scope) # add scope
except (AttributeError, JSONDecodeError):
    os.remove(f".cache-{username}")
    token = util.prompt_for_user_token(username, scope) # add scope


spotifyObject = spotipy.Spotify(auth=token)
user = spotifyObject.current_user()
sp = spotipy.Spotify(auth=token)
displayName = user['display_name']
followers = user['followers']['total']
icon = user['images'][0]['url']
mem_type = user['product']
ranges = ['short_term', 'long_term', 'medium_term']


if token:
    currentuser = spotipy.Spotify(auth=token)
    currentuser.trace = False
    playlist = []
    results = currentuser.current_user_playlists(limit=35)
    for item in results['items']:
        playlist.append(item['images'][0]['url'])
    else:
        print("Retry")


@route('/')
def hello():
    return template('views/homepage.tpl',
    playlist=playlist, 
    mem_type=mem_type, 
    followers=followers, 
    displayName=displayName, 
    icon=icon)

@route('/top_tracks')
def top_tracks():
    track_data = []
    long_album_art = []
    med_album_art = []
    short_album_art = []
    track_long = []
    track_long_url = []
    track_med = []
    track_med_url = []
    track_short = []
    track_short_url = []
    for range in ranges:
        print("range:", range)
        results = sp.current_user_top_tracks(time_range=range, limit=12)
        for i, item in enumerate(results['items']):
            if range == 'long_term':
                track_long.append(item['name'])
                track_long_url.append(item['artists'][0]['name'])
                long_album_art.append(item['album']['images'][0]['url'])
            if range == 'medium_term':
                track_med.append(item['name'])
                track_med_url.append(item['artists'][0]['name'])
                med_album_art.append(item['album']['images'][0]['url'])
            elif range == 'short_term':
                track_short.append(item['name'])
                track_short_url.append(item['artists'][0]['name'])
                short_album_art.append(item['album']['images'][0]['url'])
    return template('views/top_tracks.tpl',
    track_long=track_long,
    track_long_url=track_long_url,
    track_med=track_med,
    track_med_url=track_med_url,
    track_short=track_short, 
    track_short_url=track_short_url,
    long_album_art=long_album_art,
    med_album_art=med_album_art, 
    short_album_art=short_album_art, 
    displayName=displayName,
    icon=icon,
    playlist=playlist,
    followers=followers, 
    mem_type=mem_type,
    )
@route('/top_artists')
def top_artists():    
    artist_long = []
    artist_long_url = []
    artist_med = []
    artist_med_url = []
    artist_short = []
    artist_short_url = []
    for range in ranges:
        print("range:", range)
        results = sp.current_user_top_artists(time_range=range, limit=16)
        for i, item in enumerate(results['items']):
            if range == 'long_term':
                artist_long.append(item['name'])
                artist_long_url.append(item['images'][0]['url'])
                
            if range == 'medium_term':
                artist_med.append(item['name'])
                artist_med_url.append(item['images'][0]['url'])
                
            elif range == 'short_term':
                artist_short.append(item['name'])
                artist_short_url.append(item['images'][0]['url'])
                
    return template('views/top_artists.tpl',
    artist_long=artist_long,
    artist_long_url=artist_long_url,
    artist_med=artist_med,
    artist_med_url=artist_med_url,
    artist_short=artist_short, 
    artist_short_url=artist_short_url,
    displayName=displayName,
    icon=icon,
    playlist=playlist,
    followers=followers, 
    mem_type=mem_type,
    )

#spotify:user:1262801801
run(host='localhost', port=8080)