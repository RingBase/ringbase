# Controller for main dashboard

@RingBase.controller "PhoneCtrl", ($scope, $rootScope, $location, $window, $timeout, Agent) ->
  $scope.current_user = $window.current_user
  $scope.current_organization = $window.current_organization
  $scope.calls = []
  $scope.inProgressCalls = {} # this will hold all the calls that are in progress

  Agent.getAllAgents().then (agents) ->
    $scope.all_agents = agents

  # Load calls as soon as we're connected
  $rootScope.communicator.on_connect ->
    pilot_number = $window.current_organization.campaigns[0].pilot_number
    $scope.send {
      type: "list_calls",
      agent_id: $window.current_user.id,
      org_pilot_number: pilot_number
    }


  # TODO: this is weird. need partition, i.e. remove from $scope.calls?
  $scope.getInProgressCalls = ->
    $scope.inProgressCalls = $scope.calls.filter (c) -> c.state == 'bridged'


  $scope.selectedCity = "Select City"

  $scope.setSelectedCity = (city) ->
    $scope.selectedCity = city


  $scope.send = (event) ->
    $rootScope.communicator.send(event)


  $scope.formatDate = (time) ->
    date = new Date(time)
    hours = ((date.getHours() + 11) % 12 + 1).toString()
    minutes = date.getMinutes().toString()
    minutes += "0" if minutes.length == 1 # 0 -> 00
    "#{hours}:#{minutes}"


  $scope.accept_call = (call) ->
    call.answered = true
    $scope.send {
      type: 'bridge_to',
      agent: $scope.current_user,
      call: call
    }


  $scope.view_call = (call) ->
    $location.path("/call/#{call.call_uuid}/#{call.calling_national_number}")


  # Event handlers
  # -------------------------

  $rootScope.$on 'handle_call_start', (evt, call) ->
    console.log("call started!")
    call.answered = false
    $scope.calls.push(call)
    $scope.$apply()


  $rootScope.$on 'handle_call_stop', (evt, call) ->
    console.log("call stopped")
    # TODO
    $scope.$apply()


  # TODO: check if we're an interested listener here?
  $rootScope.$on 'handle_call_accepted', (evt, call) ->
    console.log "call accepted! redirect"
    $scope.$apply ->
      $location.path("/call/#{call.id}/#{call.number}")


  $rootScope.$on 'handle_call_list', (evt, json) ->
    unanswered_calls = []
    answered_calls = []
    for call in json.calls
      if call.state == 'bridged'
        answered_calls.push(call)
      else
        unanswered_calls.push(call)

    $scope.calls = unanswered_calls.sort (a,b) ->
      # Most recent calls first
      Date.parse(b.start_time) - Date.parse(a.start_time)
    $scope.inProgressCalls = answered_calls.sort (a,b) ->
      # Most recent calls first
      Date.parse(b.start_time) - Date.parse(a.start_time)
    $scope.$apply()



@RingBase.filter "locationFilter", ->
 (input, scope) ->
   filterCalls = []
   if scope.selectedCity == "Select City"
     input
   else
     for id,call of input
       if scope.selectedCity == call.city
         filterCalls.push(call)
     filterCalls
