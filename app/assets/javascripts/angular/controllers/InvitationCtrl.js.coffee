@RingBase.controller "InvitationCtrl", ($scope, $rootScope, $window) ->
  $scope.emailAttrs = []
  $scope.organization = $window.current_organization
  $scope.submitUrl = '/organizations/' + $scope.organization.id + '/invitations'
  $scope.num = 1

  $scope.addInput = ->
    $scope.emailAttrs.push({ num: $scope.num++, email: '' })

  $scope.removeInput = (email) ->
    for attrs, idx in $scope.emailAttrs
      if attrs.email == email
        $scope.emailAttrs.splice(idx, 1)
        return


  $scope.addInput() # Add first field
