**GitHub for Code Checks**
=========================
This guide will summarize how to use GitHub as a tool to implement code checks. If you have questions about this guide or suggestions for improvements, email IPA Research Support at researchsupport@poverty-action.org or submit an issue on [IPA’s GitHub Training repository](https://github.com/PovertyAction/github-training/issues/).

A quick primer on the main components of the guide:

**GitHub** is a version control system that greatly facilitates collaborative code writing and reproducibility. This guide will discuss various aspects of GitHub, but see [here](https://github.com/PovertyAction/github-training/blob/master/resources/GitHub%20User%20Guide.md) for a more general introduction.

**Code checks** broadly encapsulate the process where the original code writer’s work is reviewed by one or more colleagues. The purpose is to catch errors and/or make improvements in the code before the original writer continues analysis.

How can you use GitHub to facilitate code checks? For the purposes of this guide, assume you have been given the task of checking and giving feedback on a collection of code files on GitHub.

**Essential GitHub Concepts for Code Checks:**

1) Utilize the fantastic **GitHub Issues** tracker. In short, start an issue if there is a relatively broad question that you want to raise with the code writer. Say you want to note a file is missing or there is a systematic error across files. An issue can comprise simply text, but it is also easy to link to specific files, or even lines in files. Issues have much functionality: they can be categorized using labels, referenced in other issues/commits, and assigned to specific users. There is much more to say on how issues can be used – see [here](https://guides.github.com/features/issues/) for GitHub's take on the topic, and [here](https://github.com/PovertyAction/github-training/issues/2) for an example issue from IPA’s GitHub training repository. For your purposes as a code checker – if there’s an issue with the code, start with Issues!

2) Use **in-line notes**. These are used to make comments on a specific line of code. Say you want to propose an additional option for a command, or notice a typo, an in-line comment is where you can mark it. Like with Issues, you can notify specific users of your notes (the owner will automatically get an email, even without a notification) and link to other files in the broader repository. To make an in-line note, you need to navigate to a specific commit - either directly through the ‘Commits’ button on the main page, or through the ‘Blame’ after you click on a specific file. Once you do, you’ll see you can click the left of any line of code and then add your comment.  See an example from IPA’s ‘Example’ repository [here](https://github.com/PovertyAction/IPA_Example/commit/3de6744e3ed9131823ca94cb0b5ace5969a64f8a). Feel free to add your own comment to test it out!

Using the above two tools is a great and simple way to implement code checks. There are a few additional points to keep in mind:

•	The code checker needs read/write access to the given repository. See more on permissions [here](https://help.github.com/articles/permission-levels-for-an-organization-repository/).

•	When you link to a given file/line, press the ‘y’ key before copying the link. This makes the link stable (e.g. if a new version of the file is created, the stable link will link to exactly the version as when you made it)

•	For easier browsing/sharing, IPA has developed a simple program to download a list of in-line notes – see **HERE** for more.

**Alternate Models**

What was described above is the simplest model for doing code checks using GitHub: using issues and making in-line notes on the master branch. However, there are several more, somewhat more advanced models that you might want to consider.

**Branching Model:**

1. First, create a new branch for the code checker to write their own code. Call it, for example, code_check

2. The original author, if necessary, can still make changes to the master branch while the code check is ongoing. However, this should be communicated to the code checker, who can then merge those changes into the code_check branch, after first looking over the new commits.

3. Changes that the code checker makes on the code_check branch can be periodically merged into the master branch using [pull requests](https://help.github.com/articles/using-pull-requests/). This way, the original author and checker can easily discuss proposed changes and decide on which should be integrated into the master branch.

4. Issues are not associated with branches, so certainly don’t hesitate to continue using them. In-line notes should be made on the code_check branch, though note the original author will still get notifications whenever comments are made.

**Forking Model:**

1. A final option is to [fork](https://help.github.com/articles/fork-a-repo/) the original repository – where you create an exact copy of the original repository. Note that the fork is a completely separate repository as the original, unlike with the branching model, where you’re working on the same repository.

2. Like with the branching model, the code checker makes changes to the fork and can submit pull requests to incorporate changes back into the original author’s repository.

3. Benefits to this model are that it is impossible for the code checker to directly make changes to the original repository (e.g. you only need read access here, not write) and that the code check is kept in a completely separate repository.

4. However, in general, we would recommend not using this model, given the increased difficulties in keeping the two repositories [synced](https://help.github.com/articles/fork-a-repo/#step-3-configure-git-to-sync-your-fork-with-the-original-spoon-knife-repository), and the fact that in-line notes and/or issues cannot be easily shared with the original author.

To summarize, there are three broad ways to implement code checks in GitHub:

•	**Model 1:** Use issues and in-line comments exclusively. Don’t create any branches/forks. [Easiest to implement, loss of ability to easily write/incorporate new code into original work]

•	**Model 2:** Create a new branch on the original repository and submit pull requests between branches. Use issues and in-line comments, on new branch. [Slightly more difficult to implement, but greatest functionality]

•	**Model 3:** Create fork and submit pull requests between repositories. [Most difficult to implement, should rarely be used]

