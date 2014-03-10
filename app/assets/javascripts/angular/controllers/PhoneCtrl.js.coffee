@RingBase.controller "PhoneCtrl", ($scope, $window, Communicator, Agent) ->
  $scope.current_user = $window.current_user
  $scope.current_organization = $window.current_organization
  $scope.calls = {} # id -> call attrs

  Communicator.connect($scope.current_user.id)

  Communicator.subscribe (data) ->
    type = data.type
    call = data.data # TODO: :(
    $scope["handle_#{type}"](call)
    $scope.$apply()


  $scope.send = (event) ->
    Communicator.send(event)


  $scope.accept_call = (call_id) ->
    $scope.calls[call_id].answered = true
    $scope.send {
      type: 'call_accept',
      agent_id: $scope.current_user.id,
      call: { id: call_id }
    }


  $scope.handle_join = (data) ->
    # TODO


  $scope.handle_call_start = (call) ->
    call.answered = false
    $scope.calls[call.id] = call


  # TODO: check if we're an interested listener here?
  $scope.handle_call_accepted = (call) ->
    console.log("call accepted! redirect")


  $scope.handle_call_transfer_completed = (call) ->
    console.log("call transfer completed!")
