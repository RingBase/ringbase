# Controller for main dashboard

@RingBase.controller "PhoneCtrl", ($scope, $rootScope, $location, $window, $timeout, Agent) ->
  $scope.current_user = $window.current_user
  $scope.current_organization = $window.current_organization
  $scope.calls = {} # id -> call attrs
  $scope.inProgressCalls = {} # this will hold all the calls that are in progress

  Agent.getAllAgents().then (agents) -> $scope.all_agents = agents

  $scope.getInProgressCalls = ->
      for id,call of $scope.calls
        if call[call.id].answered == true
          $scope.inProgressCalls[call.id] = call
          $scope.$apply()


  $scope.selectedCity = "Select City"

  $scope.setSelectedCity = (city) ->
    $scope.selectedCity = city



    Agent.getAllAgents().then (agents) ->
    $scope.all_agents = agents

  $scope.send = (event) ->
    $rootScope.communicator.send(event)


  # Load calls as soon as we're connected
  $rootScope.communicator.on_connect ->
    pilot_number = $window.current_organization.campaigns[0].pilot_number
    $scope.send {
      type: "list_calls",
      agent_id: $window.current_user.id,
      org_pilot_number: pilot_number
    }


  $scope.accept_call = (call) ->
    $scope.calls[call.id].answered = true
    $scope.send {
      type: 'bridge_to',
      agent: $scope.current_user,
      call: call
    }


  $scope.parseStartTime = (call) ->
    Date.parse(call.start_time)


  # Event handlers
  # -------------------------

  $rootScope.$on 'handle_call_start', (evt, call) ->
    console.log("call started!")
    call.answered = false
    $scope.calls[call.id] = call
    $scope.$apply()

  $rootScope.$on 'handle_call_stop', (evt, call) ->
    console.log("call stopped")
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


@RingBase.filter "locationFilter", ->
 (input, scope) ->
   filterCalls = []
   if scope.selectedCity == "Select City"
     input
   else
     for id,call of input
       if scope.selectedCity == call.city
         filterCalls.push call
     filterCalls
