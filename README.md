csv-my-git
==========

Add csv diff capabilities to your local git configuration (on unix-style platforms like OSX or Linux).

Once installed, you'll get decent results diffing CSV files when you use `git diffcsv file.csv`.

Requirements
------------

git >= 1.7.12

Installation
------------

Just pop this into a terminal:

```
curl -L http://theodi.github.io/csv-my-git/install.sh | bash
```

You can now diff CSVs nicely using `git diffcsv`.

Try it out
----------

```
git clone https://github.com/theodi/test-data.git
cd test-data
git diffcsv 1ebfdfe184ca258c5c7b3336c58c0ae2e7403c55 data.csv
```

Compare to running standard `git diff` to see the difference it makes!

What's going on?
----------------

The script will drop the following into your ~/.config/git/attributes file:

```
*.csv	diff=csv
```

and the following into your ~/.gitconfig

```
[color]
	ui = true
[diff "csv"]
	wordRegex = [^,\n]+[,\n]|[,]
[alias]
  diffcsv = diff --word-diff
```

It shouldn't affect anything that's already there, unless you already have a CSV line in your gitattributes.

You can verify this behaviour by looking at the source for [install.sh](https://github.com/theodi/csv-my-git/blob/gh-pages/install.sh).
