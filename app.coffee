#LOTTIE

{LottieLayer} = require 'LottieLayer'

heartAnimA = new LottieLayer
	name: "heartAnim"
# 	y: 0 - btn_Beach.height /4
	width: LottieAreaA.width
# 	height: loadingItem.height
	path: "HeartA1.5.json"
	autoplay: false
	loop: false
	speed: 1
	direction: 1
heartAnimA.parent = LottieAreaA

heartAnimD = new LottieLayer
	name: "heartAnim2"
# 	y: 0 - btn_Beach.height /4
	width: LottieAreaD.width
# 	height: loadingItem.height
	path: "HeartA1.5.json"
	autoplay: false
	loop: false
	speed: 1
	direction: 1
heartAnimD.parent = LottieAreaD

flow = new FlowComponent
# flow.parent = Results
flow.showNext Results,
	scroll: no
# flow.footer = Footer
# flow.header = Header

# print flow.current

faveBubble.scale = 0
heartActiveA = false
heartActiveD = false

scrollList = ScrollComponent.wrap(scrollItem)
scrollList.scrollHorizontal = false
scrollList.contentInset =
	top: 0
	right: 0
	bottom: 68
	left: 0

scrollItem.onPanUp (event, layer) ->
	btn_Pils.animate
		y: 52
		options: 
			time: 0.5
scrollItem.onPanDown (event, layer) ->
	btn_Pils.animate
		y: 0
		options: 
			time: 0.5

#INPUT
LottieAreaA.onTap (event, layer) ->
	if heartActiveA is false
		heartActiveA = true
		heartAnimA.path = "HeartA1.6.json"
		heartAnimA.play()
		addBubble()
# 		faveBubble.animate
# 			scale: 1
# 			options: 
# 				time: 0.25
# 				delay: 0.5
		heartBubbleA.animate
			width: 156
			options: 
				delay: 0.5
				time: 0.5
		text_FaveA.animate
			opacity: 1
			options:
				delay: 0.5
		Utils.delay 5, ->
			heartBubbleA.animate
				width: 36
				options: 
					time: 0.5
			text_FaveA.animate
				opacity: 0
				options: 
					time: 0.25
	else
		heartActiveA = false
		heartAnimA.path = "HeartB2.json"
		heartAnimA.play()
		subtractBubble()
# 		faveBubble.animate
# 			scale: 0
# 			options: 
# 				time: 0.25
		heartBubbleA.animate
			width: 36
			options: 
				time: 0.5
		text_FaveA.animate
			opacity: 0
			options: 
				time: 0.25
				
LottieAreaD.onTap (event, layer) ->
	if heartActiveD is false
		heartActiveD = true
		heartAnimD.path = "HeartA1.6.json"
		heartAnimD.play()
		addBubble()
# 		faveBubble.animate
# 			scale: 1
# 			options: 
# 				time: 0.25
# 				delay: 0.5
		heartBubbleD.animate
			width: 156
			options: 
				delay: 0.5
				time: 0.5
		text_FaveD.animate
			opacity: 1
			options:
				delay: 0.5
		Utils.delay 5, ->
			heartBubbleD.animate
				width: 36
				options: 
					time: 0.5
			text_FaveD.animate
				opacity: 0
				options: 
					time: 0.25
	else
		heartActiveD = false
		heartAnimD.path = "HeartB2.json"
		heartAnimD.play()
		subtractBubble()
# 		faveBubble.animate
# 			scale: 0
# 			options: 
# 				time: 0.25
		heartBubbleD.animate
			width: 36
			options: 
				time: 0.5
		text_FaveD.animate
			opacity: 0
			options: 
				time: 0.25

addBubble = ->
	if heartActiveA is true and heartActiveD is true
# 		print "oh"
		string_Bubble.text = "2"
	else
# 		print "hm"
		faveBubble.animate
			scale: 1
			options: 
				time: 0.25
				delay: 0.5
subtractBubble = ->
	if heartActiveA is false and heartActiveD is false
		faveBubble.animate
			scale: 0
			options: 
				time: 0.25
	else
		string_Bubble.text = "1"

btn_Fave.onTap (event,layer) ->
	flow.showNext(Favourites, animate:false)
btn_Search.onTap (event,layer) ->
	flow.showPrevious(animate:false)

lowPrice1.textDecoration = "line-through"
lowPrice2.textDecoration = "line-through"
lowPrice3.textDecoration = "line-through"
lowPrice4.textDecoration = "line-through"

# print Framer.Device.screen.width
# print Framer.Device.contentScale