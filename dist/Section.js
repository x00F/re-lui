// Generated by CoffeeScript 2.5.0
(function() {
  var Section, StyleContext, cn, css;

  css = require('./Style.less');

  cn = require('classnames');

  ({StyleContext} = require('./Style.coffee'));

  Section = class Section extends Component {
    render() {
      return h('div', {
        className: cn(css['section'], this.props.className),
        style: this.props.style
      }, h('h2', {
        className: css['section-title'],
        style: {
          opacity: 0.7,
          color: this.context.primary.color[2]
        }
      }, this.props.title, h('div', {
        className: css['section-title-bar'],
        style: {
          background: this.context.primary.inv[1]
        }
      })), this.props.children && h('div', {
        className: cn(css['section-content'], this.props.contentClassName)
      }, this.props.children));
    }

  };

  Section.contextType = StyleContext;

  module.exports = Section;

}).call(this);

//# sourceMappingURL=Section.js.map
