Commmon issues and solutions

------------------

Amending a previous commit message

Dealing with merge conflicts

Pushing/Pulling problems

Wanting to expand the size of your repo

Stashing changes

-You don't need to stash when you change branches and have uncommitted working directory changes.
Error would occur if you have conflicts between branches.

Creating a GitHub repo with an existing Box/Dropbox folder
----------------------------------------------------------

We covered how to create a repo from scratch, by simply copying files into a new repo in
the [GitHUb User Guide](https://github.com/PovertyAction/github-training/blob/master/resources/GitHub%20User%20Guide.md).
However, often you might to maintain your files on Box/Dropbox while also versioning them on GitHub. How
to do this?

Git repos are defined by a particular folder contains a (hidden) .git folder. Thus the simplest solution
to integarting into Box/Dropbox is to create a new repo and then copy the resulting .git folder into
your existing set of files. To do this you'd have to modify your viewing settings (under the Organize > Folder
and Search Options > View tab in Windows) to view hidden files and folders.

Alternatively, when creating your repo you can create a new folder within Dropbox/Box. Then copy all files
from your existing folder into this new folder (which contains the hidden .git folder) and then rename it
to correspond with the original.

Important: Avoiding GitExtensions deleting files in your repository
--------------------------------------------------------------------

In rare cases using GitExtensions might cause files in your repo to be deleted. The most likely
cause of this is clicking the 'Reset all Changes' button in the commit window when you set your
.gitignore to ignore all of the files in a given folder. For instance, if .dta is specified
in the .gitignore and a folder in your repo contains only .dta files, these will be deleted
if you click 'Reset all Changes'. There are several ways to guard against this problem:

-If you want to reset changes, right click on individual files that you want to reset in the
commit window (which will remove all changes made to that file since its last commit)
-Alternatively you can ensure that at least 1 non-ignored file (say, an empty .txt file) is in
every folder in your repo
-Finally, you can simply not use a .gitignore file

The easiest solution is to **never click the 'Reset all Changes' button.** If your files are deleted,
unfortunately there is no recourse through git and you'd have to rely on recovering them through Box/Dropbox.
While this situation will not occur if you follow the above instructions, it underscores the importance
of always having a secondary backup of your files.

