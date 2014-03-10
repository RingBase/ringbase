@RingBase.controller "PhoneCtrl", ($scope, $window, Communicator, Agent) ->
  $scope.current_agent = $window.current_user
  $scope.current_organization = $window.current_organization
  $scope.calls = []


  Communicator.connect $scope.current_agent.id, ->
    Communicator.send { type: 'list_calls', agent_id: $scope.current_agent.id }


  # When we receive data from the broker, dispatch the appropriate handler
  # and "re-render"
  Communicator.subscribe (json) ->
    type = json.type
    data = json.data
    $scope["handle_#{type}"](data)
    $scope.$apply()


  $scope.send = (event) ->
    Communicator.send(event)


  $scope.accept_call = ->
    console.log 'accepting call - send to broker'
    $scope.send {
      type: 'call_accept',
      agent_id: $scope.current_agent.id,
      call: {
        id: 2
      }
    }


  $scope.handle_join = (data) ->
    # TODO

  $scope.handle_call_start = (call) ->
    $scope.calls.push(call)


  $scope.handle_call_accepted = (call) ->
    console.log("call accepted!")

  $scope.handle_call_transfer_completed = (call) ->
    console.log("call transfer completed!")


  $scope.handle_call_list = (json) ->
    console.log "got call list from broker"
    console.log json
