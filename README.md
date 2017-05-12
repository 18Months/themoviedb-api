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

#### Install inside Rails app

Add this line to your application’s Gemfile:

```ruby
gem 'themoviedb-api'
```
#### Install outside Rails app

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
# Example
Tmdb::Movie.detail(550, language: 'it')
```

Every method can be called with additional parameters if needed, for further information see [The Movie Database API](http://docs.themoviedb.apiary.io/).

```ruby
# Example
Tmdb::Search.movie('terminator', page: 2, language: 'it')
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
* [Movies](#movies)
* [Networks](#networks)
* [People](#people)
* [Recommendations](#recommendations)
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

#### Movie List

Get the list of supported certifications for movies. These can be used in conjunction with the certification_country and certification.lte parameters when using discover.
```ruby
Tmdb::Certification.movie_list
```

#### TV List

Get the list of supported certifications for tv shows.
```ruby
Tmdb::Certification.tv_list
```

## Changes

#### Movie

Get a list of movie ids that have been edited. By default we show the last 24 hours and only 100 items per page. The maximum number of days that can be returned in a single request is 14. You can then use the movie changes API to get the actual data that has been changed.
```ruby
Tmdb::Change.movie
```

#### Person

Get a list of people ids that have been edited. By default we show the last 24 hours and only 100 items per page. The maximum number of days that can be returned in a single request is 14. You can then use the person changes API to get the actual data that has been changed.
```ruby
Tmdb::Change.person
```

## Collection

#### Detail

Get the basic collection information for a specific collection id. You can get the ID needed for this method by making a /movie/{id} request and paying attention to the belongs_to_collection hash.Movie parts are not sorted in any particular order. If you would like to sort them yourself you can use the provided release_date.
```ruby
Tmdb::Collection.detail(10)
```

#### Backdrops

Get all of the backdrops for a particular collection by collection id.
```ruby
Tmdb::Collection.backdrops(10)
```

#### Posters

Get all of the posters for a particular collection by collection id.
```ruby
Tmdb::Collection.posters(10)
```

## Company

#### Detail

This method is used to retrieve all of the basic information about a company.
```ruby
Tmdb::Company.detail(1)
```

#### Movies

Get the list of movies associated with a particular company.
```ruby
Tmdb::Company.movies(1)
```

## Credit

#### Detail

Get the detailed information about a particular credit record. This is currently only supported with the new credit model found in TV. These ids can be found from any TV credit response as well as the tv_credits and combined_credits methods for people.The episodes object returns a list of episodes and are generally going to be guest stars. The season array will return a list of season numbers. Season credits are credits that were marked with the "add to every season" option in the editing interface and are assumed to be "season regulars".
```ruby
Tmdb::Credit.detail('5256c8b219c2956ff6047cd8')
```

## Discover

#### Movie

Discover movies by different types of data like average rating, number of votes, genres and certifications. You can get a valid list of certifications from Tmdb::Certification.
```ruby
Tmdb::Discover.movie
```
#### TV

Discover TV shows by different types of data like average rating, number of votes, genres, the network they aired on and air dates.
```ruby
Tmdb::Discover.tv
```

## Find

#### Movie

The find movie method makes it easy to search for objects in our database by an external id. For instance, an IMDB ID. This will search all objects (movies, TV shows and people) and return the results in a single response.  
The supported external sources for each object are as follows:

* Movies: imdb_id
* People: imdb_id, freebase_mid, freebase_id, tvrage_id
* TV Series: imdb_id, freebase_mid, freebase_id, tvdb_id, tvrage_id
* TV Seasons: freebase_mid, freebase_id, tvdb_id, tvrage_id
* TV Episodes: imdb_id, freebase_mid, freebase_id, tvdb_id, tvrage_id
```ruby
Tmdb::Find.movie('tt0266543', external_source: 'imdb_id')
```

## Genres

#### Movie List

Get the list of movie genres.
```ruby
Tmdb::Genre.movie_list
```

#### TV List

Get the list of TV genres.
```ruby
Tmdb::Genre.tv_list
```

#### Movies

Get the list of movies for a particular genre by id. By default, only movies with 10 or more votes are included.
```ruby
Tmdb::Genre.movies(18)
```

## Jobs

#### List

Get a list of valid jobs.
```ruby
Tmdb::Job.list
```

## Keywords

#### Detail

Get the basic information for a specific keyword id.
```ruby
Tmdb::Keyword.detail(1721)
```

#### Movies

Get the list of movies for a particular keyword by id.
```ruby
Tmdb::Keyword.movies(1721)
```

## Movies

#### Detail

Get the basic movie information for a specific movie id.
```ruby
Tmdb::Movie.detail(550)
```

#### Alternative titles

Get the alternative titles for a specific movie id.
```ruby
Tmdb::Movie.alternative_titles(550)
```

#### Cast

Get the cast information for a specific movie id.
```ruby
Tmdb::Movie.cast(550)
```

#### Crew

Get the crew information for a specific movie id.
```ruby
Tmdb::Movie.crew(550)
```

#### Directors

Get the directors information for a specific movie id.
```ruby
Tmdb::Movie.director(550)
```

#### Backdrops

Get the backdrops for a specific movie id.
```ruby
Tmdb::Movie.backdrops(550)
```

#### Posters

Get the posters for a specific movie id.
```ruby
Tmdb::Movie.posters(550)
```

#### Videos

Get the videos for a specific movie id.
```ruby
Tmdb::Movie.videos(550)
```

#### Keywords

Get the plot keywords for a specific movie id.
```ruby
Tmdb::Movie.keywords(550)
```

#### Releases

Get the release date and certification information by country for a specific movie id.
```ruby
Tmdb::Movie.releases(550)
```

#### Translations

Get the translations for a specific movie id.
```ruby
Tmdb::Movie.translations(550)
```

#### Similar

Get the similar movies for a specific movie id.
```ruby
Tmdb::Movie.similar(550)
```

#### Recommendations

Get the recommendations for a particular movie id.
```ruby
Tmdb::Movie.recommendations(550)
```

#### Reviews

Get the reviews for a particular movie id.
```ruby
Tmdb::Movie.reviews(550)
```

#### Lists

Get the lists that the movie belongs to.
```ruby
Tmdb::Movie.lists(550)
```

#### Changes

Get the changes for a specific movie id.Changes are grouped by key, and ordered by date in descending order. By default, only the last 24 hours of changes are returned. The maximum number of days that can be returned in a single request is 14. The language is present on fields that are translatable.
```ruby
Tmdb::Movie.changes(550, start_date: '2015-06-20', end_date: '2015-06-26')
```

#### Latest

Get the latest movie id.
```ruby
Tmdb::Movie.latest
```

#### Upcoming

Get the list of upcoming movies by release date. This list refreshes every day.
```ruby
Tmdb::Movie.upcoming
```

#### Now Playing

Get the list of movies playing that have been, or are being released this week. This list refreshes every day.
```ruby
Tmdb::Movie.now_playing
```

#### Popular

Get the list of popular movies on The Movie Database. This list refreshes every day.
```ruby
Tmdb::Movie.popular
```

#### Top Rated

Get the list of movies playing that have been, or are being released this week. This list refreshes every day.
```ruby
Tmdb::Movie.top_rated
```

## Networks

#### Detail

This method is used to retrieve the basic information about a TV network. You can use this ID to search for TV shows with the discover. At this time we don't have much but this will be fleshed out over time.
```ruby
Tmdb::Network.detail(1)
```

## People

#### Detail

Get the general person information for a specific id.
```ruby
Tmdb::Person.detail(22970)
```

#### Movie Credits

Get the movie credits for a specific person id.
```ruby
Tmdb::Person.movie_credits(22970)
```

#### TV Credits

Get the TV credits for a specific person id.To get the expanded details for each record, call the /credit method with the provided credit_id. This will provide details about which episode and/or season the credit is for.
```ruby
Tmdb::Person.tv_credits(22970)
```

#### Combined Credits

Get the combined (movie and TV) credits for a specific person id.To get the expanded details for each TV record, call the /credit method with the provided credit_id. This will provide details about which episode and/or season the credit is for.
```ruby
Tmdb::Person.combined_credits(22970)
```

#### External IDs

Get the external ids for a specific person id.
```ruby
Tmdb::Person.external_ids(1)
```

#### Images

Get the images for a specific person id.
```ruby
Tmdb::Person.images(1)
```

#### Tagged Images

Get the images that have been tagged with a specific person id. We return all of the image results with a media object mapped for each image.
```ruby
Tmdb::Person.tagged_images(287)
```

#### Changes

Get the changes for a specific person id.Changes are grouped by key, and ordered by date in descending order. By default, only the last 24 hours of changes are returned. The maximum number of days that can be returned in a single request is 14. The language is present on fields that are translatable.
```ruby
Tmdb::Person.changes(1, start_date: '2014-02-19', end_date: '2014-03-01')
```

#### Popular
Get the list of popular people on The Movie Database. This list refreshes every day.
```ruby
Tmdb::Person.popular
```

#### Latest
Get the latest person id.
```ruby
Tmdb::Person.latest
```

## Reviews

#### Detail

Get the full details of a review by ID.
```ruby
Tmdb::Review.detail('5013bc76760ee372cb00253e')
```

## Search

All search endpoints allow partial searches (truncated or uncomplete words).

#### Company

Search for companies by name.
```ruby
Tmdb::Search.company('Disney')
```

#### Collection

Search for collections by name.
```ruby
Tmdb::Search.collection('Lord of')
```

#### Keyword

Search for keywords by name.
```ruby
Tmdb::Search.keyword('Iron man')
```

#### List

Search for lists by name and description.
```ruby
Tmdb::Search.list('Cartoons')
```

#### Movie

Search for movies by title.
```ruby
Tmdb::Search.movie('Harry potter')
```

#### Multi

Search the movie, tv show and person collections with a single query. Each item returned in the result array has a media_type field that maps to either movie, tv or person.Each mapped result is the same response you would get from each independent search.
```ruby
Tmdb::Search.multi('Game of thrones')
```

#### Person

Search for people by name.
```ruby
Tmdb::Search.person('Angelina Jolie')
```

#### TV

Search for TV shows by title.
```ruby
Tmdb::Search.tv('Silicon Valley')
```

## TV

#### Detail

Get the primary information about a TV series by id.
```ruby
Tmdb::TV.detail(1396)
```

#### Alternative titles

Get the alternative titles for a specific show ID.
```ruby
Tmdb::TV.alternative_titles(1396)
```

#### Changes

Get the changes for a specific TV show id.Changes are grouped by key, and ordered by date in descending order. By default, only the last 24 hours of changes are returned. The maximum number of days that can be returned in a single request is 14. The language is present on fields that are translatable.TV changes are different than movie changes in that there are some edits on seasons and episodes that will create a change entry at the show level. They can be found under the season and episode keys. These keys will contain a series_id and episode_id. You can use the /tv/season/{id}/changes and /tv/episode/{id}/changes methods to look up these specific changes.
```ruby
Tmdb::TV.changes(1399, start_date: '2015-06-23', end_date: '2015-06-26')
```

#### Content Ratings

Get the content ratings for a specific TV show id.
```ruby
Tmdb::TV.content_ratings(1396)
```

#### Cast

Get the cast information for a specific tv id.
```ruby
Tmdb::TV.cast(1396)
```

#### Crew

Get the crew information for a specific tv id.
```ruby
Tmdb::TV.crew(1396)
```

#### External IDs

Get the external ids that we have stored for a TV series.
```ruby
Tmdb::TV.external_ids(1396)
```

#### Backdrops

Get the backdrops for a specific tv id.
```ruby
Tmdb::TV.backdrops(1396)
```

#### Posters

Get the posters for a specific tv id.
```ruby
Tmdb::TV.posters(1396)
```

#### Keywords

Get the plot keywords for a specific tv id.
```ruby
Tmdb::TV.keywords(1396)
```

#### Similar

Get the similar TV shows for a specific tv id.
```ruby
Tmdb::TV.similar(1396)
```

#### Translations

Get the list of translations that exist for a TV series. These translations cascade down to the episode level.
```ruby
Tmdb::TV.translations(1396)
```

#### Videos

Get the videos that have been added to a TV series (trailers, opening credits, etc...)
```ruby
Tmdb::TV.videos(1396)
```

#### Latest

Get the latest TV show id.
```ruby
Tmdb::TV.latest
```

#### On The Air

Get the list of TV shows that are currently on the air. This query looks for any TV show that has an episode with an air date in the next 7 days.
```ruby
Tmdb::TV.on_the_air
```

#### Airing Today

Get the list of TV shows that air today. Without a specified timezone, this query defaults to EST (Eastern Time UTC-05:00).
```ruby
Tmdb::TV.airing_today
```

#### Top Rated

Get the list of top rated TV shows. By default, this list will only include TV shows that have 2 or more votes. This list refreshes every day.
```ruby
Tmdb::TV.top_rated
```

#### Popular

Get the list of popular TV shows. This list refreshes every day.
```ruby
Tmdb::TV.popular
```

## TV Seasons

#### Detail

Get the primary information about a TV season by its season number.
```ruby
Tmdb::Tv::Season.detail(3572, 1)
```

#### Changes

Look up a TV season's changes by season ID. This method is used in conjunction with the /tv/{id}/changes method. This method uses the season_id value found in the change entries.
```ruby
Tmdb::Tv::Season.changes(59905, start_date: '2015-05-23', end_date: '2015-05-26')
```

#### Cast

Get the cast information for a TV season by season number.
```ruby
Tmdb::Tv::Season.cast(3572, 1)
```

#### Crew

Get the crew information for a TV season by season number.
```ruby
Tmdb::Tv::Season.crew(3572, 1)
```

#### External IDs

Get the external ids that we have stored for a TV season by season number.
```ruby
Tmdb::Tv::Season.external_ids(3572, 1)
```

#### Posters

Get the images (posters) that we have stored for a TV season by season number.
```ruby
Tmdb::Tv::Season.posters(1399, 1)
```

#### Videos

Get the videos that have been added to a TV season (trailers, teasers, etc...)
```ruby
Tmdb::Tv::Season.videos(1399, 1)
```

## TV Episodes

#### Detail

Get the primary information about a TV episode by combination of a season and episode number.
```ruby
Tmdb::Tv::Episode.detail(3572, 1, 1)
```

#### Changes

Look up a TV episode's changes by episode ID. This method is used in conjunction with the /tv/{id}/changes method. This method uses the episode_id value found in the change entries.
```ruby
Tmdb::Tv::Episode.changes(63065, start_date: '2015-06-15', end_date: '2015-06-20')
```

#### Cast

Get the cast information by combination of season and episode number.
```ruby
Tmdb::Tv::Episode.cast(3572, 1, 1)
```

#### Crew

Get the crew information by combination of season and episode number.
```ruby
Tmdb::Tv::Episode.crew(3572, 1, 1)
```

#### Guest Stars

Get the guest stars information by combination of season and episode number.
```ruby
Tmdb::Tv::Episode.guest_stars(3572, 1, 1)
```

#### External IDs

Get the external ids for a TV episode by comabination of a season and episode number.
```ruby
Tmdb::Tv::Episode.external_ids(3572, 1, 1)
```

#### Posters

Get the images (episode stills) for a TV episode by combination of a season and episode number. Since episode stills don't have a language, this call will always return all images.
```ruby
Tmdb::Tv::Episode.posters(1399, 1, 1)
```

#### Videos

Get the videos that have been added to a TV episode (teasers, clips, etc...)
```ruby
Tmdb::Tv::Episode.videos(1399, 1, 1)
```

## Contributing

We love pull requests! Here's a quick guide for contributing:

1. Fork the repo.

2. Run the existing test suite:
```
$ bundle exec rspec
```
3. Add tests for your change.

4. Add your changes and make your test(s) pass. Following the conventions you
see used in the source will increase the chance that your pull request is
accepted right away.

5. Update the README if necessary.

6. Add a line to the CHANGELOG for your bug fix or feature.

7. Push to your fork and submit a pull request.

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
