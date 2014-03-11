# Controller for main dashboard

@RingBase.controller "PhoneCtrl", ($scope, $rootScope, $location, $window, $timeout) ->
  $scope.current_user = $window.current_user
  $scope.current_organization = $window.current_organization
  $scope.calls = {} # id -> call attrs

  # When we receive data from the broker, dispatch the appropriate handler and "re-render"
  $rootScope.communicator.subscribe (json) ->
    type = json.type
    data = json.data
    $scope["handle_#{type}"](data)
    $scope.$apply()

  $scope.send = (event) ->
    $rootScope.communicator.send(event)

  $scope.accept_call = (call) ->
    $scope.calls[call.id].answered = true
    $scope.send {
      type: 'call_accept',
      agent_id: $scope.current_user.id,
      call: {
        id: call.id,
        name: call.name,
        email: call.email,
        city: call.city,
        number: call.number
      }
    }


  # Event handlers
  # -------------------------

  $scope.handle_call_start = (call) ->
    call.answered = false
    $scope.calls[call.id] = call
    console.log("call started!")


  # TODO: check if we're an interested listener here?
  $scope.handle_call_accepted = (call) ->
    console.log("call accepted! redirect")
    $location.path("/call/#{call.id}/#{call.number}")


  $scope.handle_call_transfer_completed = (call) ->
    # TODO: this is running on the call view page??
    # Therefore if we refresh on the call view page we lose the subscribe/dispatch setup in this Ctrl
    console.log("call transfer completed!")
    #$modalInstance.dismiss('cancel')
    $timeout ->
      $location.path("/")
    , 1000


  $scope.handle_call_list = (json) ->
    for call_id,call of json.calls
      $scope.calls[call_id] = call
