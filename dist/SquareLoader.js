// Generated by CoffeeScript 2.5.0
(function() {
  var SquareLoader, cn, css;

  css = require('./Style.less');

  cn = require('classnames');

  SquareLoader = class SquareLoader extends Component {
    render() {
      return h('div', {
        className: cn(css['loader-wrapper'], this.props.center && css['absolute-center'])
      }, h('div', {
        style: {
          background: this.props.background,
          opacity: this.props.opacity != null ? this.props.opacity : void 0
        },
        className: cn(css['loader'], !this.props.is_loading && css['loader-stop'], this.props.className)
      }));
    }

  };

  module.exports = SquareLoader;

}).call(this);

//# sourceMappingURL=SquareLoader.js.map
