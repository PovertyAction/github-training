Commmon questions
=================

Amending a previous commit message
----------------------------------

*Nothing has been written.*

Dealing with merge conflicts
----------------------------

*Nothing has been written.*

Pushing/pulling problems
------------------------

*Nothing has been written.*

Expanding the size of a repository
----------------------------------

*Nothing has been written.*

Stashing changes
----------------

- You do not need to stash when you change branches and have uncommitted working directory changes. Error would occur if you have conflicts between branches.

Ignoring certain files (`.gitignore`)
-------------------------------------

### `.gitignore` for Stata projects

Blacklist vs. whitelist

Creating a GitHub repository from an existing Box/Dropbox folder
----------------------------------------------------------------

In the [GitHub User Guide](GitHub User Guide.md), we cover how to create a repo from scratch by simply copying files into a new repo. However, often you want to maintain your files on Box/Dropbox while also versioning them on GitHub. How to do this?

All Git repos contain a (hidden) subfolder named `.git` at their root (their topmost folder). Thus, the simplest solution to integrating with Box/Dropbox is to create a new repo outside Box/Dropbox (i.e., somewhere on your local computer), then copy the resulting `.git` folder into your existing set of files &mdash; put it where you want the root of the repository to be. Note that to do so, you must be able to view hidden files and folders. In Windows, modify your viewing settings in Explorer (the file navigator) by selecting the `Organize > Folder and search options` menu option, then selecting the `View` tab.

Alternatively &mdash; the previous option is usually superior to this &mdash; when creating your repo, you can create a new folder within Box/Dropbox. Then copy all files from your old/existing folder into this new folder (which contains the hidden `.git` folder), then delete the old folder, renaming the new folder with the name of the old folder. You should not be syncing when you do this, because Box/Dropbox do not always respond to rename operations gracefully.

GitExtensions
-------------

### Important: Avoiding GitExtensions deleting files in your repository

In rare cases, using GitExtensions can cause files in your repo to be unexpectedly deleted. The most likely cause of this is clicking the `Reset all changes` or `Reset unstaged changes` button in the commit window when you set your `.gitignore` to ignore all of the files in a given folder. For instance, if `*.dta` is specified in the `.gitignore`, and a folder in your repo contains only `.dta` files, these will be deleted if you click `Reset all changes`. There are several ways to guard against this problem:

- If you want to reset changes, right-click on individual files that you want to reset in the
commit window (which will remove all changes made to that file since its last commit). You can select multiple files at once: bulk resetting is OK, just don't click the `Reset all changes` button.
- Alternatively, you can ensure that at least 1 non-ignored file (say, an empty `.txt` file or a `.gitignore` or [`.gitkeep`](http://stackoverflow.com/questions/7229885/what-are-the-differences-between-gitignore-and-gitkeep) file) is in
every folder in your repo.
- Finally, you can simply not use a `.gitignore` file, or you can use a limited `.gitignore` that, for instance, does not ignore data files.
  - This is usually possible when the data is stored outside the repo &mdash; another reason to consider that data management model.

The easiest solution is to ***never click the `Reset all changes` button***. If your files are deleted, unfortunately there is no recourse through Git, and you will have to rely on recovering them using Box/Dropbox. While this situation will not occur if you follow the above instructions, it underscores the importance of always having a secondary backup of your files.

This appears to be an issue with GitExtensions rather than Git or GitHub. It seems that GitExtensions runs [`git clean -df`](http://git-scm.com/docs/git-clean) when you reset all changes. Of course, another option is to use another GUI, such as GitHub for Windows.

### I am unable to stage

[Check the index lock.](https://github.com/gitextensions/gitextensions/issues/2588)
