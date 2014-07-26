[![Code Climate](https://codeclimate.com/github/gavinlaking/playa.png)](https://codeclimate.com/github/gavinlaking/playa)
[![Build Status](https://travis-ci.org/gavinlaking/playa.svg?branch=master)](https://travis-ci.org/gavinlaking/playa)

# Playa

Plays mp3s from a directory using Ruby. An example app using Vedeu.


## Requirements

- Portaudio >= 19
- Mpg123 >= 1.14


### OSX Installation

    brew install portaudio
    brew install mpg123
    gem install playa

### Debian / Ubuntu Install

    apt-get install libjack0 libjack-dev
    apt-get install libportaudiocpp0 portaudio19-dev libmpg123-dev
    gem install playa


## Usage

Play all .mp3 files in the current working directory:

    playa

or, specify a directory to play from:

    playa /path/to/mp3s


## Contributing

1. Fork it ( https://github.com/gavinlaking/playa/fork )
2. Clone it
3. `bundle`
4. `rake` or `bundle exec guard`
5. Create your feature branch (`git checkout -b my-new-feature`)
6. Write some tests, write some code, have some fun
7. Commit your changes (`git commit -am 'Add some feature'`)
8. Push to the branch (`git push origin my-new-feature`)
9. Create a new Pull Request
