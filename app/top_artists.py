import sys
import json
import spotipy
import spotipy.util as util
from json.decoder import JSONDecodeError
from spotipy import oauth2
from spotipy.oauth2 import SpotifyClientCredentials


username = sys.argv[1]
scope = 'user-top-read, user-read-private'
token = util.prompt_for_user_token(username, scope)
username = sys.argv[1]
token = util.prompt_for_user_token(username, scope)
try:
    token = util.prompt_for_user_token(username, scope)
except (AttributeError, JSONDecodeError):
    os.remove(f".cache-{username}")
    token = util.prompt_for_user_token(username, scope) 
spotifyObject = spotipy.Spotify(auth=token)
user = spotifyObject.current_user()

# @app.route('/')

displayName = user['display_name']

if len(sys.argv) > 1:
    username = sys.argv[1]
else:
    print("Usage: %s username" % (sys.argv[0],))
    sys.exit()
if token:
    sp = spotipy.Spotify(auth=token)
    sp.trace = False
    ranges = ['short_term', 'medium_term', 'long_term']
    for range in ranges:
        print("range:", range)
        results = sp.current_user_top_artists(time_range='long_term', limit=20)
        for i, item in enumerate(results['items']):
            print(i, item['name'])
            print()
        print("range:", range)
        results2 = sp.current_user_top_tracks(time_range=range, limit=50)
        for i, item in enumerate(results2['items']):
            print(i,item['name'], '//', item['artists'][0]['name'])
            print()
else:
    print("Can't get token for", username)

#1262801801