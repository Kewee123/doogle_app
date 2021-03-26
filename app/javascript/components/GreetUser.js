// Path : app/javascript/components/GreetUser.js
import React from "react";
import PropTypes from "prop-types";
import axios from 'axios'
import SearchIcon from "@material-ui/icons/Search";
import MicIcon from "@material-ui/icons/Mic";
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemText from '@material-ui/core/ListItemText';
import { Button } from "@material-ui/core";

class GreetUser extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      searchString: '',
      returnedData: '',
      type: '',
    };
    
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.parseResponse = this.parseResponse.bind(this);
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
    const parseResponse = this.parseResponse;

    axios.get(`/api/words`, { params:{id: searchStr} })
      .then(res => {
        console.log(res.status);
        console.log(res);
        console.log("the above is the response\n");
        
        if(typeof res.data == 'object'){
          let parsedData = res.data[0].content.split(",")
          
          self.setState({returnedData:parsedData, type: 'array'});
          console.log('hello');
          parseResponse();
        } else {
          self.setState({returnedData: res.data, type: 'string'});
        }
    }).catch(err =>{
      console.log("error is " + err);
    })
  }
  
  parseResponse(){
    let definitions = this.state.returnedData;
    const regex = /[\[\]]/g;
    
    definitions.forEach((item, index)=>{
      item = item.replace(regex, "");
      definitions[index] = item;
    })
   
    this.setState({returnedData: definitions});
  }
  
  render () {
    console.log(this.state);
    
    var results = null;
    
    if(this.state.returnedData) {
      if(this.state.type == 'array'){
        results = this.state.returnedData.map(item => {
          console.log(item);
          return(
          <ListItem key={item}> 
            <ListItemText primary={item}/>
          </ListItem>);
        })
        
        results = <List>{results}</List>
        console.log(results);
        console.log('here');
      } else {
        results = <div className="success">{this.state.returnedData}</div>
      }
    }     
    
    return (
    <div className="home__body">
      <img
          src={"/assets/doogleImage.png"}
          alt="logo"
        />
      {results} 
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