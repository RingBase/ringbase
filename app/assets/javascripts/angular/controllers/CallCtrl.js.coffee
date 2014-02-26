@RingBase.controller "CallCtrl", ($scope, $modal) ->
  $scope.notes_list = []
  $scope.current_user = window.current_user.full_name
  $scope.total = "72.50"
  $scope.open = ->
    modalInstance = $modal.open {
      templateUrl: 'templates/modal.html',
      controller: 'ModalInstanceCtrl'
    }

  $scope.send = ->
    $scope.notes_list.push($scope.note)
    $scope.note = ""
    $scope.current_time = current_time()

  $scope.$watch 'total', ->
    console.log($scope.total)

  current_time = ->
    date = new Date()
    current_time = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds()

@RingBase.controller 'ModalInstanceCtrl', ($scope, $modalInstance, Agent) ->
  $scope.cancel = ->
    $modalInstance.dismiss "cancel"

  Agent.getAllAgents().then (data) ->
    $scope.all_agents = data