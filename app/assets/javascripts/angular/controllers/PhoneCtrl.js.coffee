@RingBase.controller "PhoneCtrl", ($scope, $rootScope, $location, $window) ->
  $scope.current_user = $window.current_user
  $scope.current_organization = $window.current_organization
  $scope.calls = {} # id -> call attrs

  $rootScope.communicator.subscribe (json) ->
    console.log json
    console.log "inside communicator"
    type = json.type
    data = json.data # TODO: :(
    $scope["handle_#{type}"](data)
    $scope.$apply()

  #Communicator.connect $scope.current_agent.id, ->
  #  Communicator.send { type: 'list_calls', agent_id: $scope.current_agent.id }


  # When we receive data from the broker, dispatch the appropriate handler
  # and "re-render"
  #Communicator.subscribe (json) ->
  #  type = json.type
  #  data = json.data


  $scope.send = (event) ->
    $rootScope.communicator.send(event)

  $scope.accept_call = (call_id) ->
    $scope.calls[call_id.id].answered = true
    $scope.send {
      type: 'call_accept',
      agent_id: $scope.current_user.id,
      call: { id: call_id.id, name: call_id.name, email: call_id.email, city: call_id.city, number: call_id.number }
    }

  $scope.handle_join = (data) ->
    # TODO

  $scope.handle_call_start = (call) ->
    call.answered = false
    $scope.calls[call.id] = call
    console.log("call started!")

  # TODO: check if we're an interested listener here?
  $scope.handle_call_accepted = (call) ->
    console.log("call accepted! redirect")
    $location.path("/call/#{call.id}/#{call.number}")

  $scope.handle_call_transfer_completed = (call) ->
    console.log("call transfer completed!")

  $scope.handle_call_list = (json) ->
    for call_id,call of json.calls
      $scope.calls[call_id] = call
