def dictionary
  dictionary_hash = {
    "hello" => "hi",
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&",
  }
end

def word_substituter(string)
  string_array = string.split(" ")
  string_array.each_with_index do |word, i|
    dictionary.each do |key, value|
      if word.downcase == key
        string_array[i] = value
      end
    end
  end
  return string_array.join(" ")
end

def bulk_tweet_shortener(tweets)
  tweets.each do |string|
    puts word_substituter(string)
  end
end

def selective_tweet_shortener(tweet)
  if tweet.length < 140
    return tweet
  else
    return word_substituter(tweet)
  end
end

def shortened_tweet_truncator(tweet)
  shortened_tweet = selective_tweet_shortener(tweet)
    if shortened_tweet.length > 140
      return "#{shortened_tweet.slice!(0...137)}..."
    else
      return tweet
    end
end
