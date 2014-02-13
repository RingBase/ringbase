#= require_self
#= require_tree .

@RingBase = angular.module("ringbase", ["ngRoute"])

# Sets up routing
@RingBase.config(($routeProvider) ->
  $routeProvider
  .when("/",
    templateUrl: "templates/home.html",
    controller: "PhoneCtrl"
  )
  .when("/dashboard",
    templateUrl: "templates/dashboard.html"
    controller: "PhoneCtrl"
  )
  .when("/call",
    templateUrl: "templates/call.html"
    controller: "PhoneCtrl"
  )
  .otherwise({
    templateUrl: "templates/home.html",
    controller: "PhoneCtrl"
  }) 
)