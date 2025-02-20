import React, { useState } from 'react';
import {} from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import RootStack from './src/navigation/RootStack';
import AuthStack from './src/navigation/AuthStack';


function App(): React.JSX.Element {
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  return (
    <NavigationContainer>
      {isAuthenticated ? <RootStack setIsAuthenticated={setIsAuthenticated} /> : <AuthStack setIsAuthenticated={setIsAuthenticated}/>}
    </NavigationContainer>
  );
}

export default App;

