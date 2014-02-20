@RingBase.controller "CallCtrl", ($scope, $modal) ->
  $scope.open = ->
    modalInstance = $modal.open(
      templateUrl: 'templates/modal.html',
    )