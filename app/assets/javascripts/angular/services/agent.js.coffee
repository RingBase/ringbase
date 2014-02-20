@RingBase.factory 'Agent', ($http, $q) ->
  getCurrentAgent: ->
    deferred = $q.defer()
    $http.get('/current_agent.json')
      .success (data, status) ->
        deferred.resolve(data)
      .error (data, status) ->
        deferred.reject("An error occurred while trying to get user")

    deferred.promise

  getAllAgents: ->
    deferred = $q.defer()
    $http.get('/all_agents.json')
      .success (data, status) ->
        deferred.resolve(data)
      .error (data, status) ->
        deferred.reject("An error occurred while trying to get user")

    deferred.promise