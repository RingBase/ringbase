@RingBase.factory "Communicator", ($rootScope) ->
  service = {}
  service.calls = []

  # Connect to the broker with a WebSocket and wire up socket handlers
  #
  # agent_id - Number id of the logged-in agent attempting to connect
  #
  # Returns nothing
  service.connect = (agent_id) ->
    if service.conn?
      console.error("Already connected!")
      return

    conn = new WebSocket('ws://localhost:9000')
    $rootScope.brokerError = false

    conn.onopen = ->
      conn.send(JSON.stringify({ "agent_id": agent_id, "type": "login" }))
      service.connect_callback() if service.connect_callback?


    conn.onmessage = (socket_data) ->
      json = JSON.parse(socket_data.data)
      $rootScope.$broadcast("handle_#{json.type}", json.data)


    conn.onerror = (err) ->
      $rootScope.brokerError = true

    service.conn = conn


  service.on_connect = (fn) ->
    if service.conn.readyState != 1 # Not ready
      service.connect_callback = fn
    else
      fn()


  # Send a blob of data data to the Broker over WebSockets
  #
  # json - An arbitrary Object that will be serialized to a JSON string
  #
  # Returns nothing
  service.send = (json) ->
    service.conn.send(JSON.stringify(json))

  service
