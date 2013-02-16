ConfigurationBuilder cb = new ConfigurationBuilder();
cb.setOAuthConsumerKey("kIfpvh6JKJSI6MFcWECAg");
cb.setOAuthConsumerSecret("OW3TDRIvCq0V1on7tISw5Wdk8wBnDzg4C66FFegczo");
cb.setOAuthAccessToken("576083372-3wz9NiLNbEaJWWTgj2J3PI3tZkvCBYbn7GAP2ws8");
cb.setOAuthAccessTokenSecret("WQ5Uk19Ad1YQj6vLq2cXoDq6ZlnlNlFlDKNUhTbs");

Twitter twitter = new TwitterFactory(cb.build()).getInstance();
Query query = new Query("#fail");
query.setResultType("recent");
query.setCount(100);

Status status = null;

try {
  QueryResult result = twitter.search(query);
  println("Number of tweets: " + result.getTweets().size());
  status = result.getTweets().get(0);
  println("id: " + status.getId());
}
catch (TwitterException te) {
  println("Couldn't connect: " + te);
  stop();
};

  delay(5000);

  query.setSinceId(status.getId());
  
  try {
    QueryResult result = twitter.search(query);
    println("Number of tweets: " + result.getTweets().size());
    status = result.getTweets().get(0);
    println("id: " + status.getId());
  }
  catch (TwitterException te) {
    println("error " + te);
    stop();
  };

