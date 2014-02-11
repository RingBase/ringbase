describe "RingBase controllers", ->
  beforeEach module("ringbase")
  
  scope = undefined
  beforeEach inject(($controller, $rootScope, Communicator) ->
    scope = $rootScope.$new()
    service = Communicator

    ctrl = $controller("PhoneCtrl",
      $scope: scope
      Communicator: service
    )
  )

  describe "PhoneCtrl", ->
    it "should pass", ->
      expect(true).toBeTruthy()

    it "should have an empty list of messages", ->
      expect(scope.messages.length).toBe 0

