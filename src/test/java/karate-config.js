function fn() {   
  var env = karate.env; // get java system property 'karate.env'
  karate.log('karate.env system property was:', env);

  if (!env) {
    env = 'qa'; // a custom 'intelligent' default
  }
  var config = { // base config JSON
    baseURL: 'https://gorest.co.in/',
    tokenID: '7f10507f02d715bacdb7439fe208f3f0456e471640c75f242cef64944811dc23'
  };

    if(env == 'qa'){
   config.baseURL = 'https://gorest.co.in/'
  }

  else if(env == 'dev'){
   config.baseURL = 'https://gorest.co.in/dev'
  }

  else{
   config.baseURL = 'https://gorest.co.in/default'
  }
  
  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  
  return config;
}
