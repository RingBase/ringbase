@RingBase.controller 'ModalInstanceCtrl', ($scope, $rootScope, $modalInstance, Agent, Communicator) ->
  #$scope.current_agent = $window.current_user
  #Communicator.connect($scope.current_agent.id)

  $scope.cancel = ->
    $modalInstance.dismiss "cancel"

  Agent.getAllAgents().then (data) ->
    $scope.all_agents = data

  $scope.transfer = (agent_id, call) ->
    console.log agent_id
    $rootScope.communicator.transfer(agent_id, call)
    $modalInstance.close agent_id
