GitHub for code checks
======================

This guide will summarize how to use GitHub as a tool to implement code checks. If you have questions about this guide or suggestions for improvements, e-mail IPA Research Support at researchsupport@poverty-action.org or [submit an issue](https://github.com/PovertyAction/github-training/issues/) to this GitHub training repository.

A quick primer on the main components of the guide:

- *GitHub* is a version control system that greatly facilitates collaborative code writing and reproducibility. This guide will discuss various aspects of GitHub, but see [here](GitHub User Guide.md) for a more general introduction.

- *Code checks* broadly encapsulate the process whereby the original code author's work is reviewed by one or more colleagues. The purpose is to catch errors and/or make improvements to the code.

How can you use GitHub to facilitate code checks? For the purposes of this guide, assume you have been given the task of checking and giving feedback on a collection of code files on GitHub.

Getting started
---------------

The code checker needs read/write access to the given repository. See more on GitHub permissions [here](https://help.github.com/articles/permission-levels-for-an-organization-repository/).

Communication
-------------

As a code checker, mostly you are reading code and noting questions or potential problems &mdash; not writing code yourself. This section discusses how the code checker can communicate most effectively with the code author.

### Issues

Utilize the fantastic *GitHub issues* tracker. In short, start an issue if there is an important or relatively broad question that you want to raise with the code author. Examples:

1. A file is missing.
2. There is a systematic error across files.
3. You do not understand how a particular do-file handles missing values.

Issues can comprise simply text. They can also be formatted: issues are written in [Markdown](External resources.md#markdown). This means that it is possible to link to specific files. For example, this Markdown links to the `github-training` repository's README.md:

```
Click [here](https://github.com/PovertyAction/github-training/blob/master/README.md) to see the readme.
```

*Formatted result:*

Click [here](https://github.com/PovertyAction/github-training/blob/master/README.md) to see the readme.

You can also link to specific lines of files:

```
Click [here](https://github.com/PovertyAction/github-training/blob/master/resources/do/cfout.do#L38) to view the 38th line of `cfout.do`.
```

*Result:*

Click [here](https://github.com/PovertyAction/github-training/blob/master/resources/do/cfout.do#L38) to view the 38th line of `cfout.do`.

You can link to a range of lines:

```
Click [here](https://github.com/PovertyAction/github-training/blob/master/resources/do/cfout.do#L38-58) to view lines 38-58 of `cfout.do`.
```

*Result:*

Click [here](https://github.com/PovertyAction/github-training/blob/master/resources/do/cfout.do#L38-58) to view lines 38-58 of `cfout.do`.

Each of these links link to the current version of the file. To make sure that it links to the specific version you are viewing, you will need to use a [permanent link](https://help.github.com/articles/getting-permanent-links-to-files/). To obtain this, press `y` when viewing the file in a Web browser. This is especially important when linking to file lines: there is no guarantee that line 38 of `cfout.do` will not become line 42 in a later version.

Issues have much functionality: they can be categorized using labels and "milestones," referenced in other issues/commits, and assigned to specific users. There is much more to say on how issues can be used: see [here](https://guides.github.com/features/issues/) for GitHub's take on the topic, and [here](https://github.com/PovertyAction/github-training/issues/2) for an example issue from this GitHub training repository. For your purposes as a code checker &mdash; if there is an issue with the code, start with GitHub issues!

### In-line notes

With *in-line notes*, you can add comments to specific lines of code. Say you have a question about a line of code or want to propose a tweak, for instance, fixing a typo or adding an option to the command &mdash; an in-line note is one way to do so.

To make an in-line note, you need to navigate to the commit that introduced the line. This is because in-line notes are attached to lines, and each line is associated with a specific file in a specific commit. If the line has been edited multiple times, you need to navigate to the commit that introduced the most recent edit. One way to do so is to go to the repository's main page, then click on the list of commits. But if the originating commit is not recent, this is incovenient. There is a better alternative: from the main page, click on the file that contains the line, then press the `Blame` button. This indicates the commit that introduced each line. Once you have navigated to the line's source commit, click the left of the line (a `+` button appears), and then add your comment. See an example from [IPA's example repository](https://github.com/PovertyAction/IPA_Example/commit/3de6744e3ed9131823ca94cb0b5ace5969a64f8a). Feel free to add your own comment to test it out!

In-line notes are convenient, but there are downsides. While GitHub provides excellent search functionality for issues, it is difficult to search in-line notes or even to retrieve a list of them. This means that if you add a few in-line notes and forget where they are or what they said, it is not easy to figure that out.

There are workarounds, however. If an in-line note mentions an important problem, it is best to also add it as an issue. That issue can simply link to the line of code and the associated comment, but by adding the topic as an issue, you help ensure that it will not be overlooked. Alternatively, use the IPA program [`github-download`](https://github.com/PovertyAction/github-download) to download the list of a repository's in-line notes.

As with issues, watchers of a repository will by default automatically receive e-mails about new in-line notes, to which they can reply. You can also [mention](https://github.com/blog/821) (`@`) specific users.

In-line notes are written in Markdown, so as with issues, you can link to other files in the repository or to lines of those files.

See [here](https://github.com/blog/622-inline-commit-notes) for GitHub's take on in-line notes.

Making changes
--------------

For many code checks, issues and in-line notes are sufficient. You notice a problem, then note it and perhaps suggest a change. Then the code author revises the code to address the issue. As the code checker, you then review the new commits/diffs to confirm that the issue has been resolved. If it has, you note that, closing any relevant issues. If it has not, you return to the code author with more comments, again transmitted through GitHub issues or in-line notes.

This process allows for an iterative code check. When you make a suggestion as a code checker, you can actually confirm that the code author has implemented that suggestion, and has done so correctly. You go back and forth until you are convinced that all issues are resolved.

Code checkers often do not write code themselves. However, this is an option. There are two main ways to do this. These require more advanced Git features.

### Branching model

1. First, create a new branch for the code checker to write their own code. Give it a name like `code-check`.

2. The original author, if necessary, can still make changes to the master branch while the code check is ongoing. However, this should be communicated to the code checker, who can then merge those changes into the `code-check` branch, after first looking over the new commits.

3. Changes that the code checker makes on the `code-check` branch can be periodically merged into the master branch using [pull requests](https://help.github.com/articles/using-pull-requests/). This way, the original author and checker can easily discuss proposed changes and decide on which should be integrated into the master branch.
  - The code checker should not unilaterally merge the `code-check` branch into master, but only after discussion with the code author.

4. The code checker may find it more convenient to create a separate branch for each proposed change. Then each change can be discussed separately, and it can easily be arranged that some changes are accepted while others are rejected. If everything is on one branch, this is harder: it's difficult to disentangle the different changes.

5. Continue using issues and in-line notes. These are not associated with branches.

### Forking model

1. A final option is to [fork](https://help.github.com/articles/fork-a-repo/) the original repository &mdash; where you create an exact copy of the original repository. Note that the fork is a completely separate repository as the original, unlike with the branching model, where you are working on the same repository.

2. Like with the branching model, the code checker makes changes to the fork and can submit pull requests to incorporate changes back into the original author's repository.

3. Benefits to this model are that it is impossible for the code checker to directly make changes to the original repository (e.g., you only need read access here, not write) and that the code check is kept in a completely separate repository.

4. However, in general, we would recommend not using this model, given the increased difficulties in keeping the two repositories [synced](https://help.github.com/articles/fork-a-repo/#step-3-configure-git-to-sync-your-fork-with-the-original-spoon-knife-repository) and the fact that in-line notes and/or issues may be less easily shared with the original author.

Summary
-------

To summarize, there are three broad ways to implement code checks in GitHub:

1. Use issues and in-line comments exclusively. Do not create any branches/forks.
  - Easiest to implement, loss of ability to easily write/incorporate new code into original work. But the code check is still iterative, and the code checker can review diffs.

2. Create a new branch on the original repository and submit pull requests between branches. Continue to use issues and in-line notes.
  - Slightly more difficult to implement, but greatest functionality.

3. Create fork and submit pull requests between repositories.
  - Most difficult to implement, should rarely be used.
