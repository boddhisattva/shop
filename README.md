## About

This is a program to meet Alice's shopping related requirements in order to organize a hackathon. Alice needs to shop for these items from the [Shopicruit store](http://shopicruit.myshopify.com/). This application is built using [this](https://help.shopify.com/api/reference) API reference. Please consider reading [this document](https://github.com/boddhisattva/shop/blob/master/rationale_behind_some_code_related_design_decisions.md) for the rationale behind some code related design decisions as part of this application

The checklist of her requirements include:

* An equal number of computers and keyboards.

* As many different computer and keyboard variants the store has to offer, while buying no duplicate variants.

* Spend the least amount of money possible.

* Alice needs to know the total weight of all computers and keyboards so she can plan for enough volunteers to help carry it all.

## Usage

### Dependencies
* Ruby 2.3.0

### Running the program
* One can run the program to generate Alice's shopping list with the command `ruby bin/main.rb` from the project's root directory.

### Running the tests
* One can run the specs from the project's root directory with the command `rspec .`

## Program Output

* Below is the list of items(also the program output) that could be purchased from Shopicruit based on Alice's requirements

```
Items purchased -

1. Aerodynamic Cotton Keyboard Blue
2. Ergonomic Cotton Computer Lime
3. Heavy Duty Concrete Keyboard Magenta
4. Awesome Cotton Computer Black
5. Incredible Bronze Keyboard Sky blue
6. Awesome Cotton Computer Orange
7. Incredible Bronze Keyboard White
8. Ergonomic Copper Computer Black
9. Incredible Silk Keyboard Orchid
10. Awesome Cotton Computer Gold
11. Incredible Bronze Keyboard Plum
12. Awesome Cotton Computer Orchid
13. Incredible Silk Keyboard Lime
14. Rustic Wool Computer Gold
15. Incredible Silk Keyboard Orange
16. Ergonomic Copper Computer Red
17. Incredible Bronze Keyboard Green
18. Awesome Bronze Computer Maroon
19. Incredible Bronze Keyboard Grey
20. Ergonomic Cotton Computer Magenta

Total cost of items - $533.5

Total weight of products - 85989 grams
```
