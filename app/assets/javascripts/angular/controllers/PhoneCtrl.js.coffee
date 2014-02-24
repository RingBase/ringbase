@RingBase.controller "PhoneCtrl", ($scope, Communicator, Agent) ->
  $scope.current_agent = window.current_user

  $scope.messages = []
  Communicator.connect()

  Communicator.subscribe (message) ->
    $scope.messages.push message
    $scope.$apply()

  $scope.send = ->
    Communicator.send $scope.text
    $scope.text = ""