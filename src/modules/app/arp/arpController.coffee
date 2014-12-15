'use strict'

module.exports = ($scope, $http, $location, $timeout) ->
  api = [
    $location.protocol() + '://' + $location.host() + ':3000', 'arp'
  ].join('/')
  do tick = ->
    $http.get(api).success((data) ->
      $scope.entries = data
      $timeout(tick, 3000)
    ).error((data, status, headers, config) ->
      console.log data
    )
  $scope.remove = (entry) ->
    $http.delete([api, entry.host].join('/')).success((data) ->
      index = $scope.entries.indexOf(entry)
      $scope.entries.splice(index, 1)
    ).error((data, status, headers, config) ->
      console.log data
    )
