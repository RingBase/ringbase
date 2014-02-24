@RingBase.controller "PhoneCtrl", ($scope, Communicator, Agent) ->
  $scope.current_agent = window.current_user
  $scope.calls = []

  Communicator.connect($scope.current_agent.id)

  Communicator.subscribe (data) ->
    type = data.type
    call = data.data # TODO: :(
    $scope["handle_#{type}"](call)
    $scope.$apply()

  $scope.send = ->
    Communicator.send $scope.text
    $scope.text = ""

  $scope.handle_join = (data) ->
    # TODO

  $scope.handle_call_start = (call) ->
    $scope.calls.push(call)
