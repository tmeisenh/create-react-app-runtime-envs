import React from 'react';
import logo from './logo.svg';
import './App.css';
import { Configuration } from './Configuration';

const App = () => {
  const config: String = JSON.stringify(Configuration, null, 2);
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>Env variables injected at runtime by docker!</p>
        <pre>{config}</pre>
      </header>
    </div>
  );
};

export default App;
