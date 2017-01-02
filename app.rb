frequire 'rspotify'

RSpotify.authenticate('cbac83687f5e47d2835398f2a48a7b75','acd24ca9934f43029d4be79c73a313a9')

me = RSpotify::User.find('caiquemitsuoka')


my_playlists = me.playlists
