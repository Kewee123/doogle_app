// Path : app/javascript/components/GreetUser.js
import React from "react";
import PropTypes from "prop-types";
import axios from 'axios'
import SearchIcon from "@material-ui/icons/Search";
import MicIcon from "@material-ui/icons/Mic";
import { Button } from "@material-ui/core";
import './GreetUser.css'

class GreetUser extends React.Component {
  render () {
    return (
    <div className="home__body">
      <img
          src="/assets/doogleImage.png" 
          alt="logo"
        />
     <form className="search">
      <div className="search__input">
        <SearchIcon className="search__inputIcon" />
        <input />
      </div>

      <div className="search__buttons">
        <Button variant="outlined" type="submit">Doogle Search</Button>
      </div>
    </form>
    </div>
    );
  }
}

export default GreetUser;