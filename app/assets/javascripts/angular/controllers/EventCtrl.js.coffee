# Controller for event visualizer

@RingBase.controller "EventCtrl", ($scope, $rootScope, $window) ->
  $scope.active_node = "node-browser"

  $rootScope.$on 'handle_instrument', (evt, data) ->
    node_name = data['node']
    agent_id  = data['agent_id']

    # Don't show events for the user viewing the viz
    if agent_id != $window.current_user.id
     console.log "event viz got instrumentation!", "node-#{node_name}, agent_id: #{agent_id}"
     $scope.active_node = "node-#{node_name}"
     $scope.$apply()
