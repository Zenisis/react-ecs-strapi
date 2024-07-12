// src/App.js
import React from 'react';
import Articles from './Articles';
import './App.css';

const App = () => {
  return (
    <div className="App">
      <header className="App-header">
        <h1>My Strapi and React App</h1>
      </header>
      <main>
        <Articles />
      </main>
    </div>
  );
};

export default App;
