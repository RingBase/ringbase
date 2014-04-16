#= require_self
#= require_tree .

@RingBase = angular.module("ringbase", ["ngRoute", "ui.bootstrap"])

# Sets up routing
@RingBase.config(($routeProvider) ->
  $routeProvider
  .when("/",
    templateUrl: "templates/dashboard.html",
    controller: "PhoneCtrl"
  )
  .when("/organizations/:id/invite",
    templateUrl: "templates/invite.html"
    controller: "InvitationCtrl"
  )
  .when("/dashboard",
    templateUrl: "templates/dashboard.html"
    controller: "PhoneCtrl"
  )
  .when("/inProgress",
    templateUrl: "templates/in-progress.html"
    controller: "PhoneCtrl"
    
  )
  .when("/completed",
    templateUrl: "templates/completed.html"
    controller: "PhoneCtrl"
  )
  .when("/call/:callId/:phoneNumber",
    templateUrl: "templates/call.html"
    controller: "CallCtrl"
  )
  .otherwise({
    templateUrl: "templates/home.html",
    controller: "PhoneCtrl"
  })
)

@RingBase.run ($rootScope, $window, Communicator) ->
  $rootScope.communicator = Communicator
  if $window.current_user?
    $rootScope.communicator.connect($window.current_user.id)
