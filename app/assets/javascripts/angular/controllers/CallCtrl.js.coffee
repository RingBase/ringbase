@RingBase.controller "CallCtrl", ($scope, $modal) ->
  $scope.notes_list = []
  $scope.current_user = window.current_user.full_name
  $scope.total = "0.00"
  $scope.callId = $routeParams.callId

  $scope.open = ->
    modalInstance = $modal.open {
      templateUrl: 'templates/modal.html',
      controller: 'ModalInstanceCtrl'
    }

  $scope.send = ->
    $scope.notes_list.push([$scope.note, current_time()])
    $scope.note = ""

  $scope.$watch 'total', ->
    console.log($scope.total)

  current_time = ->
    date = new Date()
    date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds()