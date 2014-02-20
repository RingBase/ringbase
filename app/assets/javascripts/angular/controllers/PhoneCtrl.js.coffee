@RingBase.controller "PhoneCtrl", ($scope, Communicator, Agent) ->
  $scope.messages = []
  Communicator.connect()

  Communicator.subscribe (message) ->
    $scope.messages.push message
    $scope.$apply()

  $scope.send = ->
    Communicator.send $scope.text
    $scope.text = ""

  Agent.getCurrentAgent().then (data) ->
    $scope.current_agent = data