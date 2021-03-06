import React from "react"
import PropTypes from "prop-types"
class SearchBar extends React.Component {
  render () {
    return (
      <React.Fragment>
        Greeting: {this.props.greeting}
      </React.Fragment>
    );
  }
}

SearchBar.propTypes = {
  greeting: PropTypes.string
};
export default SearchBar
