@RingBase.controller "CallCtrl", ($scope, $modal) ->
  $scope.total = "72.50"
  $scope.open = ->
    modalInstance = $modal.open {
      templateUrl: 'templates/modal.html',
      controller: 'ModalInstanceCtrl'
    }

  $scope.$watch 'total', (total) ->
    console.log($scope.total)

@RingBase.controller 'ModalInstanceCtrl', ($scope, $modalInstance, Agent) ->
  $scope.cancel = ->
    $modalInstance.dismiss "cancel"

  Agent.getAllAgents().then (data) ->
    $scope.all_agents = data
