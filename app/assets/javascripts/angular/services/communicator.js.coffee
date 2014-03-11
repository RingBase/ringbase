@RingBase.factory "Communicator", ->
  service = {}

  # Connect to the broker with a WebSocket and wire up socket handlers
  #
  # agent_id - Number id of the logged-in agent attempting to connect
  # callback - (optional) Function to be invoked when connection is complete
  #
  # Returns nothing
  service.connect = (agent_id, callback=null) ->
    if service.conn?
      console.error("Already connected!")
      return

    conn = new WebSocket('ws://localhost:9000')

    conn.onopen = ->
      conn.send(JSON.stringify({ "agent_id": agent_id, "type": "login" }))
      callback() if callback?

    conn.onmessage = (json) ->
      data = JSON.parse(json.data)
      service.callback(data) if service.callback?

    conn.onerror = (err) -> # TODO: errback?

    service.conn = conn


  # Send a blob of data data to the Broker over WebSockets
  #
  # json - An arbitrary Object that will be serialized to a JSON string
  #
  # Returns nothing
  #
  # TODO: can we tag json with current agent id here? How to access?
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


  # Define a handler function to be invoked with any JSON received from the broker
  #
  # callback - Function callback to be invoked
  #
  # Returns nothing
  service.subscribe = (callback) ->
    service.callback = callback

  service
