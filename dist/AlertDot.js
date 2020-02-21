// Generated by CoffeeScript 2.5.0
(function() {
  var AlertDot, StyleContext, cn, css;

  css = require('./Style.less');

  cn = require('classnames');

  ({StyleContext} = require('./Style.coffee'));

  AlertDot = class AlertDot extends Component {
    render() {
      var alert_style;
      alert_style = Object.assign({}, this.props.style);
      if (this.props.color) {
        alert_style.background = this.props.color;
      } else if (this.props.error) {
        alert_style.background = this.context.secondary.error;
      } else {
        alert_style.background = this.context.secondary.highlight;
      }
      return h('div', {
        className: css['alert-dot'],
        ref: (dot) => {
          return this.base = dot;
        },
        style: alert_style
      });
    }

  };

  AlertDot.contextType = StyleContext;

  module.exports = AlertDot;

}).call(this);

//# sourceMappingURL=AlertDot.js.map
