{h} = require 'preact'
css = require './Style.less'
cn = require 'classnames'
class SquareLoader
	render: (props)->
		h 'div',
			style:
				background: props.background
			className: cn css['loader'],!props.is_loading && css['loader-stop'],props.className

module.exports = SquareLoader