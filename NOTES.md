# Review

## Startup

I was able to install and get things up and running.  Yay.
Also, credentials for Google::ApiClient were not provided.  This is correct.
Good.

## Tests

I ran your tests immediately after and you had a failure.  This is not
acceptable for master.   master is always shippable.  Imagine a critical bug is
found.  Theoretically we should be able to branch master, add the bugfix, and
then ship that release to our customers *without breaking what's already
there*.

When I look at the test that's broken....it appears you removed the validation
and kept the test.

Specifically it looks like:

commit 3a10762538c60c64e2c91459f42a2b51c529d7a3
Author: edwin kim & Matt <pair+emoney86.mrweckel@devbootcamp.com>
Date:   Sun Nov 23 23:38:28 2014 -0500

    add user authentication and validation

Removed the validation and then did it in a commit which says that they added
user authentication and validation.

This is sloppiness.  ILUVU and all but seriously, this is not OK.  If you're
going to remove validation from one of your core models, please do it in a
commit that says you're doing that and why you're doing it.  You make baby
pandas sad when you have commits that don't match reality.

Furthermore you *also* do a bunch of JavaScript work in that commit.  :(

## Git

Your git strategy looks (generally) really nice.  Good job.

| | * | c371a10 create model specs
| | * | fc256bc add spec models
| | * | ad5b999 add validation to models
| | * | 4ba1a17 add factories
| | * | 8fecec8 install rspec
| | * | afa111b add rspec gems to gemfile
| |/ /
| * |   c003f01 Merge pull request #2 from ospreys-2014/add_models-migrations
| |\ \
| * \ \   8c48b13 Merge pull request #1 from ospreys-2014/add_models-migrations
| |\ \ \
* | \ \ \   25db841 Merge branch 'bootstrap'
|\ \ \ \ \
| |/ / / /
|/| | | |
| * | | | 21d3e7c spacing and partial for top pitches
| * | | | 4cd6141 New comments linking to pitch
| * | | | eeb60d8 Linked comments to pitches

## Controllers

Generally, really, really nice.  A few small things, but really solid.  Good
job.

## Models

Why app/models/concerns/comment.rb and app/models/comment.rb ?  One should not
be there.

Really minimalist, so, not much to say.  So, that's probably a good thing.

## Views

* Mind your indentation. It's for reals a big deal in the Real World.
* Nice use of partials
* Nice use of Rails helpers
* Generally pretty pleased until...wait...what's that

OK, no, fists of fury suprfly TNT what  is this?

    app/views/_top_pitches.html.erb

