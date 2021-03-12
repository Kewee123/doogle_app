// Path : app/javascript/components/GreetUser.js
import React from "react";
import PropTypes from "prop-types";
import axios from 'axios'
import SearchIcon from "@material-ui/icons/Search";
import MicIcon from "@material-ui/icons/Mic";
import { Button } from "@material-ui/core";

class GreetUser extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      searchString: '',
      returnedData: '',
    };
    
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }
  
  handleChange(event) {
    this.setState({
      searchString: event.target.value
    });
  }
  
  handleSubmit = event => {
    console.log('A name was submitted: ' + this.state.searchString);
    event.preventDefault();
    const searchStr = this.state.searchString;
    const self = this;

    axios.get(`/api/words`, { params:{id: searchStr} })
      .then(res => {
        console.log(res.status);
        
        if(typeof res.data == 'object'){
          console.log(res.data[0]);
          self.setState({returnedData: res.data[0].content});
          console.log('hello');
        } else {
          self.setState({returnedData: res.data});
        }
    })
  }
  
  render () {
    console.log(this.state);
    return (
    <div className="home__body">
      <img
          src={"/assets/doogleImage.png"}
          alt="logo"
        />
      {this.state.returnedData ? <div> {this.state.returnedData} </div> : null} 
     <form className="search" onSubmit={this.handleSubmit}>
      <div className="search__input">
        <SearchIcon className="search__inputIcon" />
        <input type="text" value={this.state.searchString} onChange={this.handleChange}/>
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