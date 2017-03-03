---
layout: default
title: Content guide
---

By default, your Pathagar instance is empty.

There are several ways to import data into Pathagar.


## From Internet Archive

_This method is a work in progress. If you encounter any issues, please [let us
know](https://github.com/PathagarBooks/pathagar/issues/new)._

You can register a new user at [archive.org](https://archive.org) and "favorite"
items you want to import to pathagar.

<img alt="Screenshot demonstrating how to favorite an item on archive.org"
src="{{ '/img/screenshot-internet-archive-favorite.png' | baseurl }}">

Next, we need to download all the book files from archive.org. From your pathagar directory:

    $ python manage.py fetch_ia_item --username your_username --out internet-archive-favorites.json

_Note: there seems to be a bug with the archive.org bookmarks feature when your
username contains spaces. If you get errors about the user not existing, you can
change your account username. We have reported this to the Internet Archive and
will update this information based on their response._

Once the files are downloaded to your machine, you need to import them into
Pathagar.

    $ python manage.py addbooks --json internet-archive-favorites.json

Once imported, the books should appear in your Pathagar instance.


## Add books

If you already have book files available with a JSON or CSV file describing the
book metadata, you can use the `addbooks` command to import them into Pathagar.

For CSV:

    $ python manage.py addbooks books.csv

Alternatively, for JSON:

    $ python manage.py addbooks --json books.json
