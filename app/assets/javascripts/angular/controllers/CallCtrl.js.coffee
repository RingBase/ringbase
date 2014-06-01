# TODO: this should define some of the handlers that are currently defined in the PhoneCtrl


@RingBase.controller "CallCtrl", ($scope, $rootScope, $modal, $timeout, $location, $routeParams, $window) ->
  $scope.modalInstance = null
  $scope.notes_list = []
  $scope.current_user = $window.current_user
  $scope.total = "0.00"
  $scope.callId = $routeParams.callId
  $scope.phoneNumber = $routeParams.phoneNumber
  $scope.minutes = 0 + "0"
  $scope.seconds = 0 + "0"

  $scope.onTimeout = ->
    $scope.seconds++
    $scope.seconds = "0" + $scope.seconds if $scope.seconds < 10

    if ($scope.seconds == 60)
      $scope.seconds = 0 + "0"
      if ($scope.minutes > 10 || $scope.minutes == 9)
        $scope.minutes++
      else
        $scope.minutes++
        $scope.minutes = "0" + $scope.minutes

    mytimeout = $timeout($scope.onTimeout, 1000)

  mytimeout = $timeout($scope.onTimeout, 1000)

  $scope.open = ->
    $scope.modalInstance = $modal.open {
      templateUrl: 'templates/modal.html',
      controller: 'ModalInstanceCtrl'
    }

  $scope.update_notes = ->
    console.log "update notes"
    current_user = $scope.current_user

    $scope.notes_list.push([$scope.note, current_time(), current_user.full_name])
    $rootScope.communicator.send {
      type: "update_notes",
      agent_id: current_user.id,
      call_id: $routeParams.callId,
      note: $scope.note,
      user_name: current_user.full_name
    }
    $scope.note = ""

  $scope.haveMessages = ->
    $scope.notes_list.length > 0

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


  $rootScope.$on 'handle_call_transfer_completed', (evt, call) ->
    console.log("call transfer completed!")
    $scope.modalInstance.close()
    $location.path("/")

  $rootScope.$on 'handle_notes_updated', (evt, data) ->
    console.log "notes updated, got data: ", data
    #if data.call_id == $routeParams.callId
    # TODO: sync $ amount
    $scope.notes_list.push([data.note, current_time(), data.user_name])
    $scope.$apply()
