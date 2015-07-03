# The Movie Database API

:facepunch: Battle-tested at [18Months](http://www.18months.it)

[![Build Status](https://travis-ci.org/18Months/themoviedb-api.svg?branch=master)](https://travis-ci.org/18Months/themoviedb-api)
[![Dependency Status](https://gemnasium.com/18Months/themoviedb-api.svg)](https://gemnasium.com/18Months/themoviedb-api)
[![Gem Version](https://badge.fury.io/rb/themoviedb-api.svg)](http://badge.fury.io/rb/themoviedb-api)
[![Coverage Status](https://coveralls.io/repos/18Months/themoviedb-api/badge.svg)](https://coveralls.io/r/18Months/themoviedb-api)
[![security](https://hakiri.io/github/18Months/themoviedb-api/master.svg)](https://hakiri.io/github/18Months/themoviedb-api/master)

A Ruby wrapper for the [The Movie Database API](http://docs.themoviedb.apiary.io/).

Provides a simple and intuitive interface for the Movie Database API making use of OpenStruct.

Get your API key [here](https://www.themoviedb.org/account).

## Getting started

### Install inside Rails app

Add this line to your application’s Gemfile:

```ruby
gem 'themoviedb-api'
```
### Install outside Rails app

```ruby
gem install themoviedb-api
```

## Initial Configuration

If you are using this gem in a Rails application you can set the following parameters in an initializer.

```ruby
Tmdb::Api.key("KEY_HERE")
```

You can change the language for the returned data with this:

```ruby
Tmdb::Api.language("en")
```

The default language is english.

You can temporarily override global language for one request by specifying the language as an additional parameter in the method called.  

```ruby
# Ex.
Tmdb::Movie.detail(550, language: 'it')
```
## Endpoints

All endpoints available are those listed in [The Movie Database API](http://docs.themoviedb.apiary.io/) documentation.

To be thorough they are listed here with a sample call: 
* [Configuration](#configuration)
* [Certifications](#certifications)
* [Changes](#changes)
* [Collections](#collections)
* [Companies](#companies)
* [Credits](#credits)
* [Discover](#discover)
* [Find](#find)
* [Genres](#genres)
* [Jobs](#jobs)
* [Keywords](#keywords)
* [Jobs](#jobs)
* [Movies](#movies)
* [Networks](#networks)
* [People](#people)
* [Reviews](#reviews)
* [Search](#search)
* [TV](#tv)
* [TV Seasons](#season)
* [TV Episodes](#episode)

Missing endpoints:
* Account
* Authentication
* Guest Sessions
* List
* Timezone

## Configuration

Get the system wide configuration information. Some elements of the API require some knowledge of this configuration data.
This method currently holds the data relevant to building image URLs as well as the change key map.
To build an image URL, you will need 3 pieces of data. The base_url, size and file_path. Simply combine them all and you will have a fully qualified URL.

```ruby
config = Tmdb::Configuration.get

# Response
Tmdb::Configuration {
         :images => Tmdb::Configuration {
               :base_url => "http://image.tmdb.org/t/p/",
        :secure_base_url => "https://image.tmdb.org/t/p/",
         :backdrop_sizes => [
            [0] "w300",
            [1] "w780",
            [2] "w1280",
            [3] "original"
        ],
             :logo_sizes => [
            [0] "w45",
            [1] "w92",
            [2] "w154",
            [3] "w185",
            [4] "w300",
            [5] "w500",
            [6] "original"
        ],
           :poster_sizes => [
            [0] "w92",
            [1] "w154",
            [2] "w185",
            [3] "w342",
            [4] "w500",
            [5] "w780",
            [6] "original"
        ],
          :profile_sizes => [
            [0] "w45",
            [1] "w185",
            [2] "h632",
            [3] "original"
        ],
            :still_sizes => [
            [0] "w92",
            [1] "w185",
            [2] "w300",
            [3] "original"
        ]
    },
    :change_keys => [
        [ 0] "adult",
        [ 1] "air_date",
        [ 2] "also_known_as",
        [ 3] "alternative_titles",
        [ 4] "biography",
        [ 5] "birthday",
        [ 6] "budget",
        [ 7] "cast",
        [ 8] "certifications",
        [ 9] "character_names",
        [10] "created_by",
        [11] "crew",
        [12] "deathday",
        [13] "episode",
        [14] "episode_number",
        [15] "episode_run_time",
        [16] "freebase_id",
        [17] "freebase_mid",
        [18] "general",
        [19] "genres",
        [20] "guest_stars",
        [21] "homepage",
        [22] "images",
        [23] "imdb_id",
        [24] "languages",
        [25] "name",
        [26] "network",
        [27] "origin_country",
        [28] "original_name",
        [29] "original_title",
        [30] "overview",
        [31] "parts",
        [32] "place_of_birth",
        [33] "plot_keywords",
        [34] "production_code",
        [35] "production_companies",
        [36] "production_countries",
        [37] "releases",
        [38] "revenue",
        [39] "runtime",
        [40] "season",
        [41] "season_number",
        [42] "season_regular",
        [43] "spoken_languages",
        [44] "status",
        [45] "tagline",
        [46] "title",
        [47] "translations",
        [48] "tvdb_id",
        [49] "tvrage_id",
        [50] "type",
        [51] "video",
        [52] "videos"
    ]
}

# Retrieve images base url example
base_url = config.images.base_url
```

## Certifications

### Movie List

Get the list of supported certifications for movies. These can be used in conjunction with the certification_country and certification.lte parameters when using discover.

```ruby
Tmdb::Certification.movie_list
```

### TV List

Get the list of supported certifications for tv shows.

```ruby
Tmdb::Certification.tv_list
```

## Changes

### Movie

Get a list of movie ids that have been edited. By default we show the last 24 hours and only 100 items per page. The maximum number of days that can be returned in a single request is 14. You can then use the movie changes API to get the actual data that has been changed.

```ruby
Tmdb::Change.movie
```

### Person

Get a list of people ids that have been edited. By default we show the last 24 hours and only 100 items per page. The maximum number of days that can be returned in a single request is 14. You can then use the person changes API to get the actual data that has been changed.

```ruby
Tmdb::Change.person
```

## License

The MIT License (MIT)

Copyright (c) 2015 18Months S.r.l.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
