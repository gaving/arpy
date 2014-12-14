'use strict'

module.exports = angular.module('warp', [
  'ui.bootstrap'
  'ui.router'
  require('../../../tmp/templates').name
  require('../common/index').name
  require('./arp/index').name
])
