'use strict'

module.exports = ($scope, $http, $location, $modalInstance, entry) ->
  $scope.title = entry.host
  $scope.entries = []

  api = [$location.protocol() + '://' + $location.host() + ':3000', 'arp', entry.host, 'ports'].join('/')

  $http.get(api).success((data) ->
    $scope.entries = data.ports
  ).error((data, status, headers, config) ->
    console.log data
  )

  $scope.close = ->
    $modalInstance.dismiss "close"
