This is a JSON dump of our database. 
To import execute:

_mongoimport --db=Restarate --collection=Marks --host=127.0.0.1 --file=Marks.json_

To export execute: 

_mongoexport --db Restarate --collection Marks --out Marks.json --host=127.0.0.1 --pretty_
