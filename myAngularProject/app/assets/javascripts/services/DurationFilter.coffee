services = angular.module('services')
services.filter('durationFilter', ->
  (duration) ->
    switch duration
      when 0
        '30 Minutes'
      when 1
        '1 Hour'
      when 2
        '1:30 Hours'
      when 3
        '2 Hours'
      else
        'Unknown'
    
)