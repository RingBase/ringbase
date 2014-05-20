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

    conn.onopen = ->
      conn.send(JSON.stringify({ "agent_id": agent_id, "type": "login" }))
      service.connect_callback() if service.connect_callback?


    conn.onmessage = (socket_data) ->
      json = JSON.parse(socket_data.data)
      $rootScope.$broadcast("handle_#{json.type}", json.data)


    conn.onerror = (err) ->
      # TODO: hack, not sure how to to best do this the Angular way
      errContainer = document.querySelector(".connection-error-container")
      if errContainer?
        errContainer.style.display = 'block'
      else
        console.log("no err container QS?")

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


  # Send a call transfer request to the broker
  #
  # agent_id - A Number agent id to transfer the call to
  # call - Object with keys
  #     'test' - test
  #
  # Returns nothing
  service.send_transfer_request = (agent_id, call_id) ->
    console.log "Entered Communicator#send_transfer_request, agent_id: #{agent_id}, call_id: #{call_id}"
    json = JSON.stringify({ type: "call_transfer_request", agent_id: agent_id, call_id: call_id })
    service.conn.send(json)

  service
