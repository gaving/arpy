'use strict'

module.exports = angular.module('arpy', [
  'ui.bootstrap'
  'ui.router'
  require('../../../tmp/templates').name
  require('../common/index').name
  require('./arp/index').name
  require('./modal/index').name
])
