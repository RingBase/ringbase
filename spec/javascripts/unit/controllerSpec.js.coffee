describe "RingBase controllers", ->
  beforeEach module("ringbase")

  describe "PhoneCtrl", ->
    it "should have an empty list of messages", inject(($controller) ->
      scope = {}
      ctrl = $controller("PhoneCtrl",
        $scope: scope
      )
      expect(scope.messages.length).toBe 0
    )