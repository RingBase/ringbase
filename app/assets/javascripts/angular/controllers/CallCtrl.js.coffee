@RingBase.controller "CallCtrl", ($scope, $modal, Agent) ->
  $scope.open = ->
    modalInstance = $modal.open(
      templateUrl: 'templates/modal.html',
      controller: 'CallCtrl'
    )

  Agent.getAllAgents().then (data) ->
    $scope.all_agents = data