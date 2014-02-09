#= require_self
#= require_tree .

@RingBase = angular.module('ringbase', ['ngRoute'])

# Sets up routing
@RingBase.config(($routeProvider) ->
  $routeProvider.
    otherwise({
      controller: 'PhoneCtrl'
    }) 
)