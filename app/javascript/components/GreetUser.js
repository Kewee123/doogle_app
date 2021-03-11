// Path : app/javascript/components/GreetUser.js
import React from "react";
import PropTypes from "prop-types";
import axios from 'axios'
import SearchIcon from "@material-ui/icons/Search";
import MicIcon from "@material-ui/icons/Mic";
import { Button } from "@material-ui/core";
//import '../assets/stylesheets/GreetUser.css';

class GreetUser extends React.Component {
  state = {
    name: '',
  }
  
  handleSubmit = event => {
    event.preventDefault();

    const user = {
      name: this.state.name
    };

    axios.post(`https://jsonplaceholder.typicode.com/users`, { user })
      .then(res => {
        console.log(res);
        console.log(res.data);
      })
  }

  
  render () {
    return (
    <div className="home__body">
      <img
          src="/assets/doogleImage.png" 
          alt="logo"
        />
     <form className="search" onSubmit={this.handleSubmit}>
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