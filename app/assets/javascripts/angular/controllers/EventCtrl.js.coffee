# Controller for event visualizer

@RingBase.controller "EventCtrl", ($scope, $rootScope, $window) ->
  $scope.active_node = "node-browser"

  $rootScope.$on 'handle_instrument', (evt, data) ->
    node_name = data['node']
    active_node = "node-#{node_name}"
    console.log("Got instrumentation: #{active_node}")
    $scope.active_node = active_node
    $scope.$apply()
