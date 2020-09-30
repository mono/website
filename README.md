Mono Project Website [![Build Status](https://travis-ci.org/mono/website.svg)](https://travis-ci.org/mono/website)
==================================================================================================================

This repository contains the files used for generating the [Mono website](http://www.mono-project.com).

The site uses [Jekyll](http://jekyllrb.com), a static site generator. GitHub Pages, where the site is hosted, natively supports Jekyll so every time someone pushes to this repository, the website will be built and updated. For hosting it yourself, see [Setting up a local copy of the website](#setting-up-a-local-copy-of-the-website).

Contributing to the website
---------------------------

**Note:** Major issues or feature requests should be filed on the [issue tracker](https://github.com/mono/website/issues) first, so we can discuss the implications.

If you want to edit a page, the easiest way is to click the ![Edit page on GitHub](https://cloud.githubusercontent.com/assets/1376924/3712375/a6d7bc42-150f-11e4-9ceb-5230cbbfba3f.png) link under the page title on the website.

This will open the source file on GitHub where you can click the pencil button to start editing:
![Arrow to pencil](https://cloud.githubusercontent.com/assets/1376924/3712474/1d2fe57a-1517-11e4-86b2-d083dbeaa4ae.png)

GitHub's editor shows you both the [Markdown](https://guides.github.com/features/mastering-markdown/) source as well as a preview of the rendered page:
![Code editor](https://cloud.githubusercontent.com/assets/1376924/3769433/0f0ca2ee-18e1-11e4-97fc-3493683b853d.png)

After you've finished your changes, enter a proper summary and description and click the "Propose file change" button to open a pull request:
![Propose file change](https://cloud.githubusercontent.com/assets/1376924/3712481/52423448-1517-11e4-8aa8-9c9f9befb6bc.png)

Setting up a local copy of the website
--------------------------------------

For larger changes, using the web-based editor on GitHub is not really convenient. A better way is to setup a local copy of the website where you can experiment.

### Dependencies

 - [Ruby](https://www.ruby-lang.org/) - Jekyll is written in Ruby
 - [Bundler](http://bundler.io/) - a package manager for Ruby. Install it by running `gem install bundler`

After you've forked and cloned the repository, run the following commands:
 1. `bundle install` - downloads the required libraries
 2. `bundle exec jekyll serve` - builds the website and runs a local webserver on port 4000

**Note 1:** you can add the `--watch` option when running `jekyll serve` to let Jekyll watch for file changes, which means the site will be rebuilt when a file is modified.

**Note 2:** on case-insensitive file systems like on Windows and macOS you'll run into redirect loops for some URLs. The workaround is to disable redirects locally by removing the `gems: jekyll-redirect-from` entry from `_config.yml`.

The site should now be running locally:
![website](https://cloud.githubusercontent.com/assets/1376924/3712425/c1ab2e9c-1513-11e4-9df2-6e69d461c3cf.png)

Repository structure
--------------------

 - `_includes` - *special folder* contains snippets that can be included via `{% include file.html %}` in other pages
 - `_layouts` - *special folder* contains the layouts that are shared between pages. Layouts can be inherited, the root layout is `base.html`.
 - `_posts` - *special folder*, contains the source pages for the blog section, see [Writing a blog post](#writing-a-blog-post)
 - `_site` - the output of the generated site is stored here by default, this folder only exists after Jekyll built the site
 - `archived` - content that is no longer relevant but kept to keep external links working
 - `community` - contains the source pages for the `/community` website section
 - `css` - contains the main stylesheet
 - `docs` - contains the source pages for the `/docs` website section
 - `download` - contains the source pages for the `/download` website section
 - `files` - stores binary files used in pages
 - `images` - stores the images used in pages
 - `news` - lists the blog pages from the `_posts` directory

Writing a blog post
-------------------

Blogging is very easy with Jekyll. Browse to `_posts` directory, copy the Markdown file `_TEMPLATE.md` and rename that file following the file name convention: `YEAR-MONTH-DAY-title.md`. Then open the file you renamed and follow the steps there to complete writing a blog post.

Make sure to not include special characters in the file name. The blog entry's publishing date is automatically extracted from the file name.
