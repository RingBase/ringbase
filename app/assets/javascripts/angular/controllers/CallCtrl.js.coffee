@RingBase.controller "CallCtrl", ($scope, $modal, $timeout, $routeParams, $window) ->
  $scope.notes_list = []
  $scope.current_user = $window.current_user.full_name
  $scope.total = "0.00"
  $scope.callId = $routeParams.callId

  $scope.minutes = 0 + "0"
  $scope.seconds = 0 + "0"

  $scope.onTimeout = ->
    $scope.seconds++
    $scope.seconds = "0" + $scope.seconds if $scope.seconds < 10

    if($scope.seconds == 60)
      $scope.seconds = 0 + "0"
      if($scope.minutes > 10 || $scope.minutes == 9)
        $scope.minutes++;
      else
        $scope.minutes++
        $scope.minutes = "0" + $scope.minutes
        
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

  # Retrieve the current time as a string
  # Seconds are padding with leading zeroes if necessary
  current_time = ->
    date    = new Date()
    hours   = date.getHours()
    minutes = date.getMinutes()
    seconds = ('0' + date.getSeconds()).substr(-2)
    "#{hours}:#{minutes}:#{seconds}"
