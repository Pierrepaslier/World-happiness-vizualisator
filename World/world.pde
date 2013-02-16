ConfigurationBuilder cb = new ConfigurationBuilder();
cb.setOAuthConsumerKey("kIfpvh6JKJSI6MFcWECAg");
cb.setOAuthConsumerSecret("OW3TDRIvCq0V1on7tISw5Wdk8wBnDzg4C66FFegczo");
cb.setOAuthAccessToken("17049577-576083372-19QmAjzlqkIszW406RVwedmuBpKmUV9atsphjv5J");
cb.setOAuthAccessTokenSecret("PBIOjN90PtTzdOJsj8Ci3kRcLkTSkIynrOmS6oMqCzA");

Twitter twitter = new TwitterFactory(cb.build()).getInstance();
Query query = new Query("#happy");
query.setCount(100);

try {
  QueryResult result = twitter.search(query);
  ArrayList tweets = (ArrayList) result.getTweets();

  for (int i = 0; i < tweets.size(); i++) {
    Tweet t = (Tweet) tweets.get(i);
    String user = t.getFromUser();
    String msg = t.getText();
    Date d = t.getCreatedAt();
    println("Tweet by " + user + " at " + d + ": " + msg);
  };
}
catch (TwitterException te) {
  println("Couldn't connect: " + te);
};
