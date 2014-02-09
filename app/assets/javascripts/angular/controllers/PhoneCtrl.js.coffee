@RingBase.controller 'PhoneCtrl', ($scope, Communicator) ->
  $scope.messages = []
  Communicator.connect()

  Communicator.subscribe (message) ->
    $scope.messages.push message
    $scope.$apply()
    return

  $scope.send = ->
    Communicator.send $scope.text
    $scope.text = ""
    return

  return