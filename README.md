# connect-cli

Command line tools for [Getty Images Connect API](https://github.com/gettyimages/connect) 3.0, that allows you to search images which provided by Getty Images.

## Create your API key

[Register](http://api.gettyimages.com/) a new Connect API account and receive your API key.

## Installation

The following is required.

 * curl
 * php
 * [jq](http://stedolan.github.io/jq/) - a lightweight and flexible cli JSON processor.

You can install jq via brew.

```
 $ brew install jq
```

Set up your API key in the `.env` file.

```
 $ cp dot.env .env
 $ vi .env
 API_KEY="YOUR API_KEY"
 SECRET="YOUR SECRET"
```

## Usage

run `search.sh` with search phrases.

```
 $ ./search.sh "alpaca" | head
 {
   "result_count": 73,
   "images": [
     {
       "id": "475400551",
       "asset_family": "Editorial",
       "caption": "NEW YORK, NY - FEBRUARY 27:  (EXCLUSIVE ACCESS, SPECIAL RATES APPLY) Natalie Suarez, blogger of natalieoffduty.com seen wearing an alpaca turtleneck sweater by Nanette Lepore Fall 2014, with her own J Brand jeans, Modern Vice shoes, Rachel Comey tote and vintage rings on the streets of midtown Manhattan following Mercedes-Benz Fashion Week Fall 2014 on February 27, 2014 in New York City.  (Photo by Daniel Zuchnik/Getty Images)",
       "collection_id": 58,
       "collection_name": "Getty Images Entertainment",
       "display_sizes": [
```

You can filter result using jq.

To retrieve `result_count`

```
 $ ./search.sh "alpaca" | jq '.result_count'
 73
```

To retrieve the first image's thumbnail url

```
 $ ./search.sh "alpaca" | jq '.images[0].display_sizes[0].uri'
 "http://cache4.asset-cache.net/xt/475400551.jpg?v=1&g=fs2|0|editorial196|00|551&s=1"
```

You can save all thumbnail url as html

```
 $ for img in `./search.sh "alpaca" | jq '.images[].display_sizes[0].uri'`
 do
   echo "<img src=${img}>";
 done > alpaca.html
```
