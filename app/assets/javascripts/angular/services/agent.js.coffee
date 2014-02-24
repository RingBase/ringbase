@RingBase.factory 'Agent', ($http, $q) ->
  getAllAgents: ->
    deferred = $q.defer()
    $http.get('/users.json')
      .success (data, status) ->
        deferred.resolve(data)
      .error (data, status) ->
        deferred.reject("An error occurred while trying to get user")

    deferred.promise