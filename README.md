# README

This application is deployed to [http://161.35.147.106](http://161.35.147.106) with Docker using [Kamal](https://kamal-deploy.org).

## Technology Stack

- [Ruby](https://www.ruby-lang.org/) (3.2.2)
- [Ruby on Rails](https://rubyonrails.org) (7.1.1)
- [Tailwind CSS](https://tailwindcss.com)
- [ViewComponent](https://viewcomponent.org)

## PunkApi

The folder `lib/punk_api` contains an abstraction of the [Punk API](https://punkapi.com/documentation/v2) (v2). This code could later be extracted to a separate gem.

```ruby
# Examples

PunkApi::Beer.all                 # The first 10 beers
PunkApi::Beer.all(page: 2)        # The following 10 beers
PunkApi::Beer.all(name: 'Berlin') # Beers with name matching "Berlin".
PunkApi::Beer.find(1)             # Beer with id 1
PunkApi::Beer.find(1000)          # Raises PunkApi::NotFound
```

## Search and Pagination

Navigating to a new page via "Next", "Previous" or entering text in the search field only updates a specific section within the `<body>` thanks to [Turbo Frames](https://turbo.hotwired.dev/handbook/frames). Navigating to an individual beer from the list only updates the `<body>` thanks to [Turbo Drive](https://turbo.hotwired.dev/handbook/drive).

The search is implemented, via a [Stimulus](https://stimulus.hotwired.dev/handbook/origin) controller, with a 200 ms debounce to limit form submissions.

## Getting Started

To run the application locally, follow these steps:

1. Clone the repository: `git clone https://github.com/marcusahlford/beer-app.git`
2. Install dependencies: `bundle`
3. Start the server: `./bin/dev`
4. Open your web browser and go to [http://localhost:3000](http://localhost:3000)

## Testing

To test the application, run `bin/rails test`. If you also want to include system tests, run `bin/rails test:all`.
In order to not hit the Punk API repeatedly during testing, [VCR](https://github.com/vcr/vcr) is used.
