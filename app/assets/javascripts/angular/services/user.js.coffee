@RingBase.factory 'User', ($http, $q) ->
  getUser: ->
    deferred = $q.defer()
    $http.get('/fetch_user.json')
      .success (data, status) ->
        deferred.resolve(data)
      .error (data, status) ->
        deferred.reject("An error occurred while trying to get user")

    deferred.promise