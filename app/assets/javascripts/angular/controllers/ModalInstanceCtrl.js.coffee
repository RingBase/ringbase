@RingBase.controller 'ModalInstanceCtrl', ($scope, $rootScope, $modalInstance, $location, $routeParams, Agent) ->

  $scope.cancel = -> $modalInstance.dismiss("cancel")

  $scope.transferred = false

  Agent.getAllAgents().then (agents) -> $scope.all_agents = agents

  # Propagate the transfer selection through to the Communicator
  $scope.transfer = (agent_and_number) ->
    [agent_id, phone_number] = agent_and_number.split(':') # TODO: hack
    $scope.transferred = true
    call_id = $routeParams.callId
    console.log "agent_id", agent_id
    $rootScope.communicator.send {
      type: 'bridge_to',
      agent: { id: agent_id, phone_number: phone_number }
      call: { id: call_id }
    }
    $scope.cancel()
    document.location = "/"
