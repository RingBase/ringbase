@RingBase.controller 'ModalInstanceCtrl', ($scope, $modalInstance, Agent) ->
  #$scope.current_agent = $window.current_user
  #Communicator.connect($scope.current_agent.id)

  $scope.cancel = ->
    $modalInstance.dismiss "cancel"

  Agent.getAllAgents().then (data) ->
    $scope.all_agents = data

  $scope.transfer = (model) ->
 	#Communicator.send $scope.model
    $scope.radioMod = model
    console.log $scope.radioMod
    $modalInstance.dismiss "transfer"
