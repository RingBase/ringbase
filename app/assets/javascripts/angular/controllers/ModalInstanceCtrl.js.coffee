@RingBase.controller 'ModalInstanceCtrl', ($scope, $rootScope, $modalInstance, $routeParams, Agent) ->

  $scope.cancel = -> $modalInstance.dismiss("cancel")

  $scope.transferred = false

  Agent.getAllAgents().then (agents) -> $scope.all_agents = agents

  # Propagate the transfer selection through to the Communicator
  $scope.transfer = (agent_id) ->
    $scope.transferred = true
    call_id = $routeParams.callId
    $rootScope.communicator.send_transfer_request(agent_id, call_id)
