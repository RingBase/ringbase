@RingBase.controller "CallCtrl", ($scope, $modal, $timeout, $routeParams) ->
  $scope.notes_list = []
  $scope.current_user = window.current_user.full_name
  $scope.total = "0.00"
  $scope.callId = $routeParams.callId

  $scope.minutes = 0
  $scope.seconds = 0 + "0"

  $scope.onTimeout = ->
    $scope.seconds++
    $scope.seconds = "0" + $scope.seconds if $scope.seconds < 10

    if($scope.seconds == 60)
      $scope.seconds = 0 + "0"
      $scope.minutes++

    mytimeout = $timeout($scope.onTimeout, 1000)

  mytimeout = $timeout($scope.onTimeout, 1000)

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
