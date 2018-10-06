class Post {
  final Map metaData;
  final Map quotes;

  Post({this.metaData, this.quotes});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      metaData: json['Meta Data'],
      quotes: json['Time Series (Daily)']
    );
  }

  StockQuote getQuote(){

    Map quoteMap = quotes.values.toList()[0];
    return StockQuote.fromJson(quoteMap);
  }
}

class StockQuote {
  final String open;
  final String high;
  final String low;
  final String close;
  final String volume;


  StockQuote ({this.open, this.high, this.low, this.close, this.volume});

  factory StockQuote.fromJson(Map json) {
    return StockQuote (
      open: json['1. open'],
      high: json['2. high'],
      low: json['3. low'],
      close: json['4. close'],
      volume: json['5. volume']
    );
  }
}

