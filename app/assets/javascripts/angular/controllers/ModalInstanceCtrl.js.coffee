# TODO: probably need $scope.call for showing/hiding spinner based on transfer status


@RingBase.controller 'ModalInstanceCtrl', ($scope, $rootScope, $modalInstance, $routeParams, Agent, Communicator) ->

  $scope.cancel = -> $modalInstance.dismiss("cancel")

  Agent.getAllAgents().then (agents) -> $scope.all_agents = agents

  # Propagate the transfer selection through to the Communicator
  $scope.transfer = (agent_id) ->
    call_id = $routeParams.callId
    $rootScope.communicator.send_transfer_request(agent_id, call_id)
    # TODO: we could close the modal here, but would prefer to
    # toggle spinner instead and clsoe modal when receive transfer_complete
