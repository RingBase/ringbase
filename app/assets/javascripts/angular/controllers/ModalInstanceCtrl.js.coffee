@RingBase.controller 'ModalInstanceCtrl', ($scope, $modalInstance, Agent) ->
  $scope.cancel = ->
    $modalInstance.dismiss "cancel"

  Agent.getAllAgents().then (data) ->
    $scope.all_agents = data