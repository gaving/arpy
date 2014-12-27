'use strict'

module.exports = angular.module('warp.arp', ['warp.common.services'])
    .config(($stateProvider) ->
      $stateProvider.state 'arp',
      url: ''
      templateUrl: 'app/arp/layout.html'
      controller: 'arpController'
).controller('arpController', require('./arpController'))
