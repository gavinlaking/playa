module Playa
end

require 'bundler/setup'
require 'audite'
require 'mp3info'
require 'vedeu'

require 'playa/log'
require 'playa/models/track'
require 'playa/models/track_collection'
require 'playa/models/player'
require 'playa/helpers/helpers'
require 'playa/views/help_view'
require 'playa/views/playlist_view'
require 'playa/views/progress_view'
require 'playa/views/status_view'
require 'playa/views/startup_view'
require 'playa/controllers/controller'
require 'playa/application'
