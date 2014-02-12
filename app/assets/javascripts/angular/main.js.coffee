#= require_self
#= require_tree .

@RingBase = angular.module("ringbase", ["ngRoute", "ui.bootstrap"])

# Sets up routing
@RingBase.config(($routeProvider) ->
  $routeProvider.
    otherwise({
      templateUrl: "templates/home.html",
      controller: "PhoneCtrl"
    }) 
)