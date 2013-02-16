ConfigurationBuilder cb = new ConfigurationBuilder();
cb.setOAuthConsumerKey("kIfpvh6JKJSI6MFcWECAg");
cb.setOAuthConsumerSecret("OW3TDRIvCq0V1on7tISw5Wdk8wBnDzg4C66FFegczo");
cb.setOAuthAccessToken("17049577-576083372-19QmAjzlqkIszW406RVwedmuBpKmUV9atsphjv5J");
cb.setOAuthAccessTokenSecret("PBIOjN90PtTzdOJsj8Ci3kRcLkTSkIynrOmS6oMqCzA");

Twitter twitter = new TwitterFactory(cb.build()).getInstance();
Query query = new Query("#happy");
query.setCount(10);

try {
  QueryResult result = twitter.search(query);
  println("Tweet by " + result.getCount());
}
catch (TwitterException te) {
  println("Couldn't connect: " + te);
};

delay(5000);
