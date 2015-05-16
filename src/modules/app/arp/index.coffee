'use strict'

module.exports = angular.module('arpy.arp', ['arpy.common.services'])
    .config(($stateProvider) ->
      $stateProvider.state 'arp',
      url: ''
      templateUrl: 'app/arp/layout.html'
      controller: 'arpController'
).controller('arpController', require('./arpController'))
