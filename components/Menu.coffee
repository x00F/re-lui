{h,render,Component} = require 'preact'
css = require './Style.less'
Bar = require './Bar.coffee'
Color = require 'color'
Overlay = require './Overlay.coffee'

class Menu extends Component
	constructor: (props)->
		super(props)
		@state=
			width: 0
			height: 0
			tab_branch: []
			backdrop_color: props.backdrop_color || '#000'
		@state.backdrop_opaque_color = Color(@state.backdrop_color).alpha(.9).string()

	getChildContext: =>
		onContextTabReveal: @onContextTabReveal
		backdrop_color: @props.backdrop_color || @state.backdrop_color
		backdrop_opaque_color: @props.backdrop_opaque_color || @state.backdrop_opaque_color
		clearTabBranch: @clearTabBranch
		onClickBackdrop: @props.onClickBackdrop
		tab_branch: @state.tab_branch
		alternate: @props.alternate
		selectedTabClassName: @props.selectedTabClassName
		vert: @props.vert
		render_unrevealed_children: @props.render_unrevealed_children || false
		bounding_box: @props.bounding_box
		big: @props.big
		hover_reveal_enabled: @props.hover_reveal_enabled
		click_reveal_enabled: @props.click_reveal_enabled
		level: 0
		split_x: @props.split_x
		split_y: @props.split_y
		bar_dir_x: @props.bar_dir_x
		bar_dir_y: @props.bar_dir_y
		force_split_x: @props.force_split_x
		force_split_y: @props.force_split_y
		

	componentWillUpdate: (props)->
		if props.backdrop_color != @props.backdrop_color
			@state.backdrop_opaque_color = @state.Color(@state.backdrop_color).alpha(.9).string()


	componentDidUpdate: ->	
		# log @state.reveal	
		if @state.width != @base.clientWidth || @state.height != @base.clientHeight || @props.x < @state.force_split_left_x || @props.y < @state.force_split_top_y
			if @props.x < @state.force_split_left_x
				@state.force_split_left = false
				@state.force_split_left_x = 0
			
			if @props.y < @state.force_split_top_y
				@state.force_split_top = false
				@state.force_split_top_y = 0
			
			@state.width = @base.clientWidth
			@state.height = @base.clientHeight
		
		@state.reveal = undefined
		

	componentDidMount: =>
		@forceUpdate()


	onClickBackdrop: (e)=>
		@clearTabBranch(e)
		@props.onClickBackdrop?(e)


	clearTabBranch: (e)=>
		@state.tab_branch.length = 0
		@setState()


	onContextTabReveal: (tab_branch,e)=>
		@setState
			tab_branch: tab_branch


	render: (props)->

		bar_style = {}

		if props.fixed
			bar_style.left = props.left
			bar_style.top = props.top
			bar_style.position = 'fixed'
		if props.style
			Object.assign bar_style,props.style
		
		h Bar,
			vert: props.vert
			big: props.big
			style: bar_style
			className: props.className
			props.children
			# backdrop

		
Menu.defaultProps = 
	x: 0
	y: 0
	split_x: 1
	# force_split_x: 0
	# force_split_y: 0
	split_y: 1
	bar_dir_x: 1
	bar_dir_y: 1
	bounding_box: {x:0,y:0,width:Infinity,height:Infinity}
	show_backdrop: undefined

module.exports = Menu