
String recherche="#happy";
int timetowait= 2000;

void setup() {
  size(1200, 700);
  textFont(createFont("Georgia", 36));
  background(0);
  textSize(16);
}

void draw() {
  tweet();

  delay(500);
}

void tweet() {
  background(0); // Set background to black
  //textSize(16);

  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("kIfpvh6JKJSI6MFcWECAg");
  cb.setOAuthConsumerSecret("OW3TDRIvCq0V1on7tISw5Wdk8wBnDzg4C66FFegczo");
  cb.setOAuthAccessToken("576083372-3wz9NiLNbEaJWWTgj2J3PI3tZkvCBYbn7GAP2ws8");
  cb.setOAuthAccessTokenSecret("WQ5Uk19Ad1YQj6vLq2cXoDq6ZlnlNlFlDKNUhTbs");

  Twitter twitter = new TwitterFactory(cb.build()).getInstance();
  Query query = new Query(recherche);
  query.setResultType("recent");
  query.setCount(100);

  Status status = null;

  try {
    QueryResult result = twitter.search(query); //Search for a bunch of results to get a tweet ID for next search
    println("Number of tweets: " + result.getTweets().size());
    status = result.getTweets().get(49);
    println("id: " + status.getId());
    text("Tweets: " + result.getTweets().get(49).getText(), 50, 100); //trick: get(0) gives the last tweet and the code stops if there is no new tweet in the delay
    text("last tweet id: " + status.getId(), 50, 150);
  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
    stop();
  };

  delay(timetowait);

  query.setSinceId(status.getId()); // Search for more tweets since last tweet

  try {
    QueryResult result = twitter.search(query); 
    println("Number of tweets: " + result.getTweets().size());
    status = result.getTweets().get(0);
    println("id: " + status.getId());
    int resultat = result.getTweets().size()-49; // substract the result back to what it really is
    text("Nb of tweets tagged " + recherche + " in the past " + timetowait/1000 + "sec: " + resultat, 50, 50);
  }
  catch (TwitterException te) {
    println("error " + te);
    stop();
  };
}

