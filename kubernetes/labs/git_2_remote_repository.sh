#!/usr/bin/env git

#
#
# git_2_remote_repository.sh
# Sample code push for kubernetes nginx deployment.
# v1.0.0
# 7/10/2019
# r2d2c3p0
#
#

# Add your account information to your local git.
git config --global user.name "r2d2c3p0"
git config --global user.email "r2d2c3p0@users.noreply.github.com"

'''
In Unix systems the end of a line is represented with a line feed (LF). In windows a line is represented with a carriage return (CR) and a line feed (LF) thus (CRLF). when you get code from git that was uploaded from a unix system they will only have an LF.
If you want to turn this warning off, type this in the git command line

git config core.autocrlf true

If you want to make an intelligent decision how git should handle this, read the documentation
Formatting and whitespace issues are some of the more frustrating and subtle problems that many developers encounter when collaborating, especially cross-platform. It’s very easy for patches or other collaborated work to introduce subtle whitespace changes because editors silently introduce them, and if your files ever touch a Windows system, their line endings might be replaced. Git has a few configuration options to help with these issues.

core.autocrlf
If you’re programming on Windows and working with people who are not (or vice-versa), you’ll probably run into line-ending issues at some point. This is because Windows uses both a carriage-return character and a linefeed character for newlines in its files, whereas Mac and Linux systems use only the linefeed character. This is a subtle but incredibly annoying fact of cross-platform work; many editors on Windows silently replace existing LF-style line endings with CRLF, or insert both line-ending characters when the user hits the enter key.

Git can handle this by auto-converting CRLF line endings into LF when you add a file to the index, and vice versa when it checks out code onto your filesystem. You can turn on this functionality with the core.autocrlf setting. If you’re on a Windows machine, set it to true – this converts LF endings into CRLF when you check out code:

$ git config --global core.autocrlf true
If you’re on a Linux or Mac system that uses LF line endings, then you don’t want Git to automatically convert them when you check out files; however, if a file with CRLF endings accidentally gets introduced, then you may want Git to fix it. You can tell Git to convert CRLF to LF on commit but not the other way around by setting core.autocrlf to input:

$ git config --global core.autocrlf input
This setup should leave you with CRLF endings in Windows checkouts, but LF endings on Mac and Linux systems and in the repository.

If you’re a Windows programmer doing a Windows-only project, then you can turn off this functionality, recording the carriage returns in the repository by setting the config value to false:

$ git config --global core.autocrlf false 
'''

# Read above for below command.
git config --global core.autocrlf true

# Clone the repository to local workspace.
git clone https://github.com/r2d2c3p0/kubernetes.git

# Perform operations, staging, etc.
cd kubernetes/
mkdir pods
view nginx-deployment.yaml pods/

# Prepare for push -> add and commit.
git add .
git commit -m "pods: nginx"

# Uncheck Block command line pushes that expose my email
git push origin master

#end_git_2_remote_repository.sh