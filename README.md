# 
A CSS sheet containing all the programming language colour base on GitHub linguist(https://github.com/github/linguist), The colours are updated monthly.


Use CI/CD to monthly generate the colors

# <p style="text-align: center;" align="center"><img src="https://github.com/keyvaluedb/keyvaluedb.github.io/raw/master/icons/language-colors.png" alt="language-colors" style="width:180px;height:160px;" width="180" height="160" /><br />language-colors.css</p>

<span style="display:block;text-align:center">![GitHub repo size](https://img.shields.io/github/repo-size/keyvaluedb/language-colors)	![GitHub contributors](https://img.shields.io/github/contributors/keyvaluedb/language-colors) [![Twitter Follow](https://img.shields.io/twitter/follow/iamthecarisma?style=social)](https://twitter.com/iamthecarisma) [![Support on Patreon](https://img.shields.io/static/v1?label=Support%20on%20Patreon&message=$5&color=brightgreen)](https://www.patreon.com/join/thecarisma/checkout?rid=3556842)</span>

<p style="text-align: center;" align="center">A CSS and JavaScript Module containing all the programming language colour base on GitHub linguist (https://github.com/github/linguist)</p>

___

## Table of content
- [Installation](#installation)
- [Usage](#usage)
- [Legends](#legends)
- [API](#api)
	- [Creating/loading a document](#creating/loading-a-document)
	- [Inserting data](#inserting-data)
	- [Finding data](#finding-data)
	    - [Get KeyValue Object](#get-keyvalue-object)
	    - [Get Like KeyValue Object](#get-like-keyvalue-object)
	    - [Get](#get-like)
	    - [Get Like](#get-like)
	- [Updating data](#updating-data)
        - [Set](#set)
        - [Set KeyValue Object](#set-keyvalue-object)
	- [Inserting data](#inserting-data)
	- [Removing data](#removing-data)
	- [Size, Clear, isEmpty](#size,-clear,-isempty)
        - [Size](#size)
        - [Clear](#clear)
        - [isEmpty](#isempty)
    - [Saving collection](#saving-collection)
    - [Iterating collection](#iterating-collection)
- [Contributing](#contributing)
- [Support](#support)
- [License](#license)

## Installation

Module name on npm and bower is @thecarisma/key-value-db.

Using npm:

```bash
npm install @thecarisma/key-value-db
```

Using bower:

```bash
bower install @thecarisma/key-value-db
```

Using yarn:

```bash
yarn add @thecarisma/key-value-db
```

## Example

The following example load, update, read and remove a simple key value object 

```js
const KeyValueDB = require("@thecarisma/key-value-db");

//initialize the key-value 
var keyValueDB = new KeyValueDB.KeyValueDB("Greet=Hello World,Project=KeyValueDB", true, '=', ',', false);

//get an object
console.log(keyValueDB.get("Greet"));

//remove an object
keyValueDB.remove("Greet");

//add an object
keyValueDB.add("What", "i don't know what to write here");

//print all the objects
for (var kvo of keyValueDB) {
	console.log('$' + kvo);
};
```

## Contributing

Before you begin contribution please read the contribution guide at [CONTRIBUTING GUIDE](https://keyvaluedb.github.io/contributing.html)

You can open issue or file a request that only address problems in this implementation on this repo, if the issue address the concepts of the package then create an issue or rfc [here](https://github.com/keyvaluedb/keyvaluedb.github.io/)

## Support

You can support some of this community as they make big impact in getting people started with software development and open source.

- https://www.patreon.com/devcareer
- https://opencollective.com/osca

Or you can support me to continue making awesome open source projects > https://patreon.com/thecarisma. Thanks!🤗

**You can make big difference**.

## License

MIT License (2019) Adewale Azeez

