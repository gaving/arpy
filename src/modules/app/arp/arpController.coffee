'use strict'

module.exports = ($scope, $http, $location, $timeout) ->
  do tick = =>
    $http.get([$location.protocol() + '://' + $location.host() + ':3000', 'arp'].join('/')).success((data) ->
      $scope.entries = data
      $timeout(tick, 3000)
    ).error((data, status, headers, config) ->
      console.log data
    )
