#= require_self
#= require_tree .

@RingBase = angular.module('ringbase', ['ngRoute'])

# Sets up routing
@RingBase.config(($routeProvider) ->
  $routeProvider.
    otherwise({
      template: "Angular template goes here",
      controller: 'PhoneCtrl'
    }) 
)