# Run this once from the project folder if GitHub rejects the push because of the large CSV.
#
# It keeps the CSV on your computer, removes it from Git tracking, replaces the initial
# local commit with a GitHub-friendly one, and pushes to the configured origin.

git rm --cached -r -- SGJobData.csv

git add .gitignore DATA.md README.md requirements.txt Singapore_Jobs_Career_Switcher_Analytics.ipynb prepare_github_push.ps1

git commit --amend -m "Initial project setup"

git push -u origin main
