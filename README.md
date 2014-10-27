# Post Clerk

A postal service is delivers based on weight only. Like most post services in Europe will.

This extension adds a office_clerk/shipping_method model to do this.

**Features:**

- Weight restrictions can be specified.
- You specify a weight/price table.
- Handling fee may be added ( with a maximum when it won't be applied anymore).
- Multi-parcel shipments are automatically created.
- You can specify a maximum order price, orders over this will not be charged.

Off course this relies on your weight data to be correct. Use the same measurements as in the product info page consistantly (either gram or kilogram).

## Usage

Add to your `Gemfile`:
```ruby
gem 'post_clerk', github: 'ruby_clerks_/post_clerk'
```

Add a config/locale/config.yml with the data for the calculator (s)


---

## Example

With the default settings (measurements in kg and cm):

- Max weight of one item: 18
- Max width of one item: 60
- Max length of one item: 90
- Default weight: 1kg (applies when product weight is 0)
- Handling fee: 10
- Amount, over which handling fee won't be applied: 50
- Max total of the order: 120.0
- Weights (space separated): 1 2 5 10 20
- Prices (space separated):  6 9 12 15 18

## Applies?

The Shipping method does not apply to the order if:

- Any items weighs more than 18 kg.
- Any item is longer than 90 cm.
- Any items second longest side (width) is over 60 cm. Eg a 70x70x20 item.

## Costs

- Items weighing 10 kg of worth 100 Euros will cost 15 Euros.
- Items weighing 10 kg of worth 40 Euros will cost 25 Euros (15 + 10 handling).
- Items weighing less than 1 kg of worth 60 Euros will cost 6 Euros.
- Items weighing less than 1 kg of worth 40 Euros will cost 16 Euros (6 + 10).
- Items weighing 25 kg of worth 200 Euros will cost 30 Euros (2 packages, 18 + 12 Euro).
- 3 items without weight information of worth 100 euros will cost 12 Euro.
- Any amount of items costing more than the max_price will cost 0 Euro.

---

## Contributing

See corresponding [contributing guidelines][1].

---

## License

Copyright (c) 2011-2014 [Torsten Rüger][2], [Tobias Bohwalli][3] and other [contributors][4], released under the [New BSD License][5].

[1]: https://github.com/futhr/post_clerk/blob/master/CONTRIBUTING.md
[2]: https://github.com/dancinglightning
[3]: https://github.com/futhr
[4]: https://github.com/futhr/post_clerk/graphs/contributors
[5]: https://github.com/futhr/post_clerk/blob/master/LICENSE.md
