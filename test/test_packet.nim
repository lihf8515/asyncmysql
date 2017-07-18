#    AsyncMysql - Asynchronous MySQL connector written in pure Nim
#        (c) Copyright 2017 Wang Tong
#
#    See the file "LICENSE", included in this distribution, for
#    details about the copyright.

import unittest, asyncmysql, asyncdispatch, asyncnet, strutils

const 
  MysqlHost = "127.0.0.1"
  MysqlPort = Port(3306)
  MysqlUser = "mysql"
  MysqlPassword = "123456"

proc waitFor1(fut: Future[void]) =
  proc check() {.async.} =
    try:
      await fut
    except:
      echo "  !!!FutureError: ", getCurrentExceptionMsg() 
  waitFor check()

suite "Handshake Authentication With Valid User":
  var socket = newAsyncSocket(buffered = false) 
  var handshakePacket: HandshakePacket
  waitFor connect(socket, MysqlHost, MysqlPort)

  test "recv handshake initialization packet with 1024 bytes buffer":
    proc recvHandshakeInitialization() {.async.} =
      var parser = initPacketParser() 
      while true:
        var buf = await recv(socket, 1024)
        parse(parser, handshakePacket, buf)
        if parser.finished:
          echo "  Buffer length: 1024, offset: ", parser.offset 
          echo "  Handshake Initialization Packet: ", handshakePacket
          check handshakePacket.sequenceId == 0
          break
    waitFor1 recvHandshakeInitialization()  

  test "send client authentication packet with valid user":
    proc sendClientAuthentication() {.async.} =
      await send(
        socket, 
        toPacketHex(
          ClientAuthenticationPacket(
            sequenceId: handshakePacket.sequenceId + 1, 
            capabilities: 521167,
            maxPacketSize: 0,
            charset: 33,
            user: MysqlUser,
            scrambleBuff: handshakePacket.scrambleBuff,
            database: "mysql",
            protocol41: handshakePacket.protocol41), 
        MysqlPassword))
    waitFor1 sendClientAuthentication()  

  test "recv generic ok packet":
    proc recvGenericOk() {.async.} =
      var parser = initPacketParser() 
      var packet: GenericPacket
      while true:
        var buf = await recv(socket, 32)
        write(stdout, "  OK Packet: ")
        check toProtocolInt(buf[3] & "") == parser.sequenceId + 2
        check toProtocolInt(buf[4] & "") == 0
        for c in buf:
          write(stdout, toHex(ord(c), 2), ' ')
        write(stdout, '\L')
        parse(parser, packet, handshakePacket, buf)
        if parser.finished:
          echo "  Buffer length: 32, offset: ", parser.offset 
          echo "  Generic Ok Packet: ", packet
          check parser.sequenceId == 2
          break
    waitFor1 recvGenericOk()  

suite "Handshake Authentication With Invalid User":
  var socket = newAsyncSocket(buffered = false) 
  var handshakePacket: HandshakePacket
  waitFor connect(socket, MysqlHost, MysqlPort)

  test "recv handshake initialization packet with 3 bytes buffer":
    proc recvHandshakeInitialization() {.async.} =
      var parser = initPacketParser() 
      while true:
        var buf = await recv(socket, 3)
        parse(parser, handshakePacket, buf)
        if parser.finished:
          echo "  Buffer length: 3, offset: ", parser.offset 
          echo "  Handshake Initialization Packet: ", handshakePacket
          check handshakePacket.sequenceId == 0
          break
    waitFor1 recvHandshakeInitialization()  

  test "send client authentication packet with invalid user":
    proc sendClientAuthentication() {.async.} =
      await send(
        socket, 
        toPacketHex(
          ClientAuthenticationPacket(
            sequenceId: handshakePacket.sequenceId + 1, 
            capabilities: 521167,
            maxPacketSize: 0,
            charset: 33,
            user: "user_name",
            scrambleBuff: handshakePacket.scrambleBuff,
            database: "mysql",
            protocol41: handshakePacket.protocol41), 
        MysqlPassword))
    waitFor1 sendClientAuthentication()

  test "recv generic error packet":
    proc recvGenericError() {.async.} =
      var parser = initPacketParser() 
      var packet: GenericPacket
      while true:
        var buf = await recv(socket, 16)
        write(stdout, "  Error Packet: ")
        for c in buf:
          write(stdout, toHex(ord(c), 2), ' ')
        write(stdout, '\L')
        parse(parser, packet, handshakePacket, buf)
        if parser.finished:
          echo "  Buffer length: 16, offset: ", parser.offset 
          echo "  Generic Error Packet: ", packet
          check parser.sequenceId == 2
          break
    waitFor1 recvGenericError()  