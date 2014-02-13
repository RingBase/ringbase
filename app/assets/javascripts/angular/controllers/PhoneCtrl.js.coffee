@RingBase.controller "PhoneCtrl", ($scope, Communicator, User) ->
  $scope.messages = []
  Communicator.connect()

  Communicator.subscribe (message) ->
    $scope.messages.push message
    $scope.$apply()

  $scope.send = ->
    Communicator.send $scope.text
    $scope.text = ""

  User.getUser().then (data) ->
    $scope.current_user = data