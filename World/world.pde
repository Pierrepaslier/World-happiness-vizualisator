ConfigurationBuilder cb = new ConfigurationBuilder();
cb.setOAuthConsumerKey("kIfpvh6JKJSI6MFcWECAg");
cb.setOAuthConsumerSecret("OW3TDRIvCq0V1on7tISw5Wdk8wBnDzg4C66FFegczo");
cb.setOAuthAccessToken("576083372-3wz9NiLNbEaJWWTgj2J3PI3tZkvCBYbn7GAP2ws8");
cb.setOAuthAccessTokenSecret("WQ5Uk19Ad1YQj6vLq2cXoDq6ZlnlNlFlDKNUhTbs");

Twitter twitter = new TwitterFactory(cb.build()).getInstance();
Query query = new Query("#happy");
query.setCount(10);

try {
  QueryResult result = twitter.search(query);
  println("Number of tweets: " + result.getCount());
}
catch (TwitterException te) {
  println("Couldn't connect: " + te);
};

delay(5000);
