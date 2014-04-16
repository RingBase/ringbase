# Controller for main dashboard

@RingBase.controller "PhoneCtrl", ($scope, $rootScope, $location, $window, $timeout, Agent) ->
  $scope.current_user = $window.current_user
  $scope.current_organization = $window.current_organization
  $scope.calls = {} # id -> call attrs
  $scope.inProgressCalls = {} # this will hold all the calls that are in progress
  
  Agent.getAllAgents().then (agents) -> $scope.all_agents = agents

  $scope.getInProgressCalls = ->
      for id,call in $scope.calls
        if call[call.id].answered == true
          $scope.inProgressCalls[call.id] = call
          $scope.$apply()
  

  $scope.send = (event) ->
    $rootScope.communicator.send(event)

  # Load calls as soon as we're connected
  $rootScope.communicator.on_connect ->
    $scope.send { type: "list_calls", agent_id: $window.current_user.id }

  $scope.accept_call = (call) ->
    $scope.calls[call.id].answered = true
    $scope.send {
      type: 'call_accept',
      agent_id: $scope.current_user.id,
      call: {
        agent_id: current_user.id
        agent_name: current_user.full_name
        id: call.id,
        name: call.name,
        email: call.email,
        city: call.city,
        number: call.number
      }

    }


  # Event handlers
  # -------------------------

  $rootScope.$on 'handle_call_start', (evt, call) ->
    console.log("call started!")
    call.answered = false
    $scope.calls[call.id] = call
    $scope.$apply()


  # TODO: check if we're an interested listener here?
  $rootScope.$on 'handle_call_accepted', (evt, call) ->
    console.log "call accepted! redirect"
    $scope.$apply ->
      $location.path("/call/#{call.id}/#{call.number}")


  $rootScope.$on 'handle_call_list', (evt, json) ->
    for call in json.calls
      $scope.calls[call.id] = call
    $scope.$apply()

