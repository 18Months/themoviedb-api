## 1.2.0 (2017-05-12)

Minor:
  
  - New endpoint added for movie recommendations Tmdb::Movie.recommendations
  - Upgraded dependencies on gemfile

## 1.1.0 (2016-02-09)

Bugfixes:
  
  - Fixed bad query escaping that prevented searching some particular strings

Improvement:

  - Httparty dependency removed, now using a more powerful rest-client

## 1.0.4 (2016-01-11)

Improvement:

  - Tmdb::Search methods now return correct Tmdb::Result objects

## 1.0.3 (2015-09-29)

Improvement:
    
  - Upgraded Httparty dependency.

## 1.0.2 (2015-07-17)

Improvement:
    
  - Removed ActiveSupport dependency (Improve compatibility with existing Rails applications).

## 1.0.0 (2015-07-17)

- Releasing stable version, all tests completed.
- Documentation completed.

## 0.7.1 (2015-06-26)

Bugfixes:

  - Added themoviedb-api.rb class in order to avoid specifying gem main class manually.

## 0.7.0 (2015-06-3)
  
  - First version, stable, but some more tests are required
  
