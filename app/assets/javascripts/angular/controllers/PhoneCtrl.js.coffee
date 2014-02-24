@RingBase.controller "PhoneCtrl", ($scope, Communicator, Agent) ->
  $scope.current_user_id = window.current_user_id

  $scope.messages = []
  Communicator.connect()

  Communicator.subscribe (message) ->
    $scope.messages.push message
    $scope.$apply()

  $scope.send = ->
    Communicator.send $scope.text
    $scope.text = ""

  Agent.getCurrentAgent(current_user_id).then (data) ->
    $scope.current_agent = data