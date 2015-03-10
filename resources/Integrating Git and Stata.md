Integrating Git and Stata
=========================

The SSC program [`stgit`](https://github.com/matthew-white/stgit) retrieves information about a Git repository from within Stata, including the current branch and the SHA-1 hash of the current commit. In Stata 13, it uses the Java library [`JGit`](https://eclipse.org/jgit/) to return the status of the working directory, including whether there are any uncommitted changes. In Stata 13, see the help file for installation instructions.

One use of `stgit` is adding commit hashes to dataset notes and to exported results such as tables. This facilitates reproducible research, pinpointing the code that produced the files. When datasets and tables change unexpectedly, you know what the originating commits were, making it easier to determine the source of the change. It also helps you verify that a dataset of unknown origin is up-to-date. Combining this with a [data signature](http://www.stata.com/help.cgi?datasignature) means you no longer need to wonder how a dataset was made and whether it has been modified since.

If your working directory is within a Git repository, type the following in Stata to add the current commit as dataset notes:

```stata
stgit
notes _dta: Hash of current commit: `r(sha)'
```

In Stata 13, to also add whether the working directory is clean:

```stata
stgit
local clean = cond(r(is_clean), "", "not ") + "clean"
notes _dta: Hash of current commit: `r(sha)'
notes _dta: Working directory is `clean'.
```

However, you do not need to add even these few lines to your do-files, because the SSC program [`dtanotes`](https://github.com/PovertyAction/dtanotes) does it for you. `dtanotes` also adds other useful metadata as dataset notes, including the data signature.
