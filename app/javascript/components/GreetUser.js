// Path : app/javascript/components/GreetUser.js
import React from "react";
import PropTypes from "prop-types";
import axios from 'axios'
import SearchIcon from "@material-ui/icons/Search";
import MicIcon from "@material-ui/icons/Mic";
import { Button } from "@material-ui/core";

class GreetUser extends React.Component {
  render () {
    return (
     <form className="search">
      <div className="search__input">
        <SearchIcon className="search__inputIcon" />
        <input />
        <MicIcon />
      </div>

      <div className="search__buttons">
        <Button variant="outlined" type="submit">Google Search</Button>
        <Button variant="outlined">I'm Feeling Lucky</Button>
      </div>
    </form>
    );
  }
}

export default GreetUser;