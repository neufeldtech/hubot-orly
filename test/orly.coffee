expect = require('chai').expect

Helper = require('hubot-test-helper')
helper = new Helper('../scripts/orly.coffee')

describe 'Generic Adapter', ->
  beforeEach ->
    @room = helper.createRoom(httpd: false)

  describe 'Orly command', ->
    it 'should return correct url', ->
      @room.user.say('jordan.neufeld', '@hubot orly title; guide text ; top text ; author').then =>
        expect(@room.messages[1][1]).to.match(/^https:\/\/orly\-appstore\.herokuapp\.com\/generate\?title=title&guide_text=guide%20text&top_text=top%20text&author=author&image_code=\d+&theme=\d+$/)

describe 'Hipchat adapter', ->
  beforeEach ->
    @room = helper.createRoom(httpd: false)
    @room.robot.adapterName = "hipchat"
  
  describe 'Orly command', ->
    it 'should return correct url with .png suffix', ->
      @room.user.say('jordan.neufeld', '@hubot orly title; guide text ; top text ; author').then =>
        expect(@room.messages[1][1]).to.match(/^https:\/\/orly\-appstore\.herokuapp\.com\/generate\?title=title&guide_text=guide%20text&top_text=top%20text&author=author&image_code=\d+&theme=\d+\&\.png$/)
